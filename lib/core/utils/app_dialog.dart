import 'package:flutter/material.dart';

abstract class AppDialog {
//function to show loading dialog
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

//function to show error dialog
  static void showError(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(error),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }}