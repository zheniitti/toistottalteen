import 'package:flutter/material.dart';

class MyCustomScrollPhysics extends ScrollPhysics {
  const MyCustomScrollPhysics({required ScrollPhysics parent}) : super(parent: parent);

  @override
  MyCustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return MyCustomScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 1,
        stiffness: 600,
        damping: 300,
      );
}

class MyCustomTabViewScrollPhysics extends ScrollPhysics {
  const MyCustomTabViewScrollPhysics({required ScrollPhysics parent}) : super(parent: parent);

  @override
  MyCustomTabViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return MyCustomTabViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 5,
        stiffness: 250,
        damping: 20,
      );
}
