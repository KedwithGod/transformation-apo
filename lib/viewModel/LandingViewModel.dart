import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:transformationapp/views/Shapes/circle.dart';

import 'baseModel.dart';

class LandingPageModel extends BaseModel {
  // Dimension for the container of the transformation function
  double width=300;
  double height=300;

  // dimension for the grid screen for displaying the shape
  double gridScreenHeight=650;
  double gridScreenWidth=820;

// shape dropdown value
  var shapeValue;

  updateShape(value) {
    shapeValue = value;
    notifyListeners();
  }

// transformation dropdown value
  var transformationValue;

  updateTransformation(value) {
    transformationValue = value;
    notifyListeners();
  }


  // offset for circle
  var offSetX = 0.0;
  var offSetY = 0.0;

  // drawing circle
  var radius = 10.0;
  bool circleFormIsValid = false;

  //function to validate circleForm widget
  validateCircleForm(X, Y, inputRadius, formKey) {
    if (formKey.currentState.validate()) {
      offSetY = Y;
      notifyListeners();
      offSetX = X;
      notifyListeners();
      radius = inputRadius;
      notifyListeners();
      print(offSetY);
      print(inputRadius);
    }
  }

  //update circleFormIsValid widget
  updateCircleFormIsValid() {
    circleFormIsValid = true;
    notifyListeners();
    print(circleFormIsValid);
    rectangleFormIsValid = false;
    notifyListeners();
    triangleFormIsValid=false;
    notifyListeners();
  }

  // drawing rectangle
  var rectX; // offset for the rectangle
  var rectY;
  var length = 0.0;
  var breadth = 0.0;
  var rectangleFormIsValid = false;

  //function to validate rectangle form
  validateRectangleForm(X, Y, inputLength, inputBreadth, formKey) {
    if (formKey.currentState.validate()) {
      rectY = Y;
      notifyListeners();
      rectX = X;
      notifyListeners();
      length = inputLength;
      notifyListeners();
      breadth = inputBreadth;
      notifyListeners();
    }
  }

// update rectangleIsValid variable
  updateRectangleIsValid() {
    rectangleFormIsValid = true;
    notifyListeners();
    circleFormIsValid = false;
    notifyListeners();
    triangleFormIsValid=false;
    notifyListeners();
  }

  // variable for drawing a triangle
  var triX;
  var triY; // offset for drawing the triangle
  var topX = 0.0;
  var topY = 0.0;
  var baseAX = 0.0;
  var baseBX = 0.0;
  var baseAY = 0.0;
  var baseBY = 0.0;
  var triangleFormIsValid = false;

  // function to validate form field of the triangle
  validateTriangleForm(X, Y, inputTopX, inputTopY, inputBaseAX, inputBaseAY,
      inputBaseBX, inputBaseBY, formKey) {
    if (formKey.currentState.validate()) {
      triY = Y;
      notifyListeners();
      triX = X;
      notifyListeners();
      topX = inputTopX;
      notifyListeners();
      topY = inputTopY;
      notifyListeners();
      baseAX = inputBaseAX;
      notifyListeners();
      baseAY = inputBaseAY;
      notifyListeners();
      baseBX = inputBaseBX;
      notifyListeners();
      baseBY = inputBaseAY;
      notifyListeners();
    }
  }
  updateTriangleIsValid(){
    triangleFormIsValid = true;
    notifyListeners();
    circleFormIsValid = false;
    notifyListeners();
    rectangleFormIsValid=false;
    notifyListeners();
  }

  // this are the validation form for the transformation
//translation

  // variables for all three transformation
  var originX;
  var originY;
  // variable for the translation
  var translateX;
  var translateY;
  bool translationFormIsValid = false;
  validateTranslationForm(X, Y, originXInput,originYInput, formKey) {
    if (formKey.currentState.validate()) {
      translateY = Y;
      notifyListeners();
      translateX = X;
      notifyListeners();
      originY = originYInput;
      notifyListeners();
      originX= originXInput;
      notifyListeners();
      print(offSetY);
      translationFormIsValid=true;
      notifyListeners();
    }
  }

  // variables for scaling
  var scaleX;
  var scaleY;
  bool scalingFormIsValid = false;
  validateScalingForm(X, Y, originXInput,originYInput, formKey) {
    if (formKey.currentState.validate()) {
      scaleY = Y;
      notifyListeners();
      scaleX = X;
      notifyListeners();
      originY = originYInput;
      notifyListeners();
      originX= originXInput;
      notifyListeners();
      print(offSetY);
      scalingFormIsValid=true;
      notifyListeners();
    }
  }

//scaling

  // variables for scaling
  var angle;
  var clockwise;
  bool rotationFormIsValid = false;
  validateRotationForm(degreeAngle,  originXInput,originYInput, formKey) {
    if (formKey.currentState.validate()) {
    angle= degreeAngle;
      notifyListeners();
      originY = originYInput;
      notifyListeners();
      originX= originXInput;
      notifyListeners();
      print(offSetY);
      rotationFormIsValid=true;
      notifyListeners();
    }
  }
  //radio button for clockwise and anticlockwise update
  var checkListValue=false;
  updateRadio(value){
    checkListValue=value;
    notifyListeners();
  }

  // from rotation class, updating orientation
 var orientation=1;
  updateOrientation(value){
    orientation=value;
    notifyListeners();
  }

}
