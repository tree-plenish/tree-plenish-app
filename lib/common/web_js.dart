// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

void openPageInNewTab(link) {
  js.context.callMethod('open', [link]);
}