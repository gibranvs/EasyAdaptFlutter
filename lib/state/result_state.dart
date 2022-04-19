import 'package:flutter/cupertino.dart';

class ResultState extends ChangeNotifier {
  var data = {};
  var rightValue = true;
  changeData(newData) {
    data = newData;
    notifyListeners();
  }
  editData(bool condition,dataN){
    var temp = [];
    data['presc'].forEach((e){
      if(e['right'] ==condition){
        temp.add(dataN);
      }else{
        temp.add(e);
      }
    });
    data['presc'] = temp;
    notifyListeners();  }
  changeRightValue(r){
    rightValue = r;
    notifyListeners();

  }


}
