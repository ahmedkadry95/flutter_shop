import 'package:flutter/widgets.dart';
import 'package:flutter_shop/enums/screen_state.dart';

class BaseController extends ChangeNotifier {
  ViewState _state = ViewState.idel;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
