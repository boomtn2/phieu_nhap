import 'package:flutter/material.dart';

mixin AppLoaderMixin {
  Widget get loadingWidget {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(60),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: const CircularProgressIndicator(),
      ),
    );
  }

  Widget loadingWidgetWithSizeColor({double? size, Color? color}) {
    return Center(
      child: SizedBox(
        width: size ?? 24,
        height: size ?? 24,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
