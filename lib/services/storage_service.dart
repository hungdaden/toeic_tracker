import 'dart:typed_data'; // Dùng thư viện này thay cho dart:io
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Đổi File thành Uint8List
  Future<String?> uploadAvatar(Uint8List fileBytes, String userId) async {
    try {
      Reference ref = _storage.ref().child('avatars/$userId.jpg');

      // SỬ DỤNG putData() THAY VÌ putFile()
      UploadTask uploadTask = ref.putData(fileBytes);

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Lỗi khi upload ảnh: $e");
      return null;
    }
  }
}
