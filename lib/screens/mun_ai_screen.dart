import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../providers/user_provider.dart';
import '../models/mun_ai_chat.dart';

class MunAIScreen extends StatefulWidget {
  const MunAIScreen({super.key});

  @override
  State<MunAIScreen> createState() => _MunAIScreenState();
}

class _MunAIScreenState extends State<MunAIScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  late GenerativeModel _model;
  final ScrollController _scrollController = ScrollController();
  
  MunAIChatSession? _currentSession;
  bool _isSidebarOpen = false;

  String get _apiKey => dotenv.env['GEMINI_API_KEY'] ?? '';

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(model: 'gemini-2.5-flash', apiKey: _apiKey);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initOrLoadLastSession();
    });
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
      _currentSession = MunAIChatSession(messages: [
        MunAIChatMessage(
            role: 'model',
            text:
                'Chào bạn! Mình là Mun AI. Mình có thể giúp bạn phân tích điểm số và đưa ra lời khuyên học tập TOEIC. Bạn muốn hỏi gì về kết quả của mình không?')
      ]);
    });
  }

  void _loadSession(MunAIChatSession session) {
    setState(() {
      _currentSession = session;
      _isSidebarOpen = false; // Đóng sidebar khi chọn
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

  Future<void> _generateTitleForSession(String firstMessage) async {
    try {
      final prompt =
          "Tóm tắt tin nhắn sau của người dùng thành một tiêu đề ngắn gọn (không quá 6 chữ). Chỉ trả về tiêu đề, không có dấu ngoặc kép hay giải thích thêm.\nTin nhắn: $firstMessage";
      final response = await _model.generateContent([Content.text(prompt)]);
      if (response.text != null && response.text!.isNotEmpty) {
        setState(() {
          _currentSession!.title = response.text!.trim().replaceAll('"', '');
        });
        if (!mounted) return;
        context.read<UserProvider>().saveChatSession(_currentSession!);
      }
    } catch (e) {
      debugPrint("Lỗi tạo tiêu đề: $e");
    }
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _isLoading || _currentSession == null) return;

    if (_apiKey == 'YOUR_GEMINI_API_KEY' || _apiKey.isEmpty) {
      setState(() {
        _currentSession!.messages.add(MunAIChatMessage(role: 'user', text: text));
        _currentSession!.messages.add(
          MunAIChatMessage(
            role: 'model',
            text: 'Vui lòng cấu hình Gemini API Key trong thư mục assets/.env để bắt đầu chat nhé!',
          ),
        );
      });
      _controller.clear();
      _scrollToBottom();
      return;
    }

    bool isFirstUserMessage =
        _currentSession!.messages.where((m) => m.role == 'user').isEmpty;

    setState(() {
      _currentSession!.messages.add(MunAIChatMessage(role: 'user', text: text));
      _isLoading = true;
    });
    _controller.clear();
    _scrollToBottom();

    // Lưu phiên chat ngay khi có thay đổi
    context.read<UserProvider>().saveChatSession(_currentSession!);

    try {
      final userProvider = context.read<UserProvider>();
      final currentUser = userProvider.currentUser;

      String contextPromt = "";
      // Nếu là câu hỏi đầu tiên, nhồi thêm Context vào hệ thống
      if (isFirstUserMessage) {
        contextPromt = """
BẠN LÀ MUN AI - CHUYÊN GIA TƯ VẤN TOEIC.
HỆ THỐNG ĐÃ CẤP QUYỀN CHO BẠN TRUY CẬP DỮ LIỆU SAU ĐÂY CỦA NGƯỜI DÙNG:
""";
        if (currentUser != null) {
          contextPromt += "1. Tên người dùng: ${currentUser.name}\n";
          contextPromt += "2. Mục tiêu điểm số: ${currentUser.targetScore}\n";
          if (currentUser.scores.isNotEmpty) {
            contextPromt += "3. Lịch sử bài thi gần nhất:\n";
            for (var s in currentUser.scores.take(5)) {
              contextPromt +=
                  "   - Ngày ${DateFormat('dd/MM/yyyy').format(s.date)}: Listening: ${s.listeningScore}, Reading: ${s.readingScore}, Tổng: ${s.totalScore}\n";
            }
            contextPromt += "\nNHIỆM VỤ CỦA BẠN:";
            contextPromt +=
                "\n- Phân tích sự tiến bộ hoặc sa sút dựa trên lịch sử điểm số.";
            contextPromt +=
                "\n- Dựa vào mục tiêu để đưa ra lộ trình cụ thể.";
            contextPromt +=
                "\n- TUYỆT ĐỐI KHÔNG được trả lời rằng bạn không có quyền truy cập dữ liệu.";
          } else {
            contextPromt +=
                "3. Người dùng này chưa có dữ liệu điểm số nào.\n";
          }
        }
        contextPromt += "\nCâu hỏi của người dùng: $text";
      } else {
        contextPromt = text;
      }

      // Format lại lịch sử ngoại trừ tin nhắn người dùng vừa gửi
      List<Content> history = _currentSession!.messages
          .take(_currentSession!.messages.length - 1)
          .map((m) => Content(m.role, [TextPart(m.text)]))
          .toList();

      final chat = _model.startChat(history: history);
      final response = await chat.sendMessage(Content.text(contextPromt));

      setState(() {
        _currentSession!.messages.add(MunAIChatMessage(
            role: 'model',
            text: response.text ?? 'Xin lỗi, mình không nhận được phản hồi.'));
        _isLoading = false;
      });

      // Lưu lại sau khi AI trả lời
      context.read<UserProvider>().saveChatSession(_currentSession!);

      // Yêu cầu AI tóm tắt Title nếu là tin nhắn đầu tiên
      if (isFirstUserMessage) {
        _generateTitleForSession(text);
      }
    } catch (e) {
      debugPrint('Mun AI Error Details: $e');
      setState(() {
        _currentSession!.messages.add(MunAIChatMessage(
            role: 'model', text: 'Đã có lỗi xảy ra từ máy chủ Gemini: $e'));
        _isLoading = false;
      });
    }
    _scrollToBottom();
  }

  void _deleteSession(String sessionId) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa cuộc trò chuyện?'),
        content: const Text('Bạn có chắc chắn muốn xóa đoạn chat này không? Dữ liệu không thể khôi phục.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<UserProvider>().deleteChatSession(sessionId);
              
              if (_currentSession?.id == sessionId) {
                final userProvider = context.read<UserProvider>();
                final history = userProvider.currentUser?.chatHistory ?? [];
                final remaining = history.where((s) => s.id != sessionId).toList();
                
                if (remaining.isNotEmpty) {
                  _loadSession(remaining.first);
                } else {
                  _createNewSession();
                }
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Xóa'),
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
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Chat Mới'),
              onPressed: _createNewSession,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
              ),
            ),
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              final session = history[index];
              final isSelected = session.id == _currentSession?.id;
              return ListTile(
                selected: isSelected,
                selectedTileColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                leading: const Icon(Icons.chat_bubble_outline),
                title: Text(
                  session.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal),
                ),
                subtitle: Text(
                  DateFormat('dd/MM HH:mm').format(session.createdAt),
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20),
                  color: Colors.redAccent,
                  onPressed: () => _deleteSession(session.id),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                onTap: () => _loadSession(session),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_currentSession == null) {
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
          // Giao diện Sidebar thò thụt
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
            width: _isSidebarOpen ? 250 : 0,
            child: ClipRect(
              child: Container(
                width: 250,
                color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
                child: _buildSidebarContent(),
              ),
            ),
          ),
          // Khung Chat chính
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
                        alignment:
                            isUser ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isUser
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(20).copyWith(
                              bottomRight:
                                  isUser ? const Radius.circular(0) : null,
                              bottomLeft:
                                  !isUser ? const Radius.circular(0) : null,
                            ),
                          ),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          child: Text(
                            msg.text,
                            style: TextStyle(
                              color: isUser
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Hỏi Mun AI...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
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
}
