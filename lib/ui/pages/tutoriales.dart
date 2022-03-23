import 'package:easy_adapt/state/player_state.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_logos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../i18n/strings.g.dart';

class TutorialesPage extends StatefulWidget {
  TutorialesPage({Key? key}) : super(key: key);

  @override
  State<TutorialesPage> createState() => _TutorialesPageState();
}

class _TutorialesPageState extends State<TutorialesPage> {
  @override
  Widget build(BuildContext context) {
    final translation = Translations.of(context);

    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getAppBarWithLogos(),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                t.titleTutorialesPage,
                style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 129, 171, 1.0)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ...List.generate(
                t.tutoriales.length,
                (index) => _model_tarjet(
                    t.tutoriales[index].title, t.tutoriales[index].link))
          ],
        ),
      ),
    );
  }

  _model_tarjet(text, video) {
    return GestureDetector(
      onTap: () {
        Provider.of<PlayerState>(context, listen: false).changeUrl(video);
        Navigator.pushNamed(context, '/tutorials/video');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 60,
              color: Colors.blueGrey,
            ),
            Flexible(
                child: Center(
                    child: Text(text,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(25, 180, 201, 1.0)),
                        textAlign: TextAlign.center)))
          ],
        ),
      ),
    );
  }
}
