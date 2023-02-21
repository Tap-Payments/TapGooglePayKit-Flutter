import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tap_google_pay_kit_flutter/models/model.dart';
import 'package:tap_google_pay_kit_flutter/tap_google_pay_kit_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var mSDKResponse;

  // App configuration to use TapGooglePayKitFlutter
  Future<void> configureApp() async {
    TapGooglePayKitFlutter.configureSDK(
      secretKey: "sk_test_xxxxxxxxxxxxxxxxxx",
      bundleId: "com.xxx.xxxxxxx",
      countryCode: "US",
      transactionCurrency: "USD",
      sdkMode: SDKMode.Sandbox,
      allowedMethods: AllowedMethods.ALL,
      allowedCardNetworks: [AllowedCardNetworks.VISA.name],
      gatewayID: "xxxxx",
      gatewayMerchantID: "122xxxxx",
      amount: "23",
    );
  }

  // Start SDK and Call the methods from TapGooglePayKitFlutter

  Future<void> startSDK() async {
    try {
      configureApp();
      var tapGooglePaySDKResult =
          await TapGooglePayKitFlutter.getGooglePayToken;

      setState(() {
        mSDKResponse = tapGooglePaySDKResult;
      });
    } catch (ex) {
      if (kDebugMode) {
        print("Exception >>>> ${ex.toString()}");
      }
    }
  }

  // Build Widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              mSDKResponse == null
                  ? ""
                  : "SDK RESPONSE : ${mSDKResponse.toString()}",
            ),
          ),
        ),
        bottomSheet: TapGooglePayKitFlutter.googlePayButton(
          googlePayButtonType: GooglePayButtonType.NORMAL_GOOGLE_PAY,
          onTap: () {
            startSDK();
          },
        ),
      ),
    );
  }
}
