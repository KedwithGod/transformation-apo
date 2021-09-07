import 'package:flutter/material.dart';

class GeneralTextDisplay extends StatelessWidget {
  final String inputText;
  final double textFontSize;
  final FontWeight textFontWeight;
  final int noOfTextLine;
  final String textSemanticLabel;
  final Color textColor;


  GeneralTextDisplay(this.inputText,this.textColor, this.noOfTextLine, this.textFontSize,
      this.textFontWeight, this.textSemanticLabel);

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      style: TextStyle(
        color: textColor,
        fontSize:
           (textFontSize),
        fontWeight: textFontWeight,
      ),
      maxLines: noOfTextLine,
      semanticsLabel: textSemanticLabel,
      textAlign: TextAlign.left,
    );
  }
}
