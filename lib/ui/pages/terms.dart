import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  var t;

  TermsPage({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border.all(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          t.TitleTermsScreen,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(56, 118, 159, 1.0),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(56, 118, 159, 1.0),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Text(
            'Text',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
