import 'package:flutter/material.dart';
import 'package:knowledge_queezy/src/config/theme.dart';

ScaffoldMessengerState showSnackBar(
  BuildContext context, {
  required String message,
  Color? backgroundColor,
  int? milliseconds,
  SnackBarAction? action,
  Function? onClosed,
}) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        margin: const EdgeInsets.all(8),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: PrimaryFont.medium(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        backgroundColor: backgroundColor ?? kPrimaryColor,
        duration: Duration(milliseconds: milliseconds ?? 1000),
        action: action,
      ),
    ).closed.then((value) => onClosed);
}
