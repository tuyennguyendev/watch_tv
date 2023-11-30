import 'package:flutter/material.dart';
import 'package:watch_tv/resources/R.dart';

class PendingAction extends StatelessWidget {
  const PendingAction();

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
