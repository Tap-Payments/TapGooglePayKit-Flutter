import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tap_google_pay_kit_flutter_method_channel.dart';

abstract class TapGooglePayKitFlutterPlatform extends PlatformInterface {
  /// Constructs a TapGooglePayKitFlutterPlatform.
  TapGooglePayKitFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static TapGooglePayKitFlutterPlatform _instance = MethodChannelTapGooglePayKitFlutter();

  /// The default instance of [TapGooglePayKitFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelTapGooglePayKitFlutter].
  static TapGooglePayKitFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TapGooglePayKitFlutterPlatform] when
  /// they register themselves.
  static set instance(TapGooglePayKitFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
