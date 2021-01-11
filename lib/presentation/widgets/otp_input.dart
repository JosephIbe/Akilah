import 'package:flutter/material.dart';

class OTPInput extends StatelessWidget {

  final FocusNode focusInput;
  OTPInput({this.focusInput});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
      ),
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          maxLength: 1,
          maxLines: 1,
          autofocus: false,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none
          ),
          onSubmitted: (value) {
            FocusScope.of(context).requestFocus(focusInput);
          },
        ),
      ),
    );
  }
}
