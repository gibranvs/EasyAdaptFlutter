import 'package:easy_adapt/state/menu_state.dart';
import 'package:easy_adapt/ui/pages/calculadora/calculadora.dart';
import 'package:easy_adapt/ui/pages/catalogo/catalog.dart';
import 'package:easy_adapt/ui/pages/pacientes/patients_layout_page.dart';
import 'package:easy_adapt/ui/pages/perfil/perfil.dart';
import 'package:easy_adapt/ui/pages/tutoriales.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_logos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';

class Layout extends StatefulWidget {
  var t;
  Layout({Key? key, required t}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    CalcInitialPage(),
    CatalogPage(),
    TutorialesPage(),
    PatientsLayoutPage(),
    PerfilPage()
  ];

  @override
  Widget build(BuildContext context) {
    final translation = Translations.of(context);

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
                _widgetOptions.elementAt(Provider.of<MenuState>(context).index),
                SizedBox(
                  height: 65,
                ),
                Provider.of<MenuState>(context).index == 3
                    ? SizedBox(
                        height: 100,
                      )
                    : Container()
              ]),
            ),
          ),
          Provider.of<MenuState>(context).index == 3
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
                      model_bottom(
                          0,
                          t.calculatorTitleHomeScreen,
                          './assets/icons/calculadora_on.png',
                          './assets/icons/calculadora_off.png',
                          false),
                      model_bottom(
                          1,
                          t.titleCatalogPage,
                          './assets/icons/catalogos_inicio.png',
                          './assets/icons/catalogos_off.png',
                          false),
                      model_bottom(
                          2,
                          t.titleTutorialesPage,
                          Icons.remove_red_eye_rounded,
                          Icons.remove_red_eye_rounded,
                          true),
                      model_bottom(
                          3, t.titlePatientsPage, Icons.list, Icons.list, true),
                      model_bottom(
                          4,
                          t.titleProfilePage,
                          './assets/icons/perfil_on.png',
                          './assets/icons/perfil_off.png',
                          false)
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

  GestureDetector model_bottom(index, text, icon, icon_un_select, isIcon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Provider.of<MenuState>(context, listen: false).changeIndex(index);
        });
      },
      child: Column(
        children: [
          !isIcon!
              ? Image(
                  image: AssetImage(
                    index == Provider.of<MenuState>(context).index
                        ? icon
                        : icon_un_select,
                  ),
                  width: 35,
                  height: 35,
                )
              : Icon(
                  icon,
                  size: 35,
                  color: Provider.of<MenuState>(context).index == index
                      ? Color.fromRGBO(240, 162, 51, 1.0)
                      : Color.fromRGBO(52, 129, 187, 1.0),
                ),
          Text(
            text,
            style: TextStyle(
                fontSize: 13,
                color: Provider.of<MenuState>(context).index == index
                    ? Color.fromRGBO(240, 162, 51, 1.0)
                    : Color.fromRGBO(52, 129, 187, 1.0),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
