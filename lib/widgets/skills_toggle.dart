import 'package:flutter/material.dart';

class SkillsToggle extends StatelessWidget {
  final bool isFourSkills;
  final ValueChanged<bool> onChanged;

  const SkillsToggle({
    super.key,
    required this.isFourSkills,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () => onChanged(!isFourSkills),
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[800] : Colors.grey[300],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  alignment: isFourSkills
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(26),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: !isFourSkills
                                ? Theme.of(context).colorScheme.onPrimary
                                : (isDark ? Colors.white70 : Colors.black54),
                          ),
                          child: const Text('2 Kỹ Năng'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: isFourSkills
                                ? Theme.of(context).colorScheme.onPrimary
                                : (isDark ? Colors.white70 : Colors.black54),
                          ),
                          child: const Text('4 Kỹ Năng'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          isFourSkills ? 'Nghe, Nói, Đọc, Viết' : 'Nghe, Đọc',
          style: TextStyle(
            fontSize: 13,
            color: isDark ? Colors.grey[400] : Colors.grey[600],
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
