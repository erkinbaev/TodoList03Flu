import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  // void showAppSnackBar({required String text, required Color color}) {
  //   ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(text), backgroundColor: color));
  // }
  Future <void> showAppSnackBar(
  BuildContext context, {
  required String text,
  Color? backgroundColor,
  IconData? icon,
  VoidCallback? onRetry,
  String retryText = "Повторить",
}) async {
  final messenger = ScaffoldMessenger.of(context);

  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(
    SnackBar(
      content: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
          ],
          Expanded(child: Text(text)),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 400),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      duration: const Duration(seconds: 1),
      action: onRetry == null
          ? null
          : SnackBarAction(
              label: retryText,
              onPressed: onRetry,
              textColor: Colors.white,
            ),
    ),
  );
}
}