import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tap_google_pay_kit_flutter/tap_google_pay_kit_flutter_method_channel.dart';

void main() {
  MethodChannelTapGooglePayKitFlutter platform = MethodChannelTapGooglePayKitFlutter();
  const MethodChannel channel = MethodChannel('tap_google_pay_kit_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
