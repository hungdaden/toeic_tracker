import 'dart:convert';
import 'dart:io';

void main() async {
  const apiKey = 'AIzaSyCQj3-ju6U9WwdmgQp6uQpCKaVETaCpDSk';
  final url = Uri.parse('https://generativelanguage.googleapis.com/v1beta/models?key=$apiKey');

  try {
    final request = await HttpClient().getUrl(url);
    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();
    
    print('Status Code: ${response.statusCode}');
    print('Response Body: $responseBody');
  } catch (e) {
    print('Failed to make request: $e');
  }
}
