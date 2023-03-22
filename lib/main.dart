import 'package:flutter/material.dart';

import 'Screens/Welcome.dart';
import 'Screens/Signin.dart';
import 'Screens/Signup.dart';
import 'Screens/Profile.dart';
import 'Screens/Home.dart';
import 'Screens/AIDiagnosis.dart';

Future<void> main() async {
  runApp(MyApp());
/*
  final request = http.MultipartRequest(
    'POST',
    Uri.parse('https://brain-tumor-api-rrh3.onrender.com/'),
  );

  request.files.add(
    await http.MultipartFile.fromPath(
      'image', // NOTE - this value must match the 'file=' at the start of -F
      "/storage/emulated/0/Download/no_tumor.jpg",
      contentType: MediaType('image', 'jpeg'),
    ),
  );

  final response = await http.Response.fromStream(await request.send());

  print(response.body);

  final Uint8List inputImg =
      (await rootBundle.load("assets/img/glioma.jpg")).buffer.asUint8List();
  final decoder = JpegDecoder();
  final decodedImg = decoder.decode(inputImg);
  final decodedBytes = decodedImg?.getBytes(order: ChannelOrder.rgb);
  print(decodedBytes);
  List<List<List<int>>> imgArr = [];
  for (int y = 0; y < decodedImg!.height; y++) {
    imgArr.add([]);
    print("width${decodedImg.width}");
    for (int x = 0; x < decodedImg.width; x++) {
      int red = decodedBytes![y * decodedImg.width * 3 + x * 3];
      int green = decodedBytes[y * decodedImg.width * 3 + x * 3 + 1];
      int blue = decodedBytes[y * decodedImg.width * 3 + x * 3 + 2];
      //int alp = decodedBytes[y*decodedImg.width*3 + x*3 + 3];
      imgArr[y].add([red, green, blue]);
    }
  }
  //print(imgArr);*/
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        SigninScreen.id: (context) => SigninScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        AIDiagnosisScreen.id: (context) => AIDiagnosisScreen(),
        ProfileScreen.id: (context) => ProfileScreen()
      },
      initialRoute: AIDiagnosisScreen.id,
    );
  }
}
