import 'package:flutter/foundation.dart';

class SignProvider extends ChangeNotifier {
  bool isLoading = false;
  void loading() {
    isLoading = true;
    notifyListeners();
  }

  void signed() {
    isLoading = false;
    notifyListeners();
  }
}
