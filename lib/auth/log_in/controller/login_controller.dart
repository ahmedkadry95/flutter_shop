import 'package:flutter/material.dart';
import 'package:flutter_shop/base_controller.dart';

class LogInController extends BaseController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
}
