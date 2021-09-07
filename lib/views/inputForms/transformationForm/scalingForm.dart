import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transformationapp/viewModel/LandingViewModel.dart';
import 'package:transformationapp/views/Uielements/Generaltextdisplay.dart';
import 'package:transformationapp/views/Uielements/Generaltextfielddisplay.dart';
import 'package:transformationapp/views/Uielements/shared.dart';
import 'package:transformationapp/views/pages/landingPage.dart';

// creating form field for a circle
class ScalingForm extends ViewModelWidget<LandingPageModel> {
  // text editing fields for the offsets in the form
  final scaleX = TextEditingController();
  final scaleY = TextEditingController();
  final originX = TextEditingController();
  final originY = TextEditingController();

  final GlobalKey<FormState> scaleFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context, LandingPageModel model) {
    return
      Form(
        key: scaleFormKey ,
        child: Container(
            width: 317,
            height: 226,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Color.fromRGBO(25, 100, 256, 1.0),),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Stack(
              children: [

                Positioned(
                    left: 40,
                    top: 43,
                    child: GeneralTextDisplay(
                        'origin', Colors.black, 1, 20, FontWeight.w600,
                        'origin')
                ),
                Positioned(
                    left: 40,
                    top: 93,
                    child: GeneralTextDisplay('X',
                        Color.fromRGBO(0, 0, 255, 1.0), 1, 18,
                        FontWeight.bold, 'x on circle')
                ),
                Positioned(
                    left: 40,
                    top: 137,
                    child: GeneralTextDisplay('Y',
                        Color.fromRGBO(239, 0, 90, 1.0), 1, 18,
                        FontWeight.bold, 'y on circle')
                ),
                Positioned(
                  left: 69,
                  top: 90,
                  child: GeneralTextField(
                      TextInputType.numberWithOptions(decimal: true,signed: true),
                      originX,
                      '',
                      ':',
                      'number',
                      1,
                      29,
                      35),
                ),
                Positioned(
                  left: 69,
                  top: 137
                  ,
                  child: GeneralTextField(
                      TextInputType.numberWithOptions(decimal: true,signed: true),
                      originY,
                      '',
                      ':',
                      'number',
                      1,
                      29,
                      35),
                ),
                Positioned(
                    left: 147,
                    top: 43,
                    child: GeneralTextDisplay(
                        'scale By', Color.fromRGBO(230, 69, 0, 1.0), 1, 20, FontWeight.w600,
                        'scale By')
                ),
                Positioned(
                    left: 149,
                    top: 137,
                    child: GeneralTextDisplay('Y',
                        Color.fromRGBO(239, 0, 90, 1.0), 1, 18,
                        FontWeight.bold, 'y on circle')
                ), Positioned(
                    left: 149,
                    top: 93,
                    child: GeneralTextDisplay('X',
                        Color.fromRGBO(0, 0, 255, 1.0), 1, 18,
                        FontWeight.bold, 'x on circle')
                ),
                Positioned(
                  left: 178,
                  top: 90,
                  child: GeneralTextField(
                      TextInputType.numberWithOptions(decimal: true,signed: true),
                      scaleX,
                      '',
                      ':',
                      'number',
                      1,
                      29,
                      35),
                ),
                Positioned(
                  left: 178,
                  top: 137
                  ,
                  child: GeneralTextField(
                      TextInputType.numberWithOptions(decimal: true,signed: true),
                      scaleY,
                      '',
                      ':',
                      'number',
                      1,
                      29,
                      35),
                ),
                Positioned(
                    left: 193,
                    top: 171,
                    child: elevatedButton(
                        Color.fromRGBO(62, 92, 12, 1.0),
                        40,
                        106,
                        13,
                        'Scale',
                        FontWeight.w800,
                        Colors.white, () {
                      scaleX.text.isNotEmpty &&
                          scaleY.text.isNotEmpty &&
                          originX.text.isNotEmpty &&
                          originY.text.isNotEmpty ? model.validateScalingForm(
                          double.parse(scaleX.text),
                          double.parse(scaleY.text),
                          double.parse(originX.text), double.parse(originY.text),
                          scaleFormKey):Container();
                    }))

              ],
            )
        ),
      );
  }
}


