import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:easy_adapt/data/data.dart';
import 'package:easy_adapt/state/calculator_state.dart';
import 'package:easy_adapt/state/calculator_total_state.dart';
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

  shortData() {
    var tempR = {};
    var tempL = {};

    Provider.of<ResultState>(context).data['presc'].forEach((e) {
      if (e['right'] == true) {
        tempR = e;
      } else {
        tempL = e ?? {};
      }
    });
    setState(() {
      dataF = [tempR, tempL];
    });
  }

  String textModalButton = t.calculatorConfirmSendCalendarModalButton;

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
                const SizedBox(
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
            patients_card_model(
                Provider.of<ResultState>(context).data['user']['nombre'],
                Provider.of<ResultState>(context).data['user']['correo']),
            const SizedBox(
              height: 20,
            ),
            Text(
              t.savePresTitle1,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              getTextRight(),
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            dataF[0]['right'] == true
                ? productModelConfirm(
                    dataF[0]['product']['namePS'],
                    dataF[0]['product']['descriptionPS'],
                    dataF[0]['product']['imagePS'])
                : Container(),
            const SizedBox(
              height: 20,
            ),
            Text(
              t.savePresTitle2,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              getTextLeft(),
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            dataF[0]['right'] == false || dataF[1]['right'] == false
                ? dataF[1] != {}
                    ? productModelConfirm(
                        dataF[1]['product']['namePS'],
                        dataF[1]['product']['descriptionPS'],
                        dataF[1]['product']['imagePS'])
                    : Container()
                : Container(),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    textModalButton =
                        t.calculatorConfirmSendCalendarModalButton;
                  });
                  showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (BuildContext context, setState) {
                            return AlertDialog(
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () async {
                                          if (textModalButton !=
                                              t.calculatorConfirmSendCalendarModalButton) {
                                            Navigator.pushNamed(
                                                context, '/layout');
                                          } else {
                                            //////POST PRESCRIPTION
                                            ///
                                            ///
                                            ///
                                            await postPrescription();
                                            setState(() {
                                              textModalButton = t
                                                  .calculatorConfirmSendCalendarModalButton2;
                                            });

                                            // print(Provider.of<ResultState>(context,
                                            //         listen: false)
                                            //     .data['user']);
                                            if (dataF[0]['product'] != null &&
                                                dataF[1]['product'] != null) {
                                              if (int.parse(dataF[0]['product']
                                                      ['daysPS']) >
                                                  int.parse(dataF[1]['product']
                                                      ['daysPS'])) {
                                                final Event event = Event(
                                                    title:
                                                        'Easy adapt - ${Provider.of<ResultState>(context, listen: false).data['user']['nombre']}',
                                                    description:
                                                        '${t.calculatorConfirmSendCalendar1}  ${dataF[0]['product']['namePS']} ${t.calculatorConfirmSendCalendar2} ${Provider.of<ResultState>(context, listen: false).data['user']['nombre']} ${t.calculatorConfirmSendCalendar3}  ',
                                                    startDate: DateTime.now(),
                                                    endDate: DateTime.now().add(
                                                        Duration(
                                                            days: int.parse(dataF[
                                                                            1][
                                                                        'product'] !=
                                                                    null
                                                                ? dataF[1]
                                                                        [
                                                                        'product']
                                                                    ['daysPS']
                                                                : "0"))));

                                                Add2Calendar.addEvent2Cal(
                                                    event);
                                              } else {
                                                final Event event = Event(
                                                    title:
                                                        'Easy adapt - ${Provider.of<ResultState>(context, listen: false).data['user']['nombre']}',
                                                    description:
                                                        '${t.calculatorConfirmSendCalendar1} ${dataF[1]['product']['namePS']} ${t.calculatorConfirmSendCalendar2} ${Provider.of<ResultState>(context, listen: false).data['user']['nombre']} ${t.calculatorConfirmSendCalendar3}  ',
                                                    startDate: DateTime.now(),
                                                    endDate: DateTime.now().add(
                                                        Duration(
                                                            days: int.parse(dataF[
                                                                            0][
                                                                        'product'] !=
                                                                    null
                                                                ? dataF[0]
                                                                        [
                                                                        'product']
                                                                    ['daysPS']
                                                                : "0"))));

                                                Add2Calendar.addEvent2Cal(
                                                    event);
                                              }
                                            } else {
                                              final Event event = Event(
                                                  title:
                                                      'Easy adapt - ${Provider.of<ResultState>(context, listen: false).data['user']['nombre']}',
                                                  description:
                                                      '${t.calculatorConfirmSendCalendar1} ${dataF[0]['product'] != null ? dataF[0]['product']['namePS'] : dataF[1]['product']['namePS']} ${t.calculatorConfirmSendCalendar2} ${Provider.of<ResultState>(context, listen: false).data['user']['nombre']} ${t.calculatorConfirmSendCalendar3} ',
                                                  startDate: DateTime.now(),
                                                  endDate: DateTime.now().add(Duration(
                                                      days: int.parse(dataF[0]
                                                                  ['product'] !=
                                                              null
                                                          ? dataF[0]['product']
                                                              ['daysPS']
                                                          : dataF[1]['product']
                                                              ['daysPS']))));

                                              Add2Calendar.addEvent2Cal(event);
                                            }

                                            // final Event event = Event(
                                            //   title:
                                            //       'Easy adapt - ${Provider.of<ResultState>(context, listen: false).data['user']['nombre']}',
                                            //   description: 'Event description',
                                            //   startDate: DateTime.now(),
                                            //   endDate: DateTime.now(),
                                            // );

                                            // Add2Calendar.addEvent2Cal(event);
                                          }
                                        },
                                        child: Text(textModalButton))
                                  ],
                                )
                              ],
                              title: Text(
                                t.calculatorConfirmSendCalendarModal1,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: Text(
                                  "${t.calculatorConfirmSendCalendarModal2} ${getDateTexModal()} ${t.calculatorConfirmSendCalendarModal3} ${Provider.of<ResultState>(context).data['user']['nombre']}, ${t.calculatorConfirmSendCalendarModal4} "),
                            );
                          },
                        );
                      });
                },
                child: Container(
                  width: 180,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(129, 181, 178, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Center(
                    child: Text(
                      t.savePresSave,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      )),
    );
  }

  calcNextDate() {
    if (dataF[0]['product'] != null && dataF[1]['product'] != null) {
      if (int.parse(dataF[0]['product']['daysPS']) >
          int.parse(dataF[1]['product']['daysPS'])) {
        if (dataF[1]['product'] != null) {
          print(DateTime.now().add(Duration(
              days: int.parse(dataF[1]['product'] != null
                  ? dataF[1]['product']['daysPS']
                  : "0"))));
          return DateTime.now()
              .add(Duration(
                  days: int.parse(dataF[1]['product'] != null
                      ? dataF[1]['product']['daysPS']
                      : "0")))
              .toString()
              .split(' ')[0]
              .toString();
        }
      } else {
        if (dataF[1]['product'] != null) {
          print(DateTime.now().add(Duration(
              days: int.parse(dataF[0]['product'] != null
                  ? dataF[0]['product']['daysPS']
                  : "0"))));
          return DateTime.now()
              .add(Duration(
                  days: int.parse(dataF[0]['product'] != null
                      ? dataF[0]['product']['daysPS']
                      : "0")))
              .toString()
              .split(' ')[0]
              .toString();
        } else {
          print(DateTime.now().add(Duration(
              days: int.parse(dataF[0]['product'] != null
                  ? dataF[0]['product']['daysPS']
                  : dataF[1]['product']['daysPS']))));
          return DateTime.now()
              .add(Duration(
                  days: int.parse(dataF[0]['product'] != null
                      ? dataF[0]['product']['daysPS']
                      : dataF[1]['product']['daysPS'])))
              .toString()
              .split(' ')[0]
              .toString();
        }
      }
    }
  }

  postPrescription() async {
    if (dataF[0]['right'] == true) {
      switch (Provider.of<CalculatorTotalState>(context, listen: false)
          .dataRight['type']) {
        case 'Spherical':
          var response = await Data().setPrescription(
              Provider.of<ResultState>(context, listen: false).data['user']
                  ['id'],
              dataF[0]['product']['namePS'],
              calcNextDate(),
              0,
              getTextRight(),
              dataF[0]['product']['idPS'],
              dataF[0]['product']['daysPS'],
              '',
              '');
          print(response);
          print('spherical');
          break;
        case 'Toric':
          var response = await Data().setPrescription(
              Provider.of<ResultState>(context, listen: false).data['user']
                  ['id'],
              dataF[0]['product']['namePS'],
              calcNextDate(),
              0,
              getTextRight(),
              dataF[0]['product']['idPS'],
              dataF[0]['product']['daysPS'],
              '',
              '');
          print(response);
          break;
        case 'Multifocal':
          break;
        case 'Monovision':
          break;

        default:
          return '';
      }
    }

    ///Izquierdo
    if (dataF[0]['right'] == false || dataF[1]['right'] == false) {
      if (dataF[1] != {}) {
        switch (Provider.of<CalculatorTotalState>(context, listen: false)
            .dataLeft['type']) {
          case 'Spherical':
            var response = await Data().setPrescription(
                Provider.of<ResultState>(context, listen: false).data['user']
                    ['id'],
                dataF[1]['product']['namePS'],
                calcNextDate(),
                1,
                getTextLeft(),
                dataF[1]['product']['idPS'],
                dataF[1]['product']['daysPS'],
                '',
                '');
            print(response);
            break;
          case 'Toric':
            var response = await Data().setPrescription(
                Provider.of<ResultState>(context, listen: false).data['user']
                    ['id'],
                dataF[1]['product']['namePS'],
                calcNextDate(),
                1,
                getTextLeft(),
                dataF[1]['product']['idPS'],
                dataF[1]['product']['daysPS'],
                '',
                '');
            print(response);
            break;
          case 'Multifocal':
            break;
          case 'Monovision':
            break;

          default:
            return '';
        }
      }
    }
  }

  patients_card_model(title, mail) {
    return Container(
        width: double.infinity,
        child: Card(
          elevation: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
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

  getTextRight() {
    // Provider.of<CalculatorState>(context).calculator_data['type'] ==
    //                   'esfericos'
    //               ? '${Provider.of<CalculatorState>(context).calculator_data['right']['esphereRound']} / ${Provider.of<CalculatorState>(context).calculator_data['right']['distance']} '
    //               : Provider.of<CalculatorState>(context)
    //                           .calculator_data['type'] ==
    //                       'torico'
    //                   ? '${Provider.of<CalculatorState>(context).calculator_data['right']['esphereRound']} / ${Provider.of<CalculatorState>(context).calculator_data['right']['cylinderRound']} * ${Provider.of<CalculatorState>(context).calculator_data['right']['axisF']}  '
    //                   : ""

    switch (Provider.of<CalculatorTotalState>(context, listen: false)
        .dataRight['type']) {
      case 'Spherical':
        return '${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['esphereRound']} / ${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['distance']} ';
      case 'Toric':
        return '${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['esphereRound']} / ${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['cylinderRound']} * ${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['axisF']}';
      case 'Multifocal':
        return '';
      case 'Monovision':
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['response']['typeCalc'] ==
            'Spherical') {
          return '';
        } else {
          return '';
        }

      default:
        return '';
    }
  }

  getTextLeft() {
    // Provider.of<CalculatorState>(context).calculator_data['type'] ==
    //                   'esfericos'
    //               ? '${Provider.of<CalculatorState>(context).calculator_data['right']['esphereRound']} / ${Provider.of<CalculatorState>(context).calculator_data['right']['distance']} '
    //               : Provider.of<CalculatorState>(context)
    //                           .calculator_data['type'] ==
    //                       'torico'
    //                   ? '${Provider.of<CalculatorState>(context).calculator_data['right']['esphereRound']} / ${Provider.of<CalculatorState>(context).calculator_data['right']['cylinderRound']} * ${Provider.of<CalculatorState>(context).calculator_data['right']['axisF']}  '
    //                   : ""

    switch (Provider.of<CalculatorTotalState>(context, listen: false)
        .dataLeft['type']) {
      case 'Spherical':
        return '${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['esphereRound']} / ${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['distance']} ';
      case 'Toric':
        return '${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['esphereRound']} / ${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['cylinderRound']} * ${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['axisF']}';
      case 'Multifocal':
        return '';
      case 'Monovision':
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['response']['typeCalc'] ==
            'Spherical') {
          return '';
        } else {
          return '';
        }

      default:
        return '';
    }
  }

  getDateTexModal() {
    if (dataF[0]['product'] != null && dataF[1]['product'] != null) {
      if (int.parse(dataF[0]['product']['daysPS']) >
          int.parse(dataF[1]['product']['daysPS'])) {
        var time = DateTime.now().add(Duration(
            days: int.parse(dataF[1]['product'] != null
                ? dataF[1]['product']['daysPS']
                : "0")));
        return time.toLocal().toString().split(' ')[0];
      } else {
        var time = DateTime.now().add(Duration(
            days: int.parse(dataF[0]['product'] != null
                ? dataF[0]['product']['daysPS']
                : "0")));
        return time.toLocal().toString().split(' ')[0];
      }
    } else {
      var time = DateTime.now().add(Duration(
          days: int.parse(dataF[0]['product'] != null
              ? dataF[0]['product']['daysPS']
              : dataF[1]['product'] != null
                  ? dataF[1]['product']['daysPS']
                  : "0")));
      return time.toLocal().toString().split(' ')[0];
    }
  }
}
