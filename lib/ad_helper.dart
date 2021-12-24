import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5887262851604536/4452829567";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

}