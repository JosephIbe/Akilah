import 'dart:io';

import 'package:akilah/presentation/widgets/course_overview_header.dart';
import 'package:akilah/presentation/widgets/purchase_plan_type.dart';
import 'package:akilah/utils/hexToColor.dart';
import 'package:akilah/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class CourseOverview extends StatefulWidget {
  @override
  _CourseOverviewState createState() => _CourseOverviewState();
}

class _CourseOverviewState extends State<CourseOverview> {

  @override
  void initState() {
    super.initState();
    PaystackPlugin.initialize(publicKey: 'pk_test_2e93480e6a34cdd4543219085e676b3d0e434427');
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: CourseOverviewHeader(
                  minExtent: height * 0.33, maxExtent: height * 0.38),
            ),
            SliverToBoxAdapter(
              child: PurchasePlanCard(
                isAllAccess: true,
                planType: 'All-Access Pass',
                planDescription:
                    'You will get unlimited access to every course you want for a year',
                planPrice: 499.99,
                planDuration: 'year',
                buttonTitle: 'Get All-Access',
                // onPlanSelected: () => chargeAllAccessPurchase(),
                onPlanSelected: () => Navigator.pushNamed(context, takeCourseRoute),
              ),
            ),
            SliverToBoxAdapter(
              child:     PurchasePlanCard(
                isAllAccess: false,
                planType: 'Purchase This Class',
                planDescription:
                'A good choice for whoever wants to learn a single course for a long time',
                planPrice: 69.99,
                planDuration: 'once',
                buttonTitle: 'Purchase This Class',
                onPlanSelected: () => chargeSingleClassPurchase(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  chargeAllAccessPurchase() async {
    Charge charge = Charge()
        ..amount = 500 * 100
        ..reference = _getReference()
        ..email = 'joseph.ibeawuchi@gmail.com';

    CheckoutResponse response = await PaystackPlugin.checkout(
        context,
        charge: charge,
        fullscreen: true,
        method: CheckoutMethod.card
    );

    if (response.status == true) {
      print('Payment Successful');
      print(response.message);
      _showDialog();
      await Navigator.pushNamed(context, takeCourseRoute);
    }  else {
      print('Payment Failed');
      print(response.message);
      _showErrorDialog();
    }

  }

  chargeSingleClassPurchase() async {
    Charge charge = Charge()
      ..amount = 70 * 100
      ..reference = _getReference()
      ..email = 'joseph.ibeawuchi@gmail.com';

    CheckoutResponse response = await PaystackPlugin.checkout(
        context,
        charge: charge,
        fullscreen: true,
        method: CheckoutMethod.card
    );

    if (response.status == true) {
      print('Payment Successful');
      print(response.message);
      _showDialog();
      await Navigator.pushNamed(context, takeCourseRoute);
    }  else {
      print('Payment Failed');
      print(response.message);
      _showErrorDialog();
    }

  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  Dialog successDialog(context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 250.0,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_box,
                color: hexToColor("#41aa5e"),
                size: 90,
              ),
              SizedBox(height: 15),
              Text(
                'Payment Successful \u2714',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Your payment has been successfully",
                style: TextStyle(fontSize: 13),
              ),
              Text("processed.", style: TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return successDialog(context);
      },
    );
  }

  Dialog errorDialog(context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 250.0,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.cancel,
                color: Colors.red,
                size: 90,
              ),
              SizedBox(height: 15),
              Text(
                'Failed to process payment',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Error in processing payment, please try again",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return errorDialog(context);
      },
    );
  }

}