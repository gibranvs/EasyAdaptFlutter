import 'package:easy_adapt/ui/pages/catalogo/pdf_page.dart';
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
  var id = -1;
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
                model('./assets/parents/bandera_argentina.png', 1),
                model('./assets/parents/bandera_bolivia.png', 2),
                model('./assets/parents/bandera_brazil.png', 3),
                model('./assets/parents/bandera_chile.png', 4),
                model('./assets/parents/bandera_colombia.png', 5),
                model('./assets/parents/bandera_costarica.png', 6),
                model('./assets/parents/bandera_ecuador.png', 7),
                model('./assets/parents/bandera_elsalvador.png', 8),
                model('./assets/parents/bandera_guatemala.png', 9),
                model('./assets/parents/bandera_honduras.png', 10),
                model('./assets/parents/bandera_mexico.png', 11),
                model('./assets/parents/bandera_nicaragua.png', 12),
                model('./assets/parents/bandera_panama.png', 13),
                model('./assets/parents/bandera_paraguay.png', 14),
                model('./assets/parents/bandera_peru.png', 15),
                model('./assets/parents/bandera_uruguay.png', 16),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Builder(builder: (context) {
            switch (id) {
              case 1:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_arg.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalogo2.png')),
                );
              case 2:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_bol.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalogo2.png')),
                );
              case 3:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_bra.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalog_bra.png')),
                );
              case 4:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_chi.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalogo2.png')),
                );
              case 5:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_col.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalog_col.png')),
                );
              case 6:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_mex.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalog_mex.png')),
                );
              case 7:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_ecu.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalogo_ecu.png')),
                );
              case 8:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_mex.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalog_mex.png')),
                );
              case 9:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_mex.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalog_mex.png')),
                );
              case 10:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_mex.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalog_mex.png')),
                );
              case 11:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_mex.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalog_mex.png')),
                );
              case 12:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_mex.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalog_mex.png')),
                );
              case 13:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_mex.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalog_mex.png')),
                );
              case 14:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_par.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalogo2.png')),
                );
              case 15:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_peru.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalogo_peru.png')),
                );
              case 16:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFPage(
                                path: './assets/catalog/Catalogo_uru.pdf',
                              )),
                    );
                  },
                  child: Container(
                      child: Image.asset('./assets/catalog/catalogo2.png')),
                );
              default:
                return Column(
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
                );
            }
          })
        ],
      ),
    );
  }

  Row model(image, idN) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              id = idN;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                border: id == idN
                    ? Border.all(color: Colors.black, width: 2)
                    : Border.all(color: Colors.transparent, width: 2),
                shape: BoxShape.circle),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 33,
              backgroundImage: AssetImage(image),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
