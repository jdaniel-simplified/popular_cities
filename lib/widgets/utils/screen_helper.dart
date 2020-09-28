import 'dart:math';

///
//
/// @About:     Class to create responsive layouts
// @File:       screen_helper.dart
// @Date:       2020-05-27T23:47:02
// @Version:    $Rev:$ 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///

import 'package:flutter/material.dart';

class ScreenHelper
{
  final _guidelineBaseWidth = 350;
  final _guidelineBaseHeight = 680;

  var _shortDimension;
  var _longDimension;

  ScreenHelper(context)
  {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    this._shortDimension = width < height ? width : height;
    this._longDimension = width < height ? height : width;
  }

  double setHeight(double size)
  {
    /*double h;
    h = (height *MediaQuery.of(context).size.height) / 100;

    return h;*/

    return (this._longDimension * size) / 100;
  }

  double setWidth(double size)
  {
    /*double w;

    w = (width * MediaQuery.of(context).size.width) / 100;

    return w;*/

    return (this._shortDimension * size) / 100;
  }

  EdgeInsets allBorders(double top, double bottom, double left, double right)
  {
    return EdgeInsets.only(top: this.setHeight(top), bottom: this.setHeight(bottom), left: this.setWidth(left), right: this.setWidth(right));
  }

  EdgeInsets sameBorders(double vertical, double horizontal)
  {
    return EdgeInsets.only(top: this.setHeight(vertical), bottom: this.setHeight(vertical), left: this.setWidth(horizontal), right: this.setWidth(horizontal));
  }

  double textSize(double size)
  {
    var tempLongDimension = (16 / 9) * this._shortDimension;
    return sqrt(pow(tempLongDimension, 2) + pow(_shortDimension, 2)) *
        (size / 100);
  }

}

class ScreenHelperD
{
  static ScreenHelper of(context)
  {
    return new ScreenHelper(context);
  }
}
