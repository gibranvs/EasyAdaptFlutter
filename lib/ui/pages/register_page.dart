import 'package:easy_adapt/ui/widgets/text_field_model-square.dart';

import '../../i18n/strings.g.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  var t;

  RegisterPage({Key? key, required this.t}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: Border.all(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          widget.t.titleAppBarRegisterScreen,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(56, 118, 159, 1.0),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: const Color.fromRGBO(56, 118, 159, 1.0),
            )),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  widget.t.titleWelcomeRegisterScreen,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(56, 118, 159, 1.0),
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  widget.t.subtitleWelcomeRegisterScreen,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 25,
                ),
                getTextFieldModelSquare(widget.t.hintTextNameRegisterScreen),
                const SizedBox(
                  height: 18,
                ),
                getTextFieldModelSquare(widget.t.hintTextEmailRegisterScreen),
                const SizedBox(
                  height: 18,
                ),
                getTextFieldModelSquare(
                    widget.t.hintTextPasswordRegisterScreen),
                const SizedBox(
                  height: 18,
                ),
                getTextFieldModelSquare(
                    widget.t.hintTextConfirmPasswordRegisterScreen),
                const SizedBox(
                  height: 18,
                ),
                getTextFieldModelSquare(widget.t.hintTextCountryRegisterScreen),
                const SizedBox(
                  height: 18,
                ),
                getTextFieldModelSquare('CURP/DNI'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(value: false, onChanged: (v) {}),
                    const SizedBox(
                      width: 1,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: widget.t.titleAcceptRegisterScreen,
                          style: const TextStyle(color: Colors.black)),
                      TextSpan(
                          text: ' ${widget.t.subtitleAcceptRegisterScreen}',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/terms');
                            },
                          style: const TextStyle(
                              color: const Color.fromRGBO(56, 118, 159, 1.0),
                              fontWeight: FontWeight.bold))
                    ])),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Color.fromRGBO(129, 181, 178, 1.0)),
              child: Center(
                child: Text(
                  widget.t.titleAppBarRegisterScreen,
                  style: const TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
