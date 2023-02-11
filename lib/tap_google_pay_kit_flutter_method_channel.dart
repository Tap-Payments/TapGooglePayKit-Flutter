import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tap_google_pay_kit_flutter_platform_interface.dart';

/// An implementation of [TapGooglePayKitFlutterPlatform] that uses method channels.
class MethodChannelTapGooglePayKitFlutter extends TapGooglePayKitFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tap_google_pay_kit_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
