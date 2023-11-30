import 'package:flutter/material.dart';
import 'package:watch_tv/utils/navigation_utils.dart';
import 'package:watch_tv/utils/widgets/pending_action.dart';

class DialogUtils {
  DialogUtils._();

  static Widget? commonLoadingWidget;

  static bool _isShowingDialog = false;

  static void hideLoading({BuildContext? context}) {
    if (!_isShowingDialog) return;

    final BuildContext? _context = context ?? NavigationUtils.currentContext;
    if (_context != null) {
      Navigator.of(_context).pop();
    }

    _isShowingDialog = false;
  }

  static void showLoading({BuildContext? context, Widget? customLoadingWidget}) {
    if (_isShowingDialog) return;

    final BuildContext? _context = context ?? NavigationUtils.currentContext;
    if (_context == null) return;

    showDialog(
      barrierDismissible: false,
      context: _context,
      useSafeArea: false,
      useRootNavigator: context == null,
      builder: (BuildContext context) {
        return customLoadingWidget ?? commonLoadingWidget ?? const PendingAction();
      },
    );

    _isShowingDialog = true;
  }
}
