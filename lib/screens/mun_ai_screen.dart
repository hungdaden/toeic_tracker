import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  GenerativeModel? _model;
  String _systemPrompt = 'Bạn là Mun AI, trợ lý học tập TOEIC. Hãy trả lời chuyên nghiệp và hữu ích.';
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
        _systemPrompt = data['aiSystemPrompt'] ?? _systemPrompt;
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
      _isLoading = true;
    });
    _controller.clear();
    _scrollToBottom();

    try {
      final userProvider = context.read<UserProvider>();
      final currentUser = userProvider.currentUser;

      String contextPromt = "SYSTEM PROMPT: $_systemPrompt\n\n";
      
      if (currentUser != null) {
        contextPromt += "DỮ LIỆU NGƯỜI DÙNG:\n";
        contextPromt += "- Tên: ${currentUser.name}\n";
        contextPromt += "- Mục tiêu: ${currentUser.targetScore}\n";
        if (currentUser.scores.isNotEmpty) {
          contextPromt += "- Lịch sử thi: ${currentUser.scores.length} bài thi gần nhất.\n";
        }
      }
      
      contextPromt += "\nCâu hỏi người dùng: $text";

      List<Content> history = _currentSession!.messages
          .take(_currentSession!.messages.length - 1)
          .map((m) => Content(m.role, [TextPart(m.text)]))
          .toList();

      final chat = _model!.startChat(history: history);
      final response = await chat.sendMessage(Content.text(contextPromt));

      setState(() {
        _currentSession!.messages.add(
          MunAIChatMessage(
            role: 'model',
            text: response.text ?? 'Xin lỗi, mình không nhận được phản hồi.',
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
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
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
              );
            },
          ),
        ),
      ],
    );
  }
}
