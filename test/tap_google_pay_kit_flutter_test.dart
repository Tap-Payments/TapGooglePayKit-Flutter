import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:tap_google_pay_kit_flutter/tap_google_pay_kit_flutter.dart';
import 'package:tap_google_pay_kit_flutter/tap_google_pay_kit_flutter_method_channel.dart';
import 'package:tap_google_pay_kit_flutter/tap_google_pay_kit_flutter_platform_interface.dart';

class MockTapGooglePayKitFlutterPlatform
    with MockPlatformInterfaceMixin
    implements TapGooglePayKitFlutterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TapGooglePayKitFlutterPlatform initialPlatform =
      TapGooglePayKitFlutterPlatform.instance;

  test('$MethodChannelTapGooglePayKitFlutter is the default instance', () {
    expect(
        initialPlatform, isInstanceOf<MethodChannelTapGooglePayKitFlutter>());
  });

  test('getPlatformVersion', () async {
    TapGooglePayKitFlutter tapGooglePayKitFlutterPlugin =
        TapGooglePayKitFlutter();
    MockTapGooglePayKitFlutterPlatform fakePlatform =
        MockTapGooglePayKitFlutterPlatform();
    TapGooglePayKitFlutterPlatform.instance = fakePlatform;

    //   expect(await tapGooglePayKitFlutterPlugin.getPlatformVersion(), '42');
  });
}
