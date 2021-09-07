// function to rotation the shape drawn
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:stacked/stacked.dart';
import 'package:transformationapp/viewModel/LandingViewModel.dart';
import 'package:transformationapp/views/pages/customPainter.dart';

class RotationWidget extends ViewModelWidget<LandingPageModel>{

  final double angleDegrees;
  final int clockWise;
  final Widget child;
  final double originX;
  final double originY;

  RotationWidget( this.angleDegrees, this.clockWise, this.child, this.originX, this.originY);
  @override
  Widget build(BuildContext context, LandingPageModel model) {
    return Container(
      width: model.width,
      height:model.height,
      // rotate it with respect to both negative and positive input
      transform:
     clockWise==1?Matrix4Transform().rotateDegrees(angleDegrees,origin: Offset(originX, originY)).matrix4:
     Matrix4Transform().rotateDegrees((360-angleDegrees),origin: Offset(originX, originY)).matrix4,
      // if it is clockwise use the angle if it is not subtract it from 360 degree
      child: child,
    );
  }
}



