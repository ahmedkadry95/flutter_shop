import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

void reportProblemBottomSheetMenu(context) {
  TextEditingController errorText = TextEditingController();
  showModalBottomSheet<dynamic>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Wrap(
            runSpacing: 25,
            spacing: 20,
            children: [
              Row(
                children: [
                  Text(
                    'Report for problem',
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      // NavigationServices.goBack(context: context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              ReportTextField(
                errorText: errorText,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: sendButton(text: 'Send').onTap(() async {
                        final mailtoLink = Mailto(
                          to: [
                            'ahmedyoussefkadry95@gmail.com',
                          ],
                          subject: '',
                          body: errorText.text,
                        );

                        await launch('$mailtoLink');
                      }),
                    ),
                    widthSpace(5),
                    Expanded(
                      flex: 1,
                      child: cancelButton().onTap(
                        () {
                          // NavigationServices.goBack(context: context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}



class ReportTextField extends StatelessWidget {
  ReportTextField({required this.errorText, Key? key}) : super(key: key);
  final maxLines = 5;
  TextEditingController errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: maxLines * 20.0,
        child: TextField(
          controller: errorText,
          decoration: const InputDecoration(
            hintText: 'Write your problem',
            hintStyle: TextStyle(color: Color(0xffC7CCD5)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffC7CCD5), width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffC7CCD5), width: 1.0),
            ),
          ),
          maxLines: maxLines,
        ),
      ),
    );
  }
}




Widget cancelButton() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 19),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey)),
    child: const Text(
      'Cansel',
      style: TextStyle(color: Colors.grey),
    ),
  );
}

Widget sendButton({required String text}) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
        color: mainColor, borderRadius: BorderRadius.circular(8)),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
