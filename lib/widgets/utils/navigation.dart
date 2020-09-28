///
//
/// @About:     Custom navigation helper
// @File:       navigation.dart
// @Date:       2020-05-27T23:44:13
// @Version:    $Rev:$ 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///

import 'dart:async';

import 'package:flutter/material.dart';

class CupertinoSwipeBackObserver extends NavigatorObserver {
  static Completer promise;

  @override
  void didStartUserGesture(Route route, Route previousRoute) {
    // make a new promise
    promise = Completer();
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    // resolve the promise
    promise.complete();
  }
}