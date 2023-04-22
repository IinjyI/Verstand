import 'dart:convert';

import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

Future<String?> getDiagnosis(imagePath) async {
  final request = http.MultipartRequest(
    'POST',
    Uri.parse('https://brain-tumor-api-rrh3.onrender.com/'),
  );
  request.files.add(
    await http.MultipartFile.fromPath(
      'image',
      imagePath,
      contentType: MediaType('image', 'jpeg'),
    ),
  );
  final response = await http.Response.fromStream(await request.send());
  print(response.body);
  if (response.statusCode == 200) {
    return json.decode(response.body)["diagnosis"];
  }
}
