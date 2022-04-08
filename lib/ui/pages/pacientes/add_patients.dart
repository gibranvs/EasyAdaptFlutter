import 'package:easy_adapt/data/data.dart';
import 'package:easy_adapt/ui/widgets/text_field_model-square.dart';
import 'package:flutter/material.dart';
import '/../i18n/strings.g.dart';

class AddPatientsPage extends StatefulWidget {
  var t;
  AddPatientsPage({Key? key, required this.t}) : super(key: key);

  @override
  State<AddPatientsPage> createState() => _AddPatientsPageState();
}

class _AddPatientsPageState extends State<AddPatientsPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _surname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 85,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        './assets/logo.png',
                        width: 80,
                        height: 80,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    width: double.infinity,
                    height: 379,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 4, 55, 97),
                        borderRadius: BorderRadius.all(Radius.circular(23))),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.titleAddPatient,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            child: getTextFieldModelSquareWhite(
                                t.hintNameAddPatient, _name),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            child: getTextFieldModelSquareWhite(
                                t.hintLastNameAddPatient, _surname),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            child: getTextFieldModelSquareWhite(
                                t.hintLastEmailAddPatient, _email),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            child: getTextFieldModelSquareWhite(
                                t.hintPhoneAddPatient, _phone),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if (_name.text.isNotEmpty &&
                                      _surname.text.isNotEmpty &&
                                      _phone.text.isNotEmpty &&
                                      _email.text.isNotEmpty) {
                                    var result = await Data().postPatients(
                                        _name.text,
                                        _surname.text,
                                        _phone.text,
                                        _email.text);
                                    if (result) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(t.setPatientTitle),
                                              content:
                                                  Text(t.setPatientSubtitle),
                                              actions: [
                                                FlatButton(
                                                  child: Text('OK'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator
                                                        .pushNamedAndRemoveUntil(
                                                            context,
                                                            '/layout',
                                                            (route) => false);
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                    }
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title:
                                                Text(t.setPatientTitleProblem),
                                            content: Text(
                                                t.setPatientSubtitleProblem),
                                            actions: [
                                              FlatButton(
                                                child: Text('OK'),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          );
                                        });
                                  }
                                },
                                child: Text(
                                  t.buttonAddPatient,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 69, 214, 178),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          width: 70,
          height: 70,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Color.fromRGBO(240, 162, 51, 1.0),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Icon(
                  Icons.close,
                  size: 35,
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Color.fromARGB(255, 57, 100, 241),
          child: SizedBox(
            height: 30,
          ),
        ));
  }

  getTextFieldModelSquareWhite(text, controller) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(fontSize: 18, color: Colors.white),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          errorBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 5))),
    );
  }
}
