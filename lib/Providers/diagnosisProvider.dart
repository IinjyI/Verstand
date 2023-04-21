import 'package:flutter/foundation.dart';

class DiagnosisProvider extends ChangeNotifier {
  bool isProcessing = false;
  void processing() {
    isProcessing = true;
    notifyListeners();
  }

  void done() {
    isProcessing = false;
    notifyListeners();
  }
}
