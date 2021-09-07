import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transformationapp/viewModel/LandingViewModel.dart';
import 'package:transformationapp/views/Uielements/Generaltextdisplay.dart';
import 'package:transformationapp/views/Uielements/Generaltextfielddisplay.dart';
import 'package:transformationapp/views/Uielements/shared.dart';

// creating form field for a circle
class RectangularForm extends ViewModelWidget<LandingPageModel> {
  // text editing fields for the offsets in the form
  final offSetX = TextEditingController();
  final offSetY = TextEditingController();
  final length = TextEditingController();
  final breadth = TextEditingController();
  GlobalKey<FormState> rectangleFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, LandingPageModel model) {
    return Form(
      key: rectangleFormKey,
      child: Container(
          width: 321,
          height: 226,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Color.fromRGBO(25, 100, 256,
                    0.46),),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Stack(
            children: [

              Positioned(
                  left: 37,
                  top: 43,
                  child: GeneralTextDisplay(
                      'Offset', Colors.black, 1, 20, FontWeight.w600, 'offset')
              ), Positioned(
                  left: 127,
                  top: 43,
                  child: GeneralTextDisplay('Length',
                      Color.fromRGBO(230, 69, 0, 1.0), 1, 20, FontWeight.w400,
                      'lenght')
              ), Positioned(
                  left: 217,
                  top: 43,
                  child: GeneralTextDisplay('Breadth',
                      Color.fromRGBO(230, 69, 0, 1.0), 1, 20, FontWeight.w400,
                      'Breadth')
              ), Positioned(
                  left: 37,
                  top: 93,
                  child: GeneralTextDisplay(
                      'X', Color.fromRGBO(0, 0, 255, 1.0), 1, 18,
                      FontWeight.bold, 'x on circle')
              ), Positioned(
                  left: 37,
                  top: 137,
                  child: GeneralTextDisplay('Y',
                      Color.fromRGBO(217, 0, 27, 1.0), 1, 18, FontWeight.bold,
                      'y on circle')
              ),
              Positioned(
                left: 73,
                top: 93,
                child: GeneralTextField(
                    TextInputType.numberWithOptions(decimal: true,signed: true),
                    offSetX,
                    '',
                    ':',
                    'number',
                    1,
                    29,
                    41),
              ),
              Positioned(
                left: 73,
                top: 137
                ,
                child: GeneralTextField(
                    TextInputType.numberWithOptions(decimal: true,signed: true),
                    offSetY,
                    '',
                    ':',
                    'number',
                    1,
                    29,
                    41),
              ), Positioned(
                left: 127,
                top: 91,
                child: GeneralTextField(
                    TextInputType.numberWithOptions(decimal: true,signed: true),
                    length,
                    '',
                    ':',
                    'number',
                    1,
                    29,
                    70),
              ),
              Positioned(
                left: 217,
                top: 91,
                child: GeneralTextField(
                    TextInputType.numberWithOptions(decimal: true,signed: true),
                    breadth,
                    '',
                    ':',
                    'number',
                    1,
                    29,
                    70),
              ),
              Positioned(
                left: 190,
                top: 171,
                child: elevatedButton(
                    Color.fromRGBO(0, 0, 255, 0.71),
                    40,
                    106,
                    13,
                    'Draw',
                    FontWeight.w800,
                    Colors.white, () {
                  offSetX.text.isNotEmpty &&
                      offSetY.text.isNotEmpty &&
                      length.text.isNotEmpty && breadth.text.isNotEmpty ?
                  model.validateRectangleForm(double.parse(offSetX.text),
                      double.parse(offSetY.text), double.parse(length.text),
                      double.parse(breadth.text), rectangleFormKey):Container();
                  model.updateRectangleIsValid();
                }),
              )
            ],
          )
      ),
    );
  }
}