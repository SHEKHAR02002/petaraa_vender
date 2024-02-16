import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';

Future toast({required String msg, required BuildContext context}) async {
  return DelightToastBar(
    position: DelightSnackbarPosition.top,
    snackbarDuration: const Duration(seconds: 3),
    autoDismiss: true,
    builder: (context) => ToastCard(
      leading: const Icon(
        Icons.flutter_dash_sharp,
        size: 28,
      ),
      title: Text(
        msg,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    ),
  ).show(context);
}
