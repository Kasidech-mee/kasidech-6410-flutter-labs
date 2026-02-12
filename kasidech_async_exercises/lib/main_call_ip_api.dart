import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  await fetchIPAddress();
}

Future<void> fetchIPAddress() async {
  final url = Uri.parse('https://api.ipify.org?format=json');
  final response = await http.get(url);
  final String ip;

  try {
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      ip = data['ip'];
      print('your ip addres is $ip');
    } else {
      throw Exception('Failed to load IP address');
    }
  } catch (e) {
    throw Exception(e);
  }
}
