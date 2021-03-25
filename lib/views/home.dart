import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_62wBmqWXtrZhOd",
      "amount": textEditingController.text,
      "name": "Sample App",
      "description": "Payment Gateway for demo app",
      "prefill": {
        "contact": "8080036747",
        "email": "pranalipardeshi30@gmail.com",
        "external": {
          "wallet": ["paytm"]
        }
      }
    };
    try {
      print("razopay api called");
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlePaymentSuccess() {
    print('Payment SUccessful');
    Toast.show('Payment Successful', context);
  }

  void handlePaymentError() {
    print('Payment Error');
    Toast.show("Payment Error", context);
  }

  void handleExternalWallet() {
    print('External Wallet');
    Toast.show("External Wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Razor Pay Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: 'Enter Amount'),
            ),
            SizedBox(height: 12),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                print("Button Pressed");
                openCheckout();
              },
              child: Text(
                'Pay Now',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
