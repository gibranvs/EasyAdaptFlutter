import 'package:easy_adapt/ui/widgets/appbar_with_logos.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_text_and_logos.dart';
import 'package:flutter/material.dart';
import '/../i18n/strings.g.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getAppBarWithTextAndLogos(t.titleCatalogPage),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                model('./assets/parents/bandera_argentina.png'),
                model('./assets/parents/bandera_bolivia.png'),
                model('./assets/parents/bandera_brazil.png'),
                model('./assets/parents/bandera_chile.png'),
                model('./assets/parents/bandera_colombia.png'),
                model('./assets/parents/bandera_costarica.png'),
                model('./assets/parents/bandera_ecuador.png'),
                model('./assets/parents/bandera_elsalvador.png'),
                model('./assets/parents/bandera_guatemala.png'),
                model('./assets/parents/bandera_honduras.png'),
                model('./assets/parents/bandera_mexico.png'),
                model('./assets/parents/bandera_nicaragua.png'),
                model('./assets/parents/bandera_panama.png'),
                model('./assets/parents/bandera_paraguay.png'),
                model('./assets/parents/bandera_peru.png'),
                model('./assets/parents/bandera_uruguay.png'),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Center(
                child: Image.asset(
                  './assets/parents/catalogo_unselect.png',
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 200,
                  child: Text(
                    t.unselectTextCatalogPage,
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Row model(image) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 33,
          backgroundImage: AssetImage(image),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
