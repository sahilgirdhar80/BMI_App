import 'package:flutter/material.dart';

import 'Constants.dart';
import 'input_page.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key, required this.onTap, required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        // padding: EdgeInsets.only(bottom: 20),
        height: bottomcontainerheight,
        width: double.infinity,
        child: Center(
          child: Text(
            "Calculate",
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
