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
class CircleForm extends ViewModelWidget<LandingPageModel> {
  // text editing fields for the offsets in the form
  final offSetX = TextEditingController();
  final offSetY = TextEditingController();
  final radius = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context, LandingPageModel model) {
    return
            Form(
              key: formKey,
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
                              'Offset', Colors.black, 1, 20, FontWeight.w600,
                              'offset')
                      ), Positioned(
                          left: 147,
                          top: 43,
                          child: GeneralTextDisplay('Radius',
                              Color.fromRGBO(230, 69, 0, 1.0), 1, 20,
                              FontWeight.w400, 'lenght')
                      ), Positioned(
                          left: 40,
                          top: 93,
                          child: GeneralTextDisplay(
                              'X', Color.fromRGBO(0, 0, 255, 1.0), 1, 18,
                              FontWeight.bold, 'x on circle')
                      ), Positioned(
                          left: 40,
                          top: 137,
                          child: GeneralTextDisplay('Y',
                              Color.fromRGBO(217, 0, 27, 1.0), 1, 18,
                              FontWeight.bold, 'y on circle')
                      ),
                      Positioned(
                        left: 69,
                        top: 93,
                        child: GeneralTextField(
                            TextInputType.numberWithOptions(decimal: true,signed: true),
                            offSetX,
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
                            offSetY,
                            '',
                            ':',
                            'number',
                            1,
                            29,
                            35),
                      ), Positioned(
                        left: 147,
                        top: 91,
                        child: GeneralTextField(
                            TextInputType.numberWithOptions(decimal: true,signed: true),
                            radius,
                            '',
                            ':',
                            'number',
                            1,
                            35,
                            79),
                      ),
                      Positioned(
                          left: 193,
                          top: 171,
                          child: elevatedButton(
                              Color.fromRGBO(163, 103, 23, 1.0),
                              40,
                              106,
                              13,
                              'Draw',
                              FontWeight.w800,
                              Colors.white, () {
                            offSetX.text.isNotEmpty &&
                                offSetY.text.isNotEmpty &&
                                radius.text.isNotEmpty ? model.validateCircleForm(
                                double.parse(offSetX.text),
                                double.parse(offSetY.text),
                                double.parse(radius.text), formKey):Container();
                            model.updateCircleFormIsValid();
                          })
                      )
                    ],
                  )
              ),
            );
  }
}


/*ClipRect(
          child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5)),
                  child: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Offset', style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            TextField(),
                            TextField()
                          ],
                        )
                      ],
                    ),
                  )
                    ),
                  ))*/