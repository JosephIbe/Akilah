import 'package:akilah/utils/constants.dart';
import 'package:flutter/material.dart';

class PurchasePlanCard extends StatelessWidget {

  final String planType;
  final String planDescription;
  final double planPrice;
  final String planDuration;
  final String buttonTitle;
  final bool isAllAccess;
  final VoidCallback onPlanSelected;

  PurchasePlanCard({
    this.planType,
    this.planDescription,
    this.planPrice,
    this.planDuration,
    this.buttonTitle,
    this.isAllAccess,
    this.onPlanSelected
  });

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * 0.35,
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 2.0),
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0,),
              Text(planType, style: kPurchasePlanTypeTextStyle,),
              SizedBox(height: 10.0,),
              Text(planDescription, style: kPurchasePlanDescriptionTextStyle,),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text('\$$planPrice', style: kPurchasePlanPriceTextStyle,),
                  // Text('\u{20A6} $planPrice', style: kPurchasePlanPriceTextStyle,),
                  Text('₦ $planPrice', style: kPurchasePlanPriceTextStyle,),
                  Text('/ ', style: kPurchasePlanPriceTextStyle,),
                  Text(planDuration, style: kPurchasePlanPriceTextStyle,),
                ],
              ),
              SizedBox(height: 10.0,),
              ButtonTheme(
                minWidth: width,
                height: height * 0.07,
                child: RaisedButton(
                  onPressed: onPlanSelected,
                  elevation: 2.0,
                  color: isAllAccess ? Theme.of(context).primaryColor : Colors.lightBlueAccent[100],
                  padding: EdgeInsets.all(4.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  child: Text(buttonTitle, style: kPurchasePlanButtonTextStyle,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
