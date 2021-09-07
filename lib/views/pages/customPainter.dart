import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:transformationapp/viewModel/LandingViewModel.dart';
import 'package:transformationapp/views/Shapes/circle.dart';
import 'package:transformationapp/views/Shapes/rectangle.dart';
import 'package:transformationapp/views/Shapes/triangle.dart';
import 'package:transformationapp/views/Uielements/Generaltextdisplay.dart';

// widget used to connect the shape form field with the shape drawing widget
class CustomPainterWidget extends ViewModelWidget<LandingPageModel> {
  //for all the shapes


  @override
  @override
  Widget build(BuildContext context, LandingPageModel model) {
    return Container(
      width: 700,
      height: 650,
      child: model.circleFormIsValid == true
          ? Column(

              children: [
               GeneralTextDisplay('R${model.radius}', Colors.white, 1, 15, FontWeight.w600, 'dimension of circle'),
                // to check if the circle diameter draw is larger than the screen grid layout
                model.radius * 2 > model.gridScreenWidth ||
                        model.radius * 2 > model.gridScreenHeight
                    ? GeneralTextDisplay(
                        'Diameter of circle is greater than screen layout',
                        Colors.white,
                        2,
                        18,
                        FontWeight.w500,
                        'circle layout error')
                    : CustomPaint(
                        painter: CirclePainter(model.offSetX, model.offSetY, model.radius)),
              ],
            )
          : model.rectangleFormIsValid == true
              ? Center(
                  child: Column(
                    children: [
                      GeneralTextDisplay('L${model.length}', Colors.white, 1, 15, FontWeight.w600, 'dimension of rectangle'),
                      model.breadth > model.gridScreenWidth ||
                          model.length > model.gridScreenHeight
                          ? GeneralTextDisplay(
                          'Dimension is too large for display',
                          Colors.white,
                          2,
                          18,
                          FontWeight.w500,
                          'rectangle layout error'):CustomPaint(
                          painter: RectanglePainter(
                              model.rectX, model.rectY, model.breadth, model.length)),
                    ],
                  ),
                )
              : model.triangleFormIsValid == true
                  ? Column(
                    children: [
                      GeneralTextDisplay('T${model.topX}', Colors.white, 1, 15, FontWeight.w600, 'dimension of rectangle'),
                      CustomPaint(
                          painter: TriangleShape(model.triX, model.triY, model.topX, model.topY,
                              model.baseAX, model.baseAY, model.baseBX, model.baseBY)),
                    ],
                  )
                  : Container(
                      child: Column(
                        children: [
                          Text('No item'),
                        ],
                      ),
                    ),
    );
  }
}
