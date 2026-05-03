import 'package:enently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogUtils {
  static void showSnackBar(
    BuildContext context,
    String message, {
    Color? backgroundColor,
  }) {
    final colors = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: backgroundColor, content: Text(message)),
    );
  }

  static void showLoading(BuildContext context, {bool dismissible = true}) {
    showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (context) => PopScope(
        canPop: dismissible,
        child: AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Center(child: CircularProgressIndicator())],
          ),
        ),
      ),
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showToastMessage({
    required String message,
    required Color bgColor,
  }) {
    Fluttertoast.showToast(
      msg: message,

      gravity: ToastGravity.BOTTOM,

      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 16.sp,
    );
  }

  static Future<bool?> showLogoutDialog(
    BuildContext context, {
    required String tittle,
    required String desc,
  }) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    AppLocalizations? appLocalizations = AppLocalizations.of(context);
    return showDialog<bool>(
      barrierDismissible: false,
      context: context,

      builder: (context) {
        return PopScope(
          canPop: false,

          child: AlertDialog(
            icon: Icon(
              Icons.warning_amber_rounded,
              color: colors.error,
              size: 48.w,
            ),
            title: Center(child: Text(tittle, style: textTheme.titleLarge)),
            content: Text(
              desc,
              style: textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(
                      appLocalizations!.cancel,
                      style: textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(
                      appLocalizations.ok,
                      style: textTheme.titleLarge!.copyWith(
                        color: colors.error,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
