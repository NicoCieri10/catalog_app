import 'package:flutter/material.dart';

/// A class for notifications.
class Notifications {
  /// The key used for show a message.
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  /// A method to show a Snackbar.
  static void showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
