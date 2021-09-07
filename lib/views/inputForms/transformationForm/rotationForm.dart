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
class RotationForm extends ViewModelWidget<LandingPageModel> {
  // text editing fields for the offsets in the form
  final angle = TextEditingController();
  final originX = TextEditingController();
  final originY = TextEditingController();
  final GlobalKey<FormState> rotateFormKey = GlobalKey<FormState>();

  // orientation list
  List<ListItem> _orientationItems = [
  ListItem(1, 'Clockwise'),
  ListItem(2, 'AntiClockwise'),];


  @override
  Widget build(BuildContext context, LandingPageModel model) {
    return
      Form(
        key: rotateFormKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                      left: 137,
                      top: 43,
                      child: GeneralTextDisplay(
                          'angle', Color.fromRGBO(230, 69, 0, 1.0), 1, 20, FontWeight.w600,
                          'scale By')
                  ),

                  Positioned(
                    left: 137,
                    top: 90,
                    child: GeneralTextField(
                        TextInputType.numberWithOptions(decimal: true,signed: true  ),
                        angle,
                        '',
                        'deg',
                        'number',
                        1,
                        29,
                        35),
                  ),

                  Positioned(
                    left: 137,
                    top: 130,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(

                            menuMaxHeight: 300,
                            value: model.orientation,
                            items: _orientationItems.map((ListItem item) {
                              return DropdownMenuItem<int>(
                                child: GeneralTextDisplay(
                                    item.name,
                                    Color.fromRGBO(51, 51, 51, 1.0),
                                    1,
                                    15,
                                    FontWeight.w800,
                                    item.name),
                                value: item.value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              model.updateOrientation(value);
                            },
                            hint: GeneralTextDisplay(
                                'Select orientation',
                                Color.fromRGBO(51, 51, 51, 1.0),
                                1,
                                13,
                                FontWeight.w800,
                                'Select shape')),
                      ),
                    ),


                  Positioned(
                      left: 193,
                      top: 171,
                      child: elevatedButton(
                          Color.fromRGBO(52, 6, 6, 1.0),
                          40,
                          106,
                          13,
                          'Rotation',
                          FontWeight.w800,
                          Colors.white, () {
                        angle.text.isNotEmpty &&
                            originX.text.isNotEmpty &&
                            originY.text.isNotEmpty ? model.validateRotationForm(
                            double.parse(angle.text),
                            double.parse(originX.text), double.parse(originY.text),
                            rotateFormKey):Container();
                      }))

                ],
              )
          ),
        ),
      );
  }
}


