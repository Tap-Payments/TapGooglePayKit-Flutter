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

  Future<void> configureApp() async {
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
  }

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
        bottomSheet: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FilledButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                const Size(double.infinity, 50),
              ),
              minimumSize: MaterialStateProperty.all(
                const Size(double.infinity, 50),
              ),
            ),
            onPressed: () {
              startSDK();
            },
            child: const Text("Start"),
          ),
        ),
      ),
    );
  }
}
