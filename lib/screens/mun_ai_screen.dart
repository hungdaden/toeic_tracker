import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/user_provider.dart';
import '../models/mun_ai_chat.dart';
import '../models/toeic_score.dart';

class MunAIScreen extends StatefulWidget {
  const MunAIScreen({super.key});

  @override
  State<MunAIScreen> createState() => _MunAIScreenState();
}

class _MunAIScreenState extends State<MunAIScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  GenerativeModel? _model;
  
  final String _basePrompt = 'Bạn là Mun AI, trợ lý học tập TOEIC. Hãy trả lời chuyên nghiệp và hữu ích, sử dụng tiếng Việt.';
  String _adminPrompt = '';
  
  final ScrollController _scrollController = ScrollController();

  MunAIChatSession? _currentSession;
  bool _isSidebarOpen = false;

  String get _apiKey => dotenv.env['GEMINI_API_KEY'] ?? '';

  @override
  void initState() {
    super.initState();
    _loadAIConfig();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initOrLoadLastSession();
    });
  }

  Future<void> _loadAIConfig() async {
    try {
      final doc = await FirebaseFirestore.instance.collection('config').doc('system').get();
      String modelName = 'gemini-2.0-flash';
      if (doc.exists) {
        final data = doc.data()!;
        modelName = data['aiModel'] ?? 'gemini-2.0-flash';
        _adminPrompt = data['aiSystemPrompt'] ?? '';
      }
      
      setState(() {
        _model = GenerativeModel(model: modelName, apiKey: _apiKey);
      });
    } catch (e) {
      setState(() {
        _model = GenerativeModel(model: 'gemini-2.0-flash', apiKey: _apiKey);
      });
    }
  }

  void _initOrLoadLastSession() {
    final userProvider = context.read<UserProvider>();
    final currentUser = userProvider.currentUser;
    if (currentUser != null && currentUser.chatHistory.isNotEmpty) {
      _loadSession(currentUser.chatHistory.first);
    } else {
      _createNewSession();
    }
  }

  void _createNewSession() {
    setState(() {
      _currentSession = MunAIChatSession(
        messages: [
          MunAIChatMessage(
            role: 'model',
            text: 'Chào bạn! Mình là Mun AI. Mình đã sẵn sàng hỗ trợ bạn học TOEIC rồi đây!',
          ),
        ],
      );
      _isSidebarOpen = false;
    });
  }

  void _loadSession(MunAIChatSession session) {
    setState(() {
      _currentSession = session;
      _isSidebarOpen = false;
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _isLoading || _currentSession == null || _model == null) return;

    setState(() {
      _currentSession!.messages.add(MunAIChatMessage(role: 'user', text: text));
      
      // Tự động đặt tên cho chat nếu là tin nhắn đầu tiên của user
      if (_currentSession!.title == 'New Chat' || _currentSession!.title == 'Chat Mới') {
        _currentSession!.title = text.length > 30 ? '${text.substring(0, 27)}...' : text;
      }
      
      _isLoading = true;
    });
    _controller.clear();
    _scrollToBottom();

    try {
      final userProvider = context.read<UserProvider>();
      final currentUser = userProvider.currentUser;

      String combinedPrompt = "SYSTEM INSTRUCTION:\n$_basePrompt\n";
      if (_adminPrompt.isNotEmpty) {
        combinedPrompt += "ADDITIONAL ADMIN INSTRUCTIONS:\n$_adminPrompt\n";
      }
      
      String contextPromt = "$combinedPrompt\n";
      
      bool isFirstMessage = _currentSession!.messages.length == 1; // Chỉ có message của model ban đầu

      if (currentUser != null) {
        contextPromt += "DỮ LIỆU HỌC VIÊN HIỆN TẠI:\n";
        contextPromt += "- Tên: ${currentUser.name}\n";
        contextPromt += "- Mục tiêu: ${currentUser.targetScore} điểm\n";
        contextPromt += "- Hệ đào tạo: ${currentUser.isFourSkills ? '4 kỹ năng (L-R-S-W)' : '2 kỹ năng (L-R)'}\n";
        contextPromt += "- Chuỗi ngày học (Streak): ${currentUser.currentStreak} ngày\n";
        
        if (currentUser.scores.isNotEmpty) {
          contextPromt += "- Lịch sử 5 bài thi gần nhất:\n";
          final sortedScores = List<ToeicScore>.from(currentUser.scores)
            ..sort((a, b) => b.date.compareTo(a.date));
          final recentScores = sortedScores.take(5).toList();
          
          for (var s in recentScores) {
            final dateStr = DateFormat('dd/MM/yyyy').format(s.date);
            if (currentUser.isFourSkills) {
              contextPromt += "  + $dateStr: L:${s.listeningScore}, R:${s.readingScore}, S:${s.speakingScore ?? 0}, W:${s.writingScore ?? 0} (Tổng: ${s.calculateTotal(true)})\n";
            } else {
              contextPromt += "  + $dateStr: L:${s.listeningScore}, R:${s.readingScore} (Tổng: ${s.calculateTotal(false)})\n";
            }
          }
        }
      }

      if (isFirstMessage) {
        contextPromt += "\nLƯU Ý QUAN TRỌNG: Đây là tin nhắn đầu tiên của cuộc hội thoại. Hãy bắt đầu câu trả lời của bạn bằng duy nhất 1 dòng chứa tiêu đề tóm tắt ngắn gọn cuộc trò chuyện này (không quá 5 từ) đặt trong ngoặc vuông [ ], ví dụ: [Mẹo thi Part 1]. Sau đó mới xuống dòng và trả lời bình thường.";
      }
      
      contextPromt += "\nCÂU HỎI HỌC VIÊN: $text";

      List<Content> history = _currentSession!.messages
          .take(_currentSession!.messages.length - 1)
          .map((m) => Content(m.role, [TextPart(m.text)]))
          .toList();

      final chat = _model!.startChat(history: history);
      final response = await chat.sendMessage(Content.text(contextPromt));

      String responseText = response.text ?? 'Xin lỗi, mình không nhận được phản hồi.';
      
      // Xử lý tách tiêu đề nếu là tin nhắn đầu tiên
      if (isFirstMessage && responseText.contains('[') && responseText.contains(']')) {
        final start = responseText.indexOf('[');
        final end = responseText.indexOf(']');
        if (start < end) {
          final title = responseText.substring(start + 1, end);
          setState(() {
            _currentSession!.title = title;
          });
          // Loại bỏ phần tiêu đề khỏi nội dung hiển thị
          responseText = responseText.substring(end + 1).trim();
        }
      }

      setState(() {
        _currentSession!.messages.add(
          MunAIChatMessage(
            role: 'model',
            text: responseText,
          ),
        );
        _isLoading = false;
      });

      context.read<UserProvider>().saveChatSession(_currentSession!);
    } catch (e) {
      setState(() {
        _currentSession!.messages.add(
          MunAIChatMessage(role: 'model', text: 'Đã có lỗi xảy ra: $e'),
        );
        _isLoading = false;
      });
    }
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentSession == null || _model == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mun AI'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(_isSidebarOpen ? Icons.menu_open : Icons.menu),
          onPressed: () => setState(() => _isSidebarOpen = !_isSidebarOpen),
        ),
      ),
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isSidebarOpen ? 250 : 0,
            child: ClipRect(
              child: Container(
                width: 250,
                color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
                child: _buildSidebarContent(),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: _currentSession!.messages.length,
                    itemBuilder: (context, index) {
                      final msg = _currentSession!.messages[index];
                      final isUser = msg.role == 'user';
                      return Align(
                        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: isUser
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                          child: Text(
                            msg.text,
                            style: TextStyle(
                              color: isUser
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: SpinKitThreeBounce(color: Colors.white, size: 20),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 50), // Tăng padding bottom lên 50
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Hỏi Mun AI...',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          onSubmitted: (_) => _sendMessage(),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: _sendMessage,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarContent() {
    final userProvider = context.watch<UserProvider>();
    final history = userProvider.currentUser?.chatHistory ?? [];

    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Chat Mới'),
              onPressed: _createNewSession,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(45)),
            ),
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              final session = history[index];
              return ListTile(
                title: Text(session.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Text(DateFormat('dd/MM HH:mm').format(session.createdAt), style: const TextStyle(fontSize: 12)),
                onTap: () => _loadSession(session),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20, color: Colors.grey),
                  onPressed: () {
                    // Xác nhận xóa
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Xóa cuộc trò chuyện?'),
                        content: const Text('Hành động này không thể hoàn tác.'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('HỦY')),
                          TextButton(
                            onPressed: () {
                              userProvider.deleteChatSession(session.id);
                              Navigator.pop(ctx);
                              if (_currentSession?.id == session.id) {
                                _createNewSession();
                              }
                            },
                            child: const Text('XÓA', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
