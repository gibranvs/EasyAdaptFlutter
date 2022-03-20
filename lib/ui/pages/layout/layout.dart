import 'package:easy_adapt/ui/pages/calculadora/calculadora.dart';
import 'package:easy_adapt/ui/pages/catalogo/catalog.dart';
import 'package:easy_adapt/ui/pages/pacientes/patients_layout_page.dart';
import 'package:easy_adapt/ui/pages/perfil/perfil.dart';
import 'package:easy_adapt/ui/pages/tutoriales.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_logos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  var t;
  Layout({Key? key, required t}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    CalcInitialPage(),
    CatalogPage(),
    TutorialesPage(),
    PatientsLayoutPage(),
    PerfilPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(children: [
                _widgetOptions.elementAt(_selectedIndex),
                SizedBox(
                  height: 65,
                ),
                _selectedIndex == 3
                    ? SizedBox(
                        height: 100,
                      )
                    : Container()
              ]),
            ),
          ),
          _selectedIndex == 3
              ? Positioned(
                  bottom: 75,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/patients/add-patient');
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(129, 181, 178, 1.0)),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ))
              : Container(),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 65,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(35, 84, 165, 1.0)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      model_bottom(0, 'Calculadora', Icons.calculate_rounded),
                      model_bottom(1, 'Catalogo', Icons.menu_book_sharp),
                      model_bottom(
                          2, 'Tutoriales', Icons.remove_red_eye_rounded),
                      model_bottom(3, 'Pacientes', Icons.list),
                      model_bottom(4, 'Perfil', Icons.person)
                    ],
                  ),
                ),
              ))
        ],
      )),
      // bottomNavigationBar: BottomNavigationBar(
      //   unselectedItemColor: Color.fromRGBO(52, 129, 187, 1.0),
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       backgroundColor: Color.fromRGBO(35, 84, 165, 1.0),
      //       icon: Icon(Icons.calculate_rounded),
      //       label: 'Calculadora',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Color.fromRGBO(35, 84, 165, 1.0),
      //       icon: Icon(Icons.menu_book_sharp),
      //       label: 'Catálogo',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Color.fromRGBO(35, 84, 165, 1.0),
      //       icon: Icon(Icons.remove_red_eye_rounded),
      //       label: 'Tutoriales',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Color.fromRGBO(35, 84, 165, 1.0),
      //       icon: Icon(Icons.list),
      //       label: 'Pacientes',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Color.fromRGBO(35, 84, 165, 1.0),
      //       icon: Icon(
      //         Icons.person,
      //       ),
      //       label: 'Perfil',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }

  GestureDetector model_bottom(index, text, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Icon(
            icon,
            size: 35,
            color: _selectedIndex == index
                ? Color.fromRGBO(240, 162, 51, 1.0)
                : Color.fromRGBO(52, 129, 187, 1.0),
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 13,
                color: _selectedIndex == index
                    ? Color.fromRGBO(240, 162, 51, 1.0)
                    : Color.fromRGBO(52, 129, 187, 1.0),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
