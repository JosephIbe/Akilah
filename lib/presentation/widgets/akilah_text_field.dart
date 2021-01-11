import 'package:akilah/utils/constants.dart';
import 'package:flutter/material.dart';

class AkilahTextInputField extends StatelessWidget {

  final String labelText;
  final String hintText;
  final bool isPhone;
  final bool isPassword;
  final bool isEnabled;
  final Widget suffixIcon;
  final TextEditingController controller;
  final Function onEditClicked;

  AkilahTextInputField({
    @required this.labelText,
    @required this.hintText,
    @required this.isPhone,
    @required this.isPassword,
    @required this.isEnabled,
    @required this.suffixIcon,
    @required this.controller,
    @required this.onEditClicked
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black, ),
      maxLength: isPhone ? 14 : 25,
      maxLines: 1,
      decoration: loginInputDecors.copyWith(
        counterText: '',
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20.0
        ),
        suffixIcon: suffixIcon,
      ),
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text ,
      controller: controller,
      obscureText: isPassword ? true : false,
      enabled: isEnabled ? true : false,
    );
  }

}
