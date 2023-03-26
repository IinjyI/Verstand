import 'dart:convert';

import 'package:http/http.dart' as http;

String? quote, author;
Future<void> getQuote() async {
  final request = http.Request(
      "GET", Uri.parse("https://quotes15.p.rapidapi.com/quotes/random/"));
  Map<String, String> headers = {
    "X-RapidAPI-Key": "811d9c9024msh22792950b0bd82bp1e8ff6jsnf84dfccd2012",
    "X-RapidAPI-Host": "quotes15.p.rapidapi.com"
  };
  request.headers.addAll(headers);
  final response = await http.Response.fromStream(await request.send());
  quote = await json.decode(response.body)["content"];
  author = "- ${await json.decode(response.body)["originator"]["name"]}";
}

///- I don't have any problem if you copy and paste the code but please don't do so if you do not understand how these tasks are implemented.
// - If you have any problem understanding the code, don't hesitate to contact me and I will do my best to explain them.
