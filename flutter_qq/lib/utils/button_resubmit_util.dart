import 'dart:math';

class ResubmitDeal {
  bool isResubmit;
  static DateTime lastPopTime;

 static bool resubmitDealFunction() {
    if (lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: 12)) {
      lastPopTime = DateTime.now();
      return false;
    } else {
      lastPopTime = DateTime.now();

      return true;
    }
  }

//  if(lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: 2)){
//  lastPopTime = DateTime.now();
//  _payOrder(context);
//  }else{
//  lastPopTime = DateTime.now();
//  MyUtils.showMessage("请勿重复点击！");
//  }

}
