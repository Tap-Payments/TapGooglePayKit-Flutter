import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  @override
  void initState() {
    super.initState();
    startSDK();
  }

  var sdkResponse;

  Future<void> startSDK() async {
    try {
      TapGooglePayKitFlutter.configureSDK(
        secretKey: "sk_test_cvSHaplrPNkJO7dhoUxDYjqA",
        bundleId: "company.tap.goSellSDKExamplee",
        countryCode: "US",
        transactionCurrency: "USD",
        sdkMode: SDKMode.Sandbox,
        allowedMethods: AllowedMethods.ALL,
        allowedCardNetworks: [AllowedCardNetworks.VISA.name],
        gatewayID: "tappayments",
        gatewayMerchantID: "1124340",
        amount: "23",
      );

      var tapGooglePaySDKResult =
          await TapGooglePayKitFlutter.startGooglePaySDK;

      setState(() {
        sdkResponse = tapGooglePaySDKResult;
      });
      if (kDebugMode) {
        print('>>>>>>>> $tapGooglePaySDKResult');
      }
    } on PlatformException {
      //  platformVersion = 'Failed to get platform version.';
    }
  }

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
              "SDK RESPONSE : ${sdkResponse == null ? "" : sdkResponse.toString()}",
            ),
          ),
        ),
      ),
    );
  }
}