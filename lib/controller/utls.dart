

import 'package:flutter/material.dart';

class Utils {
  toast(BuildContext context, String title) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$title',
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
