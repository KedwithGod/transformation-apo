// function to translate the shape drawn
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:stacked/stacked.dart';
import 'package:transformationapp/viewModel/LandingViewModel.dart';

class Translate extends ViewModelWidget<LandingPageModel> {

  final double translationX;
  final double translationY;
  final Widget child;

  Translate( this.translationX, this.translationY, this.child);
  @override
  Widget build(BuildContext context, LandingPageModel model) {
    return Container(
      width: model.width,
      height:model.height,
      // translating it with respect to both negative and positive input
      transform:
      Matrix4Transform().up(translationY).left(translationX).matrix4,
      child: child,
    );
  }
}
