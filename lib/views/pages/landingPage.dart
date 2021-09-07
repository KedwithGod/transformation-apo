import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transformationapp/Models/transformations/rotation.dart';
import 'package:transformationapp/Models/transformations/scale.dart';
import 'package:transformationapp/Models/transformations/translation.dart';
import 'package:transformationapp/viewModel/LandingViewModel.dart';
import 'package:transformationapp/views/Shapes/circle.dart';
import 'package:transformationapp/views/Shapes/rectangle.dart';
import 'package:transformationapp/views/Shapes/triangle.dart';
import 'package:transformationapp/views/Uielements/Generaltextdisplay.dart';
import 'package:transformationapp/views/Uielements/shared.dart';
import 'package:transformationapp/views/inputForms/circleForm.dart';
import 'package:transformationapp/views/inputForms/rectangleForm.dart';
import 'package:transformationapp/views/inputForms/squareForm.dart';
import 'package:transformationapp/views/inputForms/transformationForm/rotationForm.dart';
import 'package:transformationapp/views/inputForms/transformationForm/scalingForm.dart';
import 'package:transformationapp/views/inputForms/transformationForm/tranlationForm.dart';
import 'customPainter.dart';

import 'package:transformationapp/views/inputForms/triangleForm.dart';

class LandingPage extends StatelessWidget {
  // list for shape items
  List<ListItem> _dropdownItems = [
    ListItem(1, 'Circle'),
    ListItem(2, 'Triangle'),
    ListItem(3, 'Rectangle'),
    ListItem(4, 'Square'),
  ];
  List<ListItem> _transfomationItems = [
    ListItem(1, 'Translation'),
    ListItem(2, 'Scaling'),
    ListItem(3, 'Rotation'),
  ];




  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingPageModel>.reactive(
        viewModelBuilder: () => LandingPageModel(),
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(children: [
                    // dropdown for shape items
                    Positioned(
                      left: 93,
                      top: 36,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            itemHeight: 200,
                            menuMaxHeight: 500,
                            value: model.shapeValue ?? 1,
                            items: _dropdownItems.map((ListItem item) {
                              return DropdownMenuItem<int>(
                                child: GeneralTextDisplay(
                                    item.name,
                                    Color.fromRGBO(51, 51, 51, 1.0),
                                    1,
                                    40,
                                    FontWeight.w800,
                                    item.name),
                                value: item.value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              model.updateShape(value);
                            },
                            hint: GeneralTextDisplay(
                                'Select Shape',
                                Color.fromRGBO(51, 51, 51, 1.0),
                                1,
                                40,
                                FontWeight.w800,
                                'Select shape')),
                      ),
                    ),
                    Positioned(
                      left: 93,
                      top: 430,
                      child: Container
                        (
                        height: 94,
                        width: 364,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                itemHeight: 200,
                                menuMaxHeight: 500,
                                value: model.transformationValue ?? 1,
                                items: _transfomationItems.map((ListItem item) {
                                  return DropdownMenuItem<int>(
                                    child: GeneralTextDisplay(
                                        item.name,
                                        Color.fromRGBO(51, 51, 51, 1.0),
                                        1,
                                        40,
                                        FontWeight.w800,
                                        item.name),
                                    value: item.value,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  model.updateTransformation(value);
                                },
                                hint: GeneralTextDisplay(
                                    'Choose transformation',
                                    Color.fromRGBO(51, 51, 51, 1.0),
                                    1,
                                    40,
                                    FontWeight.w800,
                                    'transformation selection')),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        left: 79.0,
                        top: 191.0,
                        child: model.shapeValue == 1
                            ? CircleForm()
                            : model.shapeValue == 2
                                ? TriangleForm()
                                : model.shapeValue == 3
                                    ? RectangularForm()
                                    : model.shapeValue == 4
                                        ? SquareForm()
                                        : Container(
                                            child: GeneralTextDisplay(
                                                'You have not selected a shape yet',
                                                Color.fromRGBO(51, 51, 51, 1.0),
                                                1,
                                                20,
                                                FontWeight.w800,
                                                'Select shape notification'
                                                    ''),
                                          )),
                    Positioned(
                        left: 79.0,
                        top: 530.0,
                        child: model.transformationValue == 1
                            ? TranslationForm()
                            : model.transformationValue == 2
                                ? ScalingForm()
                                : model.transformationValue == 3
                                    ? RotationForm()

                                        : Container(
                                       width:400,
                                            child: GeneralTextDisplay(
                                                'You have not selected a transformation method yet',
                                                Color.fromRGBO(51, 51, 51, 1.0),
                                                2,
                                                20,
                                                FontWeight.w800,
                                                'Select transformation notification'
                                                    ''),
                                          )),

                    Positioned(
                        left: 527,
                        top: 108,
                        child:GridPaper(
                          interval: 100 ,
                          child: Container(
                            width: model.gridScreenWidth,
                            height: model.gridScreenHeight,
                            decoration: BoxDecoration(
                                  color: Colors.green,
                                  border: Border.all(
                                    color: Color.fromRGBO(255, 255, 0, 1.0),
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                            child:Stack(children:[
                             Positioned(
                               left: 5,
                               top:255,
                               child:model.transformationValue==1 && model.translateX!=null?Translate(model.translateX, model.translateY,
                                 model.shapeValue == 1
                                     ?
                                 CustomPainterWidget(
                                 )
                                     :
                                 // for triangle
                                 model.shapeValue == 2
                                     ? CustomPainterWidget(
                                 )
                                     :
                                 // for rectangle
                                 model.shapeValue == 3 || model.shapeValue == 4
                                     ? CustomPainterWidget(

                                 )
                                     :Container(),

                               ):Container(),),



                               Positioned(
                               left: 5,
                               top:255,
                               child: model.shapeValue == 1
                                 ?
                             CustomPainterWidget(
                             )
                                 :
                             // for triangle
                             model.shapeValue == 2 &&  model.triX!=null
                                 ? CustomPainterWidget(
                             )
                                 :
                             // for rectangle
                             model.shapeValue == 3 || model.shapeValue == 4 &&  model.rectX!=null
                                 ? CustomPainterWidget(
                             )
                                 :Container(),
                             ),


                              Positioned(
                                left:0,
                              top: 325,
                              child:model.transformationValue==2 && model.scaleX!=null?Container(
                                width:820,
                                height: 320,
                                alignment: Alignment.centerLeft,
                                child: FittedBox(
                                  child: Scale(model.scaleX, model.scaleY,
                                      model.shapeValue == 1
                                          ?
                                      CustomPainterWidget(
                                      )
                                          :
                                      // for triangle
                                      model.shapeValue == 2
                                          ? CustomPainterWidget(
                                      )
                                          :
                                      // for rectangle
                                      model.shapeValue == 3 || model.shapeValue == 4
                                          ? CustomPainterWidget(

                                      )
                                          :Container()),
                                ),
                              ):Container()),

                    Positioned(
                        left: 450,
                        top: 325,
                        child:model.transformationValue==3 && model.angle!=null?RotationWidget(model.angle, model.orientation,
                                model.shapeValue == 1
                                    ?
                                CustomPainterWidget(
                                )
                                    :
                                // for triangle
                                model.shapeValue == 2
                                    ? CustomPainterWidget(
                                )
                                    :
                                // for rectangle
                                model.shapeValue == 3 || model.shapeValue == 4
                                    ? CustomPainterWidget(

                                )
                                    :Container(),model.originX, model.originY


                              ):Container()),

                              Positioned(
                                  top: model.gridScreenHeight/2,
                                  child:Container(
                                    width: model.gridScreenWidth,
                                    height: 2,
                                    color: Colors.white60,
                                  )),

                            ])
                          ),
                        )),





                  ]),
                ),
              ),
            ));
  }
}


