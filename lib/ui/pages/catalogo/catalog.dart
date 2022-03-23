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
                model(),
                model(),
                model(),
                model(),
                model(),
                model(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row model() {
    return Row(
      children: [
        CircleAvatar(
          radius: 33,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
