import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(String url, {VoidCallback? onError}) async {
  try {
    await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView);
  } catch (e) {
    onError?.call();
  }
}
