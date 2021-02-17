import 'package:akilah/presentation/widgets/course_overview_header.dart';
import 'package:akilah/presentation/widgets/purchase_plan_type.dart';
import 'package:akilah/utils/constants.dart';
import 'package:akilah/utils/strings.dart';
import 'package:flutter/material.dart';

class CourseOverview extends StatefulWidget {
  @override
  _CourseOverviewState createState() => _CourseOverviewState();
}

class _CourseOverviewState extends State<CourseOverview> {
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
                onPlanSelected: () => Navigator.pushNamed(context, takeCourseRoute),
              ),
            ),
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     PurchasePlanCard(
            //       isAllAccess: true,
            //       planType: 'All-Access Pass',
            //       planDescription:
            //       'You will get unlimited access to every course you want for a year',
            //       planPrice: 499.99,
            //       planDuration: 'year',
            //       buttonTitle: 'Get All-Access',
            //       onPlanSelected: () {},
            //     ),
            //     PurchasePlanCard(
            //       isAllAccess: false,
            //       planType: 'Purchase This Class',
            //       planDescription:
            //       'A good choice for whoever wants to learn a single course for a long time',
            //       planPrice: 69.99,
            //       planDuration: 'once',
            //       buttonTitle: 'Purchase This Class',
            //       onPlanSelected: () {},
            //     ),
            //   ],
            // )
            // SliverList(
            //   delegate: SliverChildBuilderDelegate( (context, index) =>  Container(
            //     height: 40,
            //     margin: EdgeInsets.symmetric(vertical: 10),
            //     color: Colors.grey[300],
            //     alignment: Alignment.center,
            //     child: Text('$index item'),
            //   ), childCount: 20),
            // ),
          ],
        ),
      ),
    );
  }
}
