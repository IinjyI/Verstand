import 'package:flutter/foundation.dart';

class NavBottomProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void updateIndex(indx) {
    selectedIndex = indx;
    notifyListeners();
  }
}
