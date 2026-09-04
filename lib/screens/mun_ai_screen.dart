import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:may_uikit/may_uikit.dart';
import '../providers/user_provider.dart';
import '../models/mun_ai_chat.dart';
import '../models/toeic_score.dart';
import '../theme/liquid_glass_theme.dart';

class MunAIScreen extends StatefulWidget {
  const MunAIScreen({super.key});

  @override
  State<MunAIScreen> createState() => _MunAIScreenState();
}

class _MunAIScreenState extends State<MunAIScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isLoading = false;
  GenerativeModel? _model;

  final String _basePrompt =
      'Bạn là Mun AI, trợ lý học tập TOEIC thông minh, tận tình và thân thiện. Hãy trả lời chuyên nghiệp, hữu ích bằng tiếng Việt.';
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

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
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

      if (mounted) {
        setState(() {
          _model = GenerativeModel(model: modelName, apiKey: _apiKey);
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _model = GenerativeModel(model: 'gemini-2.0-flash', apiKey: _apiKey);
        });
      }
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
            text: 'Chào bạn! Mình là Mun AI 🐱. Mình đã sẵn sàng cùng bạn chinh phục điểm TOEIC mục tiêu rồi đây!',
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
          curve: Curves.easeOutCubic,
        );
      }
    });
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _isLoading || _currentSession == null || _model == null) return;

    setState(() {
      _currentSession!.messages.add(MunAIChatMessage(role: 'user', text: text));

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

      String contextPrompt = "$combinedPrompt\n";
      bool isFirstMessage = _currentSession!.messages.length == 1;

      if (currentUser != null) {
        contextPrompt += "DỮ LIỆU HỌC VIÊN HIỆN TẠI:\n";
        contextPrompt += "- Tên: ${currentUser.name}\n";
        contextPrompt += "- Mục tiêu: ${currentUser.targetScore} điểm\n";
        contextPrompt +=
            "- Hệ đào tạo: ${currentUser.isFourSkills ? '4 kỹ năng (L-R-S-W)' : '2 kỹ năng (L-R)'}\n";
        contextPrompt += "- Chuỗi ngày học (Streak): ${currentUser.currentStreak} ngày\n";

        if (currentUser.scores.isNotEmpty) {
          contextPrompt += "- Lịch sử 5 bài thi gần nhất:\n";
          final sortedScores = List<ToeicScore>.from(currentUser.scores)
            ..sort((a, b) => b.date.compareTo(a.date));
          final recentScores = sortedScores.take(5).toList();

          for (var s in recentScores) {
            final dateStr = DateFormat('dd/MM/yyyy').format(s.date);
            if (currentUser.isFourSkills) {
              contextPrompt +=
                  "  + $dateStr: L:${s.listeningScore}, R:${s.readingScore}, S:${s.speakingScore ?? 0}, W:${s.writingScore ?? 0} (Tổng: ${s.calculateTotal(true)})\n";
            } else {
              contextPrompt +=
                  "  + $dateStr: L:${s.listeningScore}, R:${s.readingScore} (Tổng: ${s.calculateTotal(false)})\n";
            }
          }
        }
      }

      if (isFirstMessage) {
        contextPrompt +=
            "\nLƯU Ý QUAN TRỌNG: Đây là tin nhắn đầu tiên của cuộc hội thoại. Hãy bắt đầu câu trả lời của bạn bằng duy nhất 1 dòng chứa tiêu đề tóm tắt ngắn gọn cuộc trò chuyện này (không quá 5 từ) đặt trong ngoặc vuông [ ], ví dụ: [Mẹo thi Part 1]. Sau đó mới xuống dòng và trả lời bình thường.";
      }

      contextPrompt += "\nCÂU HỎI HỌC VIÊN: $text";

      List<Content> history = _currentSession!.messages
          .take(_currentSession!.messages.length - 1)
          .map((m) => Content(m.role, [TextPart(m.text)]))
          .toList();

      final chat = _model!.startChat(history: history);
      final response = await chat.sendMessage(Content.text(contextPrompt));

      String responseText = response.text ?? 'Xin lỗi, mình không nhận được phản hồi.';

      if (isFirstMessage && responseText.contains('[') && responseText.contains(']')) {
        final start = responseText.indexOf('[');
        final end = responseText.indexOf(']');
        if (start < end) {
          final title = responseText.substring(start + 1, end);
          if (mounted) {
            setState(() {
              _currentSession!.title = title;
            });
          }
          responseText = responseText.substring(end + 1).trim();
        }
      }

      if (mounted) {
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
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _currentSession!.messages.add(
            MunAIChatMessage(role: 'model', text: 'Đã có lỗi xảy ra: $e'),
          );
          _isLoading = false;
        });
      }
    }
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentSession == null || _model == null) {
      return const LiquidGlassScaffoldWrapper(
        child: Center(
          child: CircularProgressIndicator(color: LiquidGlassTheme.purpleAccent),
        ),
      );
    }

    return LiquidGlassScaffoldWrapper(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFFA855F7), Color(0xFF6366F1)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: LiquidGlassTheme.purpleAccent.withValues(alpha: 0.4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Icon(Icons.pets_rounded, size: 14, color: Colors.white),
            ),
            const SizedBox(width: 8),
            const Text('Mun AI Trợ Lý'),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            _isSidebarOpen ? Icons.menu_open_rounded : Icons.menu_rounded,
            color: Colors.white,
          ),
          onPressed: () => setState(() => _isSidebarOpen = !_isSidebarOpen),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_comment_rounded, color: Colors.white),
            tooltip: 'Đoạn chat mới',
            onPressed: _createNewSession,
          ),
          const SizedBox(width: 4),
        ],
      ),
      child: Stack(
        children: [
          // Main Chat Area
          Column(
            children: [
              Expanded(
                child: CommonScrollbarWithIosStatusBarTapDetectorV2(
                  controller: _scrollController,
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                    itemCount: _currentSession!.messages.length,
                    itemBuilder: (context, index) {
                      final msg = _currentSession!.messages[index];
                      return _buildMessageBubble(msg);
                    },
                  ),
                ),
              ),
              if (_isLoading)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.15),
                        width: 0.8,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.pets_rounded, size: 14, color: LiquidGlassTheme.purpleAccent),
                        const SizedBox(width: 10),
                        const Text(
                          'Mun đang suy nghĩ...',
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                        const SizedBox(width: 10),
                        SpinKitThreeBounce(color: Colors.white.withValues(alpha: 0.8), size: 14),
                      ],
                    ),
                  ),
                ),

              // Liquid Glass Chat Composer
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 110),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ChatGlassComposerTextFieldV2(
                        controller: _controller,
                        focusNode: _focusNode,
                        hintText: 'Hỏi Mun AI về TOEIC...',
                        enabled: !_isLoading,
                        maxLines: 4,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ChatGlassIconButtonV2(
                      onTap: _sendMessage,
                      enabled: !_isLoading,
                      size: 44,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color(0xFFA855F7), Color(0xFF6366F1)],
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_upward_rounded,
                            size: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Sliding Glass Sidebar for History
          if (_isSidebarOpen)
            Positioned(
              left: 0,
              top: 0,
              bottom: 100,
              width: 280,
              child: LiquidGlassContainer(
                margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                borderRadius: 24,
                padding: EdgeInsets.zero,
                child: _buildSidebarContent(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(MunAIChatMessage msg) {
    final isUser = msg.role == 'user';

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.80,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(isUser ? 20 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 20),
          ),
          gradient: isUser
              ? const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
                )
              : LinearGradient(
                  colors: [
                    Colors.white.withValues(alpha: 0.12),
                    Colors.white.withValues(alpha: 0.05),
                  ],
                ),
          border: Border.all(
            color: isUser
                ? Colors.white.withValues(alpha: 0.25)
                : Colors.white.withValues(alpha: 0.12),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isUser ? 0.2 : 0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isUser) ...[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.pets_rounded, size: 12, color: LiquidGlassTheme.purpleAccent),
                  const SizedBox(width: 6),
                  Text(
                    'Mun AI',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: LiquidGlassTheme.purpleAccent.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
            ],
            Text(
              msg.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebarContent() {
    final userProvider = context.watch<UserProvider>();
    final history = userProvider.currentUser?.chatHistory ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(Icons.history_rounded, color: Colors.white70, size: 20),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Lịch sử trò chuyện',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close_rounded, color: Colors.white70, size: 20),
                onPressed: () => setState(() => _isSidebarOpen = false),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GlassButtonV2(
            title: 'Cuộc trò chuyện mới',
            icon: const Icon(Icons.add_rounded, size: 18, color: Colors.white),
            onTap: _createNewSession,
          ),
        ),
        const SizedBox(height: 8),
        Divider(color: Colors.white.withValues(alpha: 0.08)),
        Expanded(
          child: history.isEmpty
              ? Center(
                  child: Text(
                    'Chưa có đoạn chat nào',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.4)),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final session = history[index];
                    final isSelected = _currentSession?.id == session.id;

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: isSelected
                            ? LiquidGlassTheme.purpleAccent.withValues(alpha: 0.2)
                            : Colors.transparent,
                        border: isSelected
                            ? Border.all(
                                color: LiquidGlassTheme.purpleAccent.withValues(alpha: 0.4),
                                width: 0.8,
                              )
                            : null,
                      ),
                      child: ListTile(
                        dense: true,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        title: Text(
                          session.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat('dd/MM HH:mm').format(session.createdAt),
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white.withValues(alpha: 0.45),
                          ),
                        ),
                        onTap: () => _loadSession(session),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outline_rounded,
                              size: 18, color: Colors.white.withValues(alpha: 0.5)),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                backgroundColor: LiquidGlassTheme.backgroundSecondary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                title: const Text('Xóa cuộc trò chuyện?'),
                                content: const Text('Hành động này không thể hoàn tác.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(ctx),
                                    child: const Text('HỦY', style: TextStyle(color: Colors.white70)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      userProvider.deleteChatSession(session.id);
                                      Navigator.pop(ctx);
                                      if (_currentSession?.id == session.id) {
                                        _createNewSession();
                                      }
                                    },
                                    child: const Text('XÓA', style: TextStyle(color: Colors.redAccent)),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
