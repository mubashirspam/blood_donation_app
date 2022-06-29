import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  toast(BuildContext context, String title) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$title',
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
}
