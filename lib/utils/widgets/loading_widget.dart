import 'package:flutter/material.dart';
import 'package:watch_tv/resources/R.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({required this.child, required this.showLoading});

  final Widget child;
  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (showLoading)
          Center(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: R.color.black_54,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: CircularProgressIndicator(
                backgroundColor: R.color.white,
              ),
            ),
          ),
      ],
    );
  }
}
