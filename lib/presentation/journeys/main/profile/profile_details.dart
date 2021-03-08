import 'package:akilah/presentation/widgets/akilah_text_field.dart';
import 'package:akilah/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:akilah/presentation/widgets/top_banner.dart';
import 'package:akilah/utils/strings.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetails extends StatefulWidget {
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  double width, height;

  @override
  void initState() {
    super.initState();
    _phoneController.text = '+2349087656567';
    _emailController.text = 'akilah123@education.learn';
    _passwordController.text = 'akilah@123456';
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBanner(
                title: actSettings,
                height: height * 0.17,
                hasBackButton: true,
                onBackPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: 30.0,),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      'John Doe',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0, ),
              _buildSectionHeader(title: 'Edit Profile'),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    AkilahTextInputField(
                      isEnabled: false,
                      labelText: 'Phone Number',
                      controller: _phoneController,
                      isPhone: true,
                      isPassword: false,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    ),
                    AkilahTextInputField(
                      isEnabled: false,
                      labelText: 'Email',
                      controller: _emailController,
                      isPhone: false,
                      isPassword: false,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    ),
                    AkilahTextInputField(
                      isEnabled: false,
                      labelText: 'Password',
                      controller: _passwordController,
                      isPhone: false,
                      isPassword: true,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: ()=> handleChangePassword(context),
                        // onPressed: (){},
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    GestureDetector(
                      onTap: ()=> handleLogOut(context),
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        width: width,
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                                bottom: BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ))),
                        child: Center(
                          child: Text(
                            logOut,
                            style: kLogOutTextStyle,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  handleLogOut(BuildContext context) {
    showLogOutDialog(context);
  }

  showLogOutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return Dialog(
          elevation: 4.0,
          child: Container(
            width: width,
            height: 100.0,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'You Sure You Want to Log Out?',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600)
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: RaisedButton(
                        onPressed: () => Navigator.pop(context),
                        color: Colors.grey,
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.w600)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RaisedButton(
                        onPressed: () =>
                            // print('Will Logout'),
                            Navigator.pushNamedAndRemoveUntil
                              (context, loginRoute, (Route<dynamic> route) => false),
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          logOut,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w600)
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }

  handleChangePassword(BuildContext context) {
    print('show edit pwd dialog');
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_)=> Container(
          height: 50.0,
          width: 200.0,
          color: Colors.red,
        )
    );
  }

  _buildSectionHeader({String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      child: Text(
        title,
        style: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
                color: Colors.blueGrey)),
      ),
    );
  }

}
