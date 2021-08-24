import 'package:flutter/cupertino.dart';

class DetailProvider extends ChangeNotifier {
  bool isFavorited = false;
  bool get getIsFavorited {
    return isFavorited;
  }

  void setIsfavorited(bool fav) {
    isFavorited = fav;
    notifyListeners();
  }

  void setDefault() {
    isFavorited = false;
  }
}
