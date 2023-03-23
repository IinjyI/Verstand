import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> getQuote() async {
  final request = http.Request(
      "GET", Uri.parse("https://quotes15.p.rapidapi.com/quotes/random/"));
  Map<String, String> headers = {
    "X-RapidAPI-Key": "811d9c9024msh22792950b0bd82bp1e8ff6jsnf84dfccd2012",
    "X-RapidAPI-Host": "quotes15.p.rapidapi.com"
  };
  request.headers.addAll(headers);
  final response = await http.Response.fromStream(await request.send());
  print(json.decode(response.body)["content"] +
      " by: " +
      json.decode(response.body)["originator"]["name"]);
  return json.decode(response.body)["content"];
}
