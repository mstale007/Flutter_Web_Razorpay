import 'dart:html';
import 'dart:ui' as ui;
//conditional import
import 'package:payment_gateway/utils/UiFake.dart'
    if (dart.library.html) 'dart:ui' as ui;
import 'package:flutter/material.dart';

String razorpay_key = "rzp_test_62wBmqWXtrZhOd";
String amount = "1000";

class RazorPayWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //register view factory
    ui.platformViewRegistry.registerViewFactory("rzp-html", (int viewId) {
      IFrameElement element = IFrameElement();
//Event Listener
      window.onMessage.forEach((element) {
        print('Event Received in callback: ${element.data}');
        if (element.data == 'MODAL_CLOSED') {
          Navigator.pop(context);
        } else if (element.data == 'SUCCESS') {
          print('PAYMENT SUCCESSFULL!!!!!!!');
        }
        print(element.data);
      });

      element.requestFullscreen();
      element.src = 'assets/html/payment.html?amt=' +
          amount +
          '&rpay_key=' +
          razorpay_key;
      element.style.border = 'none';
      print(element.attributes);
      return element;
    });
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return Container(
        child: HtmlElementView(viewType: 'rzp-html'),
      );
    }));
  }
}
