class ToeicScoreConverter {
  /// Chuyển đổi số câu đúng sang điểm thang 5-495 (Dựa trên bảng quy đổi chuẩn ETS)
  /// [correctCount] là số câu đúng từ 0-100
  /// [isListening] true nếu là Listening, false nếu là Reading
  static int convertToScale(int correctCount, bool isListening) {
    if (correctCount <= 0) return 5;
    if (correctCount >= 100) return 495;

    // Bảng quy đổi rút gọn (xấp xỉ)
    // Thực tế mỗi đề có bảng quy đổi riêng, nhưng đây là bảng chuẩn tham khảo
    if (isListening) {
      if (correctCount >= 96) return 495;
      if (correctCount >= 91) return 490;
      if (correctCount >= 86) return 450;
      if (correctCount >= 81) return 400;
      if (correctCount >= 71) return 350;
      if (correctCount >= 61) return 300;
      if (correctCount >= 51) return 250;
      if (correctCount >= 41) return 200;
      if (correctCount >= 31) return 150;
      if (correctCount >= 21) return 100;
      if (correctCount >= 11) return 50;
      return 5 + (correctCount * 5);
    } else {
      // Reading thường thấp hơn một chút ở cùng số câu đúng
      if (correctCount >= 96) return 495;
      if (correctCount >= 91) return 485;
      if (correctCount >= 86) return 440;
      if (correctCount >= 81) return 390;
      if (correctCount >= 71) return 340;
      if (correctCount >= 61) return 285;
      if (correctCount >= 51) return 230;
      if (correctCount >= 41) return 175;
      if (correctCount >= 31) return 120;
      if (correctCount >= 21) return 65;
      if (correctCount >= 11) return 30;
      return 5 + (correctCount * 4);
    }
  }

  // Hàm nội suy mịn hơn để tránh nhảy điểm quá lớn
  static int convertToScaleFine(int correctCount, bool isListening) {
    if (correctCount <= 0) return 5;
    if (correctCount >= 98) return 495;
    
    // Tính toán xấp xỉ theo đường cong
    double score;
    if (isListening) {
      score = correctCount * 5.0;
    } else {
      score = correctCount * 4.9;
    }
    
    // Làm tròn về bội số của 5
    int finalScore = ((score / 5).round() * 5);
    if (finalScore < 5) return 5;
    if (finalScore > 495) return 495;
    return finalScore;
  }
}
