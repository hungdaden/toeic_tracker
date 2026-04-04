import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/toeic_score.dart';
import '../providers/user_provider.dart';
import 'package:intl/intl.dart';

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
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _listeningScore = widget.existingScore?.listeningScore ?? 0;
    _readingScore = widget.existingScore?.readingScore ?? 0;
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
      );
      final userProvider = context.read<UserProvider>();
      if (widget.existingScore != null) {
        userProvider.updateScore(newScore);
      } else {
        userProvider.addScore(newScore);
      }
      
      final targetScore = userProvider.currentUser?.targetScore ?? 500;
      final isHitAim = newScore.totalScore >= targetScore;
      
      Navigator.pop(context, isHitAim);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.existingScore != null ? 'Cập nhật điểm' : 'Thêm điểm TOEIC')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.date_range, color: Colors.blueAccent),
                        title: Text('Ngày thi: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}'),
                        trailing: const Icon(Icons.edit),
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
                      const Divider(),
                      TextFormField(
                        initialValue: widget.existingScore != null ? _listeningScore.toString() : null,
                        decoration: const InputDecoration(
                          labelText: 'Điểm Nghe (Listening)',
                          icon: Icon(Icons.headphones, color: Colors.blueAccent),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Vui lòng nhập điểm';
                          final val = int.tryParse(value);
                          if (val == null || val < 0 || val > 495) return 'Điểm phải từ 0 - 495';
                          if (val % 5 != 0) return 'Phải là bội số của 5';
                          return null;
                        },
                        onSaved: (val) => _listeningScore = int.parse(val!),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        initialValue: widget.existingScore != null ? _readingScore.toString() : null,
                        decoration: const InputDecoration(
                          labelText: 'Điểm Đọc (Reading)',
                          icon: Icon(Icons.menu_book, color: Colors.greenAccent),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Vui lòng nhập điểm';
                          final val = int.tryParse(value);
                          if (val == null || val < 0 || val > 495) return 'Điểm phải từ 0 - 495';
                          if (val % 5 != 0) return 'Phải là bội số của 5';
                          return null;
                        },
                        onSaved: (val) => _readingScore = int.parse(val!),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _saveScore,
                child: Text(widget.existingScore != null ? 'CẬP NHẬT' : 'LƯU ĐIỂM SỐ', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
