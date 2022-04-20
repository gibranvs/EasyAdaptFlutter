
import 'package:easy_adapt/state/result_state.dart';
import 'package:easy_adapt/ui/pages/calculadora/widgets/product_model_confir.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_logos.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_logos_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '/../i18n/strings.g.dart';

class ConfirmPacientResult extends StatefulWidget {
  ConfirmPacientResult({Key? key}) : super(key: key);

  @override
  State<ConfirmPacientResult> createState() => _ConfirmPacientResultState();
}

class _ConfirmPacientResultState extends State<ConfirmPacientResult> {
   var dataF = [];

   @override
   void didChangeDependencies() {
     shortData();
     super.didChangeDependencies();
   }
  shortData(){
     var tempR = {};
     var tempL = {};

     Provider.of<ResultState>(context).data['presc'].forEach((e){
      if(e['right']==true){
        tempR = e;
      }else{
        tempL = e??{};      }
    });
    setState(() {
    dataF = [tempR, tempL];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getAppBarWithLogosWidget(Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color.fromRGBO(56, 118, 159, 1.0),
                    size: 40,
                  ),
                ),
                const    SizedBox(
                  width: 10,
                ),
                    Text(
                  t.savePresTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Color.fromRGBO(56, 118, 159, 1.0),
                  ),
                )
              ],
            )),
            patients_card_model(Provider.of<ResultState>(context).data['user']['nombre'],Provider.of<ResultState>(context).data['user']['correo']),
            const    SizedBox(
              height: 20,
            ),

                Text(
              t.savePresTitle1,
              style:const  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            dataF[0]['right'] == true?
            productModelConfirm(dataF[0]['product']['namePS'],dataF[0]['product']['descriptionPS'],dataF[0]['product']['imagePS']):Container(),
            const    SizedBox(
              height: 20,
            ),
                  Text(
              t.savePresTitle2,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ), dataF[0]['right'] == false ||  dataF[1]['right'] == false?
            dataF[1]!= {} ? productModelConfirm(dataF[1]['product']['namePS'],dataF[1]['product']['descriptionPS'],dataF[1]['product']['imagePS']): Container():Container(),
            const     SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  launch(
                      'https://calendar.google.com/calendar/u/0/r/eventedit?dates=20220226T033000/20220226T040000&ctz=America/Calcutta&location&text=Easy adapt - paciente Nombre del paciente&details=');
                },
                child: Container(
                  width: 180,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(129, 181, 178, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child:  Center(
                    child: Text(
                      t.savePresSave,
                      style:const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const   SizedBox(
              height: 50,
            )
          ],
        ),
      )),
    );
  }

  patients_card_model(title, mail) {
    return Container(
        width: double.infinity,
        child: Card(
          elevation: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const    Image(
                image: AssetImage('./assets/icons/img_usuario.png'),
                width: 80,
                height: 80,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 129, 171, 1.0)),
                    ),
                    Text(
                      mail,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
