import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/exam_model.dart';
import '../utils/toeic_score_converter.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../models/toeic_score.dart';

class ExamSessionScreen extends StatefulWidget {
  final ToeicExam exam;
  const ExamSessionScreen({super.key, required this.exam});

  @override
  State<ExamSessionScreen> createState() => _ExamSessionScreenState();
}

class _ExamSessionScreenState extends State<ExamSessionScreen> {
  late Map<int, int> _userAnswers;
  late int _secondsRemaining;
  Timer? _timer;
  int _currentQuestionIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Map<QuestionPart, List<ToeicQuestion>>? _groupedQuestions;
  Widget? _cachedDrawerContent;
  bool _isSidebarOpen = false;

  final AudioPlayer _audioPlayer = AudioPlayer();
  PlayerState _playerState = PlayerState.stopped;
  Duration _audioDuration = Duration.zero;
  Duration _audioPosition = Duration.zero;
  String? _currentlyPlayingUrl;

  @override
  void initState() {
    super.initState();
    _userAnswers = {};
    _secondsRemaining = widget.exam.timeLimitMinutes * 60;
    _startTimer();
    _preGroupQuestions();

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) setState(() => _playerState = state);
    });
    _audioPlayer.onDurationChanged.listen((d) {
      if (mounted) setState(() => _audioDuration = d);
    });
    _audioPlayer.onPositionChanged.listen((p) {
      if (mounted) setState(() => _audioPosition = p);
    });
    _audioPlayer.onPlayerComplete.listen((_) {
      if (mounted) {
        setState(() {
          _playerState = PlayerState.stopped;
          _audioPosition = Duration.zero;
        });
      }
    });
  }

  void _preGroupQuestions() {
    final groups = <QuestionPart, List<ToeicQuestion>>{};
    for (var part in QuestionPart.values) {
      groups[part] = [];
    }
    for (var q in widget.exam.questions) {
      groups[q.part]?.add(q);
    }
    _groupedQuestions = groups;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        _submitExam();
      }
    });
  }

  void _changeQuestionIndex(int newIndex) {
    if (_playerState == PlayerState.playing) {
      _audioPlayer.stop();
      _currentlyPlayingUrl = null;
    }
    setState(() {
      _currentQuestionIndex = newIndex;
      _cachedDrawerContent = null;
      _isSidebarOpen = false;
    });
  }

  Future<void> _toggleAudio(String audioUrl) async {
    if (_currentlyPlayingUrl == audioUrl && _playerState == PlayerState.playing) {
      await _audioPlayer.pause();
    } else if (_currentlyPlayingUrl == audioUrl && _playerState == PlayerState.paused) {
      await _audioPlayer.resume();
    } else {
      await _audioPlayer.stop();
      _currentlyPlayingUrl = audioUrl;
      try {
        if (audioUrl.startsWith('assets/')) {
          final path = audioUrl.substring(7); // Remove 'assets/' prefix
          await _audioPlayer.play(AssetSource(path));
        } else if (audioUrl.startsWith('http://') || audioUrl.startsWith('https://')) {
          await _audioPlayer.play(UrlSource(audioUrl));
        } else {
          await _audioPlayer.play(DeviceFileSource(audioUrl));
        }
      } catch (e) {
        debugPrint('Audio play error: $e');
      }
    }
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final mins = seconds ~/ 60;
    final secs = seconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  void _submitExam() {
    _timer?.cancel();
    
    int correctLC = 0;
    int correctRC = 0;

    for (var q in widget.exam.questions) {
      if (_userAnswers[q.number] == q.correctOptionIndex) {
        if (q.number <= 100) correctLC++; else correctRC++;
      }
    }

    final lcScore = ToeicScoreConverter.convertToScaleFine(correctLC, true);
    final rcScore = ToeicScoreConverter.convertToScaleFine(correctRC, false);

    final result = ExamResult(
      examId: widget.exam.id,
      examTitle: widget.exam.title,
      userAnswers: _userAnswers,
      correctListening: correctLC,
      correctReading: correctRC,
      listeningScore: lcScore,
      readingScore: rcScore,
      timestamp: DateTime.now(),
    );

    _showResultDialog(result);
  }

  void _confirmSubmit() {
    final unanswered = <int>[];
    for (var q in widget.exam.questions) {
      if (!_userAnswers.containsKey(q.number)) {
        unanswered.add(q.number);
      }
    }

    if (unanswered.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          title: const Text('Chưa hoàn thành', style: TextStyle(color: Colors.white)),
          content: Text(
            'Bạn còn ${unanswered.length} câu chưa trả lời:\n${unanswered.take(10).join(', ')}${unanswered.length > 10 ? '...' : ''}\n\nBạn vẫn muốn nộp bài chứ?',
            style: const TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Quay lại làm tiếp'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _submitExam();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Vẫn nộp bài', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    } else {
      _submitExam();
    }
  }

  Future<bool> _onWillPop() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text('Thoát phòng thi?', style: TextStyle(color: Colors.white)),
        content: const Text(
          'Tiến độ làm bài của bạn sẽ không được lưu nếu bạn thoát bây giờ. Bạn có chắc chắn muốn thoát không?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Tiếp tục thi'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Thoát', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  void _showResultDialog(ExamResult result) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: const Text('Kết Quả Thi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Tổng điểm: ${result.totalScore}', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF10B981))),
            const SizedBox(height: 12),
            Text('Listening: ${result.listeningScore} (${result.correctListening}/100)', style: const TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            Text('Reading: ${result.readingScore} (${result.correctReading}/100)', style: const TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final userProvider = context.read<UserProvider>();
              userProvider.addScore(ToeicScore(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                date: result.timestamp,
                listeningScore: result.listeningScore,
                readingScore: result.readingScore,
              ));
              Navigator.pop(context); 
              Navigator.pop(context); 
              Navigator.pop(context); 
            },
            child: const Text('Lưu & Thoát', style: TextStyle(color: Color(0xFF818CF8), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _handleKeyPress(RawKeyEvent event) {
    if (event is! RawKeyDownEvent) return;

    final key = event.logicalKey;
    
    if (key == LogicalKeyboardKey.digit1 || key == LogicalKeyboardKey.numpad1) _selectOption(0);
    if (key == LogicalKeyboardKey.digit2 || key == LogicalKeyboardKey.numpad2) _selectOption(1);
    if (key == LogicalKeyboardKey.digit3 || key == LogicalKeyboardKey.numpad3) _selectOption(2);
    if (key == LogicalKeyboardKey.digit4 || key == LogicalKeyboardKey.numpad4) _selectOption(3);

    if (key == LogicalKeyboardKey.arrowLeft) {
      if (_currentQuestionIndex > 0) setState(() => _currentQuestionIndex--);
    }
    if (key == LogicalKeyboardKey.arrowRight) {
      if (_currentQuestionIndex < widget.exam.questions.length - 1) setState(() => _currentQuestionIndex++);
    }
  }

  void _selectOption(int index) {
    final currentQuestion = widget.exam.questions[_currentQuestionIndex];
    setState(() {
      _userAnswers[currentQuestion.number] = index;
      _cachedDrawerContent = null; // Clear cache to reflect new answer in drawer
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.exam.questions[_currentQuestionIndex];
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        if (_isSidebarOpen) {
          setState(() => _isSidebarOpen = false);
          return;
        }
        final shouldPop = await _onWillPop();
        if (shouldPop && mounted) {
          Navigator.of(context).pop();
        }
      },
      child: RawKeyboardListener(
        focusNode: FocusNode()..requestFocus(),
        onKey: _handleKeyPress,
        child: Stack(
          children: [
            Scaffold(
              key: _scaffoldKey,
              backgroundColor: const Color(0xFF121212),
              appBar: AppBar(
                backgroundColor: const Color(0xFF1E1E1E),
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white70),
                  onPressed: () async {
                    if (await _onWillPop()) Navigator.pop(context);
                  },
                ),
                title: Text(
                  _formatTime(_secondsRemaining),
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF818CF8),
                    fontSize: 22,
                  ),
                ),
                actions: [
                  TextButton.icon(
                    onPressed: _confirmSubmit,
                    icon: const Icon(Icons.send_rounded, size: 18, color: Color(0xFF818CF8)),
                    label: const Text(
                      'NỘP BÀI',
                      style: TextStyle(
                        color: Color(0xFF818CF8),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF818CF8).withOpacity(0.1),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4F46E5).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Câu ${currentQuestion.number}/${widget.exam.questions.length}',
                          style: const TextStyle(color: Color(0xFF818CF8), fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: isDesktop
                        ? Row(
                            children: [
                              Expanded(flex: 2, child: _buildQuestionContent(currentQuestion)),
                              VerticalDivider(width: 1, color: Colors.white.withOpacity(0.1)),
                              Expanded(flex: 1, child: _buildAnswerOptions(currentQuestion)),
                            ],
                          )
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                _buildQuestionContent(currentQuestion),
                                _buildAnswerOptions(currentQuestion),
                              ],
                            ),
                          ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1E1E1E),
                      boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10, offset: Offset(0, -5))],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.grid_view_rounded, color: Colors.white70),
                          onPressed: () => setState(() => _isSidebarOpen = true),
                          tooltip: 'Danh sách câu hỏi',
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: _currentQuestionIndex > 0 ? () => _changeQuestionIndex(_currentQuestionIndex - 1) : null,
                          style: TextButton.styleFrom(foregroundColor: Colors.white70),
                          child: const Text('QUAY LẠI', style: TextStyle(letterSpacing: 1.2)),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: _currentQuestionIndex < widget.exam.questions.length - 1 
                            ? () => _changeQuestionIndex(_currentQuestionIndex + 1) 
                            : _confirmSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F46E5),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(
                            _currentQuestionIndex < widget.exam.questions.length - 1 ? 'TIẾP THEO' : 'NỘP BÀI',
                            style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Lớp phủ tối mờ khi mở Sidebar
            if (_isSidebarOpen)
              GestureDetector(
                onTap: () => setState(() => _isSidebarOpen = false),
                child: Container(
                  color: Colors.black54,
                ),
              ),

            // Sidebar Tùy chỉnh (Zero Latency)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              left: _isSidebarOpen ? 0 : -320,
              top: 0,
              bottom: 0,
              child: _buildSidebarContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionContent(ToeicQuestion question) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: const Color(0xFF121212),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF4F46E5).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'PART ${question.part.index + 1}',
                style: const TextStyle(color: Color(0xFF818CF8), fontWeight: FontWeight.bold, letterSpacing: 1.1),
              ),
            ),
            const SizedBox(height: 24),
            if (question.audioUrl != null)
              _buildAudioPlayer(question.audioUrl!),
            if (question.passage != null) ...[
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white10),
                ),
                child: Text(
                  question.passage!,
                  style: const TextStyle(fontSize: 16, height: 1.6, fontStyle: FontStyle.italic, color: Colors.white70),
                ),
              ),
              const SizedBox(height: 24),
            ],
            if (question.imageUrl != null) ...[
              _buildQuestionImage(question.imageUrl!),
              const SizedBox(height: 24),
            ],
            if (question.questionText != null)
              Text(
                question.questionText!,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, height: 1.4, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionImage(String url) {
    Widget imgWidget;
    if (url.startsWith('http://') || url.startsWith('https://')) {
      imgWidget = Image.network(
        url,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (_, __, ___) => _buildImagePlaceholder(url),
      );
    } else if (url.startsWith('assets/')) {
      imgWidget = Image.asset(
        url,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => _buildImagePlaceholder(url),
      );
    } else {
      final file = File(url);
      if (file.existsSync()) {
        imgWidget = Image.file(
          file,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => _buildImagePlaceholder(url),
        );
      } else {
        imgWidget = _buildImagePlaceholder(url);
      }
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white12),
        ),
        child: imgWidget,
      ),
    );
  }

  Widget _buildImagePlaceholder(String url) {
    final fileName = url.split(Platform.pathSeparator).last.split('/').last;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          const Icon(Icons.image_outlined, color: Color(0xFF818CF8), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Hình ảnh minh họa: $fileName',
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAudioPlayer(String audioUrl) {
    final fileName = audioUrl.split(Platform.pathSeparator).last.split('/').last;
    final isThisPlaying = _currentlyPlayingUrl == audioUrl && _playerState == PlayerState.playing;
    final isThisActive = _currentlyPlayingUrl == audioUrl;
    final pos = isThisActive ? _audioPosition : Duration.zero;
    final dur = (isThisActive && _audioDuration > Duration.zero) ? _audioDuration : const Duration(seconds: 30);
    final progress = dur.inMilliseconds > 0 ? (pos.inMilliseconds / dur.inMilliseconds).clamp(0.0, 1.0) : 0.0;

    String formatDuration(Duration d) {
      final mins = d.inMinutes.remainder(60).toString().padLeft(2, '0');
      final secs = d.inSeconds.remainder(60).toString().padLeft(2, '0');
      return '$mins:$secs';
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF818CF8).withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4F46E5).withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _toggleAudio(audioUrl),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isThisPlaying
                      ? [const Color(0xFFEC4899), const Color(0xFFBE185D)]
                      : [const Color(0xFF6366F1), const Color(0xFF4F46E5)],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: (isThisPlaying ? const Color(0xFFEC4899) : const Color(0xFF4F46E5)).withValues(alpha: 0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                isThisPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF38BDF8).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'AUDIO LC',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF38BDF8)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        fileName,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${formatDuration(pos)} / ${formatDuration(dur)}',
                      style: const TextStyle(color: Colors.white60, fontSize: 11, fontFamily: 'monospace'),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 3,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
                    activeTrackColor: const Color(0xFF818CF8),
                    inactiveTrackColor: Colors.white12,
                    thumbColor: const Color(0xFFA5B4FC),
                  ),
                  child: Slider(
                    value: progress,
                    onChanged: (val) {
                      if (isThisActive && dur.inMilliseconds > 0) {
                        final newPos = Duration(milliseconds: (val * dur.inMilliseconds).toInt());
                        _audioPlayer.seek(newPos);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerOptions(ToeicQuestion question) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: const Color(0xFF1E1E1E),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CHỌN ĐÁP ÁN',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white38, letterSpacing: 1.5),
          ),
          const SizedBox(height: 24),
          ...List.generate(question.options.length, (index) {
            final optionLabel = String.fromCharCode(65 + index);
            final isSelected = _userAnswers[question.number] == index;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: InkWell(
                onTap: () => _selectOption(index),
                borderRadius: BorderRadius.circular(12),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF4F46E5).withOpacity(0.1) : const Color(0xFF2D2D2D),
                    border: Border.all(
                      color: isSelected ? const Color(0xFF818CF8) : Colors.white10,
                      width: isSelected ? 2 : 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF4F46E5) : Colors.transparent,
                          border: Border.all(color: isSelected ? const Color(0xFF818CF8) : Colors.white38),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          optionLabel,
                          style: TextStyle(color: isSelected ? Colors.white : Colors.white70, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          question.options[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected ? const Color(0xFF818CF8) : Colors.white70,
                          ),
                        ),
                      ),
                      if (isSelected) const Icon(Icons.check_circle, color: Color(0xFF818CF8)),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSidebarContent() {
    if (_groupedQuestions == null) {
      _preGroupQuestions();
    }
    
    _cachedDrawerContent ??= SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: QuestionPart.values.map((part) {
          final questions = _groupedQuestions![part] ?? [];
          if (questions.isEmpty) return const SizedBox.shrink();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Text(
                      'PART ${part.index + 1}',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF818CF8), letterSpacing: 1.2),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(child: Divider(color: Colors.white10)),
                  ],
                ),
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: questions.map((q) {
                  final globalIndex = widget.exam.questions.indexWhere((element) => element.number == q.number);
                  final isSelected = _currentQuestionIndex == globalIndex;
                  final isAnswered = _userAnswers.containsKey(q.number);

                  return SizedBox(
                    width: 44,
                    height: 44,
                    child: _QuestionBox(
                      number: q.number,
                      isSelected: isSelected,
                      isAnswered: isAnswered,
                      onTap: () => _changeQuestionIndex(globalIndex),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
            ],
          );
        }).toList(),
      ),
    );

    return Material(
      color: Colors.transparent,
      child: Container(
        width: 320,
        color: const Color(0xFF1A1A1A),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
              color: const Color(0xFF262626),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('CÂU HỎI', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1)),
                      const SizedBox(height: 4),
                      Text(
                        'Đã làm: ${_userAnswers.length}/${widget.exam.questions.length}',
                        style: const TextStyle(color: Colors.white38, fontSize: 13),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded, color: Colors.white30),
                    onPressed: () => setState(() => _isSidebarOpen = false),
                  ),
                ],
              ),
            ),
            Expanded(child: _cachedDrawerContent!),
          ],
        ),
      ),
    );
  }
}

class _QuestionBox extends StatelessWidget {
  final int number;
  final bool isSelected;
  final bool isAnswered;
  final VoidCallback onTap;

  const _QuestionBox({
    required this.number,
    required this.isSelected,
    required this.isAnswered,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF4F46E5)
              : (isAnswered ? const Color(0xFF4F46E5).withOpacity(0.15) : const Color(0xFF262626)),
          borderRadius: BorderRadius.circular(8),
          border: isSelected 
              ? Border.all(color: const Color(0xFF818CF8), width: 1.5)
              : null,
        ),
        child: Text(
          '$number',
          style: TextStyle(
            color: isSelected ? Colors.white : (isAnswered ? const Color(0xFF818CF8) : Colors.white30),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
