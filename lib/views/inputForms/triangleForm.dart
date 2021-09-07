import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transformationapp/Models/transformations/translation.dart';
import 'package:transformationapp/viewModel/LandingViewModel.dart';
import 'package:transformationapp/views/Uielements/Generaltextdisplay.dart';
import 'package:transformationapp/views/Uielements/Generaltextfielddisplay.dart';
import 'package:transformationapp/views/Uielements/shared.dart';

// creating form field for a triangle using frosted glass
class TriangleForm extends ViewModelWidget<LandingPageModel> {
  // text editing fields for the offsets in the form
 final offSetX = TextEditingController();
 final offSetY = TextEditingController();
 final topX = TextEditingController();
 final topY = TextEditingController();
 final baseAX = TextEditingController();
 final baseAY = TextEditingController();
 final baseBX = TextEditingController();
 final baseBY = TextEditingController();
 GlobalKey<FormState> triangleFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, LandingPageModel model) {
    return Form(
      key: triangleFormKey,
      child: Container(

          width: 410,
          height: 226,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color: Color.fromRGBO(25, 100, 256, 1.0), width: 1.0)),
          child: Stack(
            children: [
              // for the offset of the triangle
              Positioned(
                  left: 40,
                  top: 43,
                  child: GeneralTextDisplay(
                      'Offset', Colors.black, 1, 20, FontWeight.w600, 'offset')),
              Positioned(
                  left: 40,
                  top: 93,
                  child: GeneralTextDisplay('X', Color.fromRGBO(0, 0, 255, 0.47),
                      1, 18, FontWeight.bold, 'x on circle')),
              Positioned(
                  left: 40,
                  top: 137,
                  child: GeneralTextDisplay(
                      'Y',
                      Color.fromRGBO(127, 127, 127, 1.0),
                      1,
                      18,
                      FontWeight.bold,
                      'y on circle')),
              Positioned(
                left: 69,
                top: 93,
                child: GeneralTextField(
                    TextInputType.numberWithOptions(decimal: true,signed: true), offSetX, '', ':', 'number', 1, 29, 41),
              ),
              Positioned(
                left: 69,
                top: 137,
                child: GeneralTextField(
                    TextInputType.numberWithOptions(decimal: true,signed: true), offSetY, '', ':', 'number', 1, 29, 41),
              ),

              // for the coordinate of the top of the triangle
              Positioned(
                  left: 129,
                  top: 43,
                  child: GeneralTextDisplay(
                      'Top', Color.fromRGBO(230, 69, 0, 1.0), 1, 20, FontWeight.w400, 'triangle top')),
              Positioned(
                  left: 132,
                  top: 93,
                  child: GeneralTextDisplay('X', Color.fromRGBO(0, 0, 255, 0.47),
                      1, 18, FontWeight.bold, 'x on triangle top')),
              Positioned(
                  left: 132,
                  top: 137,
                  child: GeneralTextDisplay(
                      'Y',
                      Color.fromRGBO(127, 127, 127, 1.0),
                      1,
                      18,
                      FontWeight.bold,
                      'y on triangle top')),
              Positioned(
                left: 161,
                top: 93,
                child: GeneralTextField(
                    TextInputType.numberWithOptions(decimal: true,signed: true), topX, '', ':', 'number', 1, 29, 41),
              ),
              Positioned(
                left: 161,
                top: 137,
                child: GeneralTextField(
                    TextInputType.numberWithOptions(decimal: true,signed: true), topY, '', ':', 'number', 1, 29,41),
              ),

              // the coordinate for the base A of the triangle
              Positioned(
                  left:211,
                  top:43,
                  child: GeneralTextDisplay('Base A', Color.fromRGBO(230, 69, 0, 1.0),
                      1, 20, FontWeight.w400, 'base A of the triangle')
              ), Positioned(
                  left:214,
                  top:93,
                  child: GeneralTextDisplay('X', Color.fromRGBO(0, 0, 255, 0.47), 1, 18, FontWeight.bold, 'x on circle')
              ),  Positioned(
                  left:214,
                  top:137,
                  child: GeneralTextDisplay('Y',
                      Color.fromRGBO(127, 127, 127 , 1.0), 1, 18, FontWeight.bold, 'y on circle')
              ),
              Positioned(
                left: 243,
                top: 93,
                child: GeneralTextField(
                    TextInputType.numberWithOptions(decimal: true,signed: true), baseAX, '', ':', 'number', 1, 29, 41),
              ),
              Positioned(
                left:243 ,
                top: 137,
                child: GeneralTextField(
                    TextInputType.numberWithOptions(decimal: true,signed: true), baseAY, '', ':', 'number', 1, 29, 41),
              ),
              // the coordinate for the base B of the triangle
              Positioned(
                  left:304,
                  top:43,
                  child: GeneralTextDisplay('Base B', Color.fromRGBO(230, 69, 0, 1.0),
                      1, 20, FontWeight.w400, 'base B of the triangle')
              ), Positioned(
                  left:304,
                  top:93,
                  child: GeneralTextDisplay('X', Color.fromRGBO(0, 0, 255, 0.47), 1, 18, FontWeight.bold, 'x on circle')
              ),  Positioned(
                  left:304,
                  top:137,
                  child: GeneralTextDisplay('Y',
                      Color.fromRGBO(127, 127, 127 , 1.0), 1, 18, FontWeight.bold, 'y on circle')
              ),
              Positioned(
                left: 333,
                top: 93,
                child: GeneralTextField(
                    TextInputType.numberWithOptions(decimal: true,signed: true), baseBX, '', ':', 'number', 1, 29, 41),
              ),
              Positioned(
                left: 333,
                top: 137,
                child: GeneralTextField(
                    TextInputType.numberWithOptions(decimal: true,signed: true), baseBY, '', ':', 'number', 1, 29, 41),
              ),
              Positioned(
                left:291,
                top: 171,
                child: elevatedButton(Color.fromRGBO(236, 121, 148, 1.0 ),
                    40, 106, 13, 'Draw', FontWeight.w800, Colors.white,(){
                  model.validateTriangleForm(double.parse(offSetX.text), double.parse(offSetY.text),
                      double.parse(topX.text), double.parse(topY.text), double.parse(baseAX.text),
                      double.parse(baseAY.text),  double.parse(baseBX.text),  double.parse(baseBY.text), triangleFormKey);
                  model.updateTriangleIsValid();
                    }),
              ),
            ],
          ),
        ),
    )
    ;
  }
}

