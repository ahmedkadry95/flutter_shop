import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/texts.dart';

class InputField extends StatefulWidget {
  String label;
  String hint;
  TextInputType inputType;
  bool isPassword;
  TextEditingController controller;

  InputField({
    required this.label,
    required this.hint,
    required this.inputType,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        smallGreyHint1(
          widget.label,
        ),
        TextFormField(
          controller: widget.controller,
          style: const TextStyle(color: Colors.black, fontSize: 17),
          obscureText: isHidden && widget.isPassword,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                    child: isHidden == true
                        ? const Icon(
                            Icons.visibility_off,
                            color: grey,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: grey,
                          ),
                  )
                : const SizedBox(),
            suffixIconConstraints: const BoxConstraints(maxHeight: 20),
          ),
        ),
        const Divider(color: dividerColor, thickness: 1)
      ],
    );
  }
}
