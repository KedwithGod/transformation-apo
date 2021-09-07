// function to scale the shape drawn
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:stacked/stacked.dart';
import 'package:transformationapp/viewModel/LandingViewModel.dart';

class Scale extends ViewModelWidget<LandingPageModel> {

  final double scaleX;
  final double scaleY;
  final Widget child;

  const Scale(this.scaleX, this.scaleY, this.child) ;
  @override
  Widget build(BuildContext context, LandingPageModel model) {
    return Container(
      width: model.width,
      height:model.height,
      // scale it with respect to both negative and positive input
      transform: scaleX<0?Matrix4Transform().scaleBy(x: -scaleX,y: scaleY).matrix4
          :scaleY<0?Matrix4Transform().scaleBy(x: scaleX,y: -scaleY).matrix4:
      scaleX==0 ?Matrix4Transform().scaleBy(y: scaleY).matrix4:scaleY==0?
      Matrix4Transform().scaleBy(x: scaleX).matrix4:Matrix4Transform().scaleBy(x: scaleX,y: scaleY).matrix4,
      child: child,
    );
  }
}

