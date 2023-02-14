import 'dart:async';

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

  @override
  void initState() {
    super.initState();
    startSDK();
  }

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
      print("Exception >>>> ${ex.toString()}");
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
              "SDK RESPONSE : ${mSDKResponse == null ? "" : mSDKResponse.toString()}",
            ),
          ),
        ),
      ),
    );
  }
}
