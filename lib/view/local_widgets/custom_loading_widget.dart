import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitFoldingCube(
      size: 40,
      itemBuilder: (_, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index == 1
                ? Color(0xff4126a0)
                : index == 2
                    ? Color(0xffdd927b)
                    : index == 3
                        ? Color(0xff141c44)
                        : Color(0xff9c5fe1),
          ),
        );
      },
    ));
  }
}
