import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:may_uikit/may_uikit.dart';
import '../models/toeic_score.dart';
import '../providers/user_provider.dart';
import '../widgets/dynamic_island_notification.dart';
import '../widgets/liquid_glass_app_bar.dart';
import '../theme/liquid_glass_theme.dart';

class AddScoreScreen extends StatefulWidget {
  final ToeicScore? existingScore;
  const AddScoreScreen({super.key, this.existingScore});

  @override
  State<AddScoreScreen> createState() => _AddScoreScreenState();
}

class _AddScoreScreenState extends State<AddScoreScreen> {
  final _formKey = GlobalKey<FormState>();
  late int _listeningScore;
  late int _readingScore;
  int? _speakingScore;
  int? _writingScore;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _listeningScore = widget.existingScore?.listeningScore ?? 0;
    _readingScore = widget.existingScore?.readingScore ?? 0;
    _speakingScore = widget.existingScore?.speakingScore;
    _writingScore = widget.existingScore?.writingScore;
    _selectedDate = widget.existingScore?.date ?? DateTime.now();
  }

  void _saveScore() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newScore = ToeicScore(
        id: widget.existingScore?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        date: _selectedDate,
        listeningScore: _listeningScore,
        readingScore: _readingScore,
        speakingScore: _speakingScore,
        writingScore: _writingScore,
      );
      final userProvider = context.read<UserProvider>();
      if (widget.existingScore != null) {
        userProvider.updateScore(newScore);
        DynamicIslandNotification.show(
          context,
          title: 'Thành công',
          message: 'Đã cập nhật điểm số thành công!',
          type: NotificationType.success,
        );
      } else {
        userProvider.addScore(newScore);
        DynamicIslandNotification.show(
          context,
          title: 'Thành công',
          message: 'Đã thêm điểm số mới!',
          type: NotificationType.success,
        );
      }

      final targetScore = userProvider.currentUser?.targetScore ?? 500;
      final isHitAim = newScore.calculateTotal(userProvider.currentUser?.isFourSkills ?? false) >= targetScore;

      Navigator.pop(context, isHitAim);
    }
  }

  Widget _buildScoreField({
    required String? initialValue,
    required String label,
    required IconData icon,
    required Color color,
    required int maxScore,
    required int step,
    required FormFieldSetter<String> onSaved,
  }) {
    return TextFormField(
      initialValue: initialValue,
      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: color, size: 22),
        suffixText: 'điểm',
        suffixStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
        helperText: 'Tối đa $maxScore điểm (bội số của $step)',
        helperStyle: TextStyle(color: Colors.white.withValues(alpha: 0.45)),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.05),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: color, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Vui lòng nhập điểm';
        final val = int.tryParse(value);
        if (val == null || val < 0 || val > maxScore) return 'Điểm phải từ 0 - $maxScore';
        if (val % step != 0) return 'Phải là bội số của $step';
        return null;
      },
      onSaved: onSaved,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final isFourSkills = userProvider.currentUser?.isFourSkills ?? false;
    final topPadding = LiquidGlassTheme.getAppBarContentTop(context, 16);

    return LiquidGlassScaffoldWrapper(
      appBar: LiquidGlassAppBar(
        title: widget.existingScore != null ? 'Cập nhật điểm' : 'Thêm điểm TOEIC',
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, topPadding, 16, 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LiquidGlassContainer(
                borderRadius: 24,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date Picker Tile
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: LiquidGlassTheme.primaryAccent.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.calendar_month_rounded, color: LiquidGlassTheme.primaryAccent, size: 22),
                      ),
                      title: const Text('Ngày thi', style: TextStyle(color: Colors.white70, fontSize: 13)),
                      subtitle: Text(
                        DateFormat('dd/MM/yyyy').format(_selectedDate),
                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(Icons.chevron_right_rounded, color: Colors.white54),
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          setState(() => _selectedDate = picked);
                        }
                      },
                    ),
                    const Divider(color: Colors.white12),
                    const SizedBox(height: 12),

                    // Listening Score
                    _buildScoreField(
                      initialValue: _listeningScore > 0 ? _listeningScore.toString() : null,
                      label: 'Điểm Nghe (Listening)',
                      icon: Icons.headphones_rounded,
                      color: LiquidGlassTheme.scoreListening,
                      maxScore: 495,
                      step: 5,
                      onSaved: (val) => _listeningScore = int.parse(val!),
                    ),
                    const SizedBox(height: 16),

                    // Reading Score
                    _buildScoreField(
                      initialValue: _readingScore > 0 ? _readingScore.toString() : null,
                      label: 'Điểm Đọc (Reading)',
                      icon: Icons.menu_book_rounded,
                      color: LiquidGlassTheme.scoreReading,
                      maxScore: 495,
                      step: 5,
                      onSaved: (val) => _readingScore = int.parse(val!),
                    ),

                    if (isFourSkills) ...[
                      const SizedBox(height: 16),
                      _buildScoreField(
                        initialValue: _speakingScore != null && _speakingScore! > 0 ? _speakingScore.toString() : null,
                        label: 'Điểm Nói (Speaking)',
                        icon: Icons.mic_rounded,
                        color: LiquidGlassTheme.scoreSpeaking,
                        maxScore: 200,
                        step: 10,
                        onSaved: (val) => _speakingScore = int.parse(val!),
                      ),
                      const SizedBox(height: 16),
                      _buildScoreField(
                        initialValue: _writingScore != null && _writingScore! > 0 ? _writingScore.toString() : null,
                        label: 'Điểm Viết (Writing)',
                        icon: Icons.edit_note_rounded,
                        color: LiquidGlassTheme.scoreWriting,
                        maxScore: 200,
                        step: 10,
                        onSaved: (val) => _writingScore = int.parse(val!),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 24),
              GlassButtonV2(
                title: widget.existingScore != null ? 'CẬP NHẬT ĐIỂM' : 'LƯU ĐIỂM SỐ',
                icon: const Icon(Icons.check_circle_outline_rounded, color: Colors.white, size: 20),
                onTap: _saveScore,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
