import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tap_google_pay_kit_flutter/models/model.dart';

class TapGooglePayKitFlutter {
  static final Map<dynamic, dynamic> _tapGooglePaySDKResult =
      <dynamic, dynamic>{};

  static const MethodChannel _channel =
      MethodChannel('tap_google_pay_kit_flutter');

  static Future<dynamic> get getGooglePayToken async {
    if (!_validateAppConfig()) return _tapGooglePaySDKResult;
    dynamic result = await _channel.invokeMethod('start', {
      "config": sdkConfigurations,
      "type": SDKCallbackMode.GetGooglePayToken.name
    });
    if (kDebugMode) {
      print("Result >>>>>> $result");
    }
    return result;
  }

  static Future<dynamic> get getTapToken async {
    if (!_validateAppConfig()) return _tapGooglePaySDKResult;
    dynamic result = await _channel.invokeMethod('start', {
      "config": sdkConfigurations,
      "type": SDKCallbackMode.GetTapToken.name
    });
    if (kDebugMode) {
      print("Result >>>>>> $result");
    }
    return result;
  }

  static Map<String, dynamic> sdkConfigurations = {};

  /// App configurations
  static void configureSDK({
    required String secretKey, // Tap secret key
    required String bundleId, // App bundleID
    required String countryCode, // countryCode
    required String transactionCurrency, // TapCurrencyCode
    required SDKMode sdkMode, // SdkMode enum
    required AllowedMethods allowedMethods, // AllowedMethods enum
    required List<String> allowedCardNetworks, // AllowedCardNetworks enum
    required String gatewayID, // GatewayID
    required String gatewayMerchantID, // MerchantGatewayID
    required String amount, // Amount
  }) {
    sdkConfigurations = <String, dynamic>{
      "secretKey": secretKey,
      "bundleID": bundleId,
      "countryCode": countryCode,
      "transactionCurrency": transactionCurrency,
      "allowedCardNetworks": allowedCardNetworks,
      "allowedCardAuthMethods": allowedMethods.toString(),
      "environmentMode": sdkMode.toString(),
      "gatewayId": gatewayID,
      "gatewayMerchantID": gatewayMerchantID,
      "amount": amount,
    };
  }

  // Google pay Button Widget from TapGooglePaySDK
  static Widget googlePayButton({
    required GooglePayButtonType googlePayButtonType,
    required Function()? onTap,
  }) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return SizedBox(
        height: 80,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AndroidView(
              viewType: "plugin/google_pay_button",
              creationParams: {
                "type": googlePayButtonType.name,
              },
              creationParamsCodec: const StandardMessageCodec(),
              layoutDirection: TextDirection.ltr,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: InkWell(
                  onTap: onTap,
                  splashColor: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  /// validate app configurations
  static bool _validateAppConfig() {
    if (sdkConfigurations["bundleID"] == "" ||
        sdkConfigurations["bundleID"] == "null" ||
        sdkConfigurations["bundleID"] == null) {
      _prepareConfigurationsErrorMap(
        errorCode: "501",
        errorMsg: 'Invalid Bundle ID',
        errorDescription: 'Bundle ID can not be empty or null',
      );
      return false;
    }

    if (sdkConfigurations["secretKey"] == "" ||
        sdkConfigurations["secretKey"] == "null" ||
        sdkConfigurations["secretKey"] == null) {
      _prepareConfigurationsErrorMap(
        errorCode: "501",
        errorMsg: 'Invalid secrete Key',
        errorDescription: 'Secrete key can not empty or null',
      );
      return false;
    }

    if (sdkConfigurations["countryCode"] == "" ||
        sdkConfigurations["countryCode"] == "null" ||
        sdkConfigurations["countryCode"] == null) {
      _prepareConfigurationsErrorMap(
        errorCode: "501",
        errorMsg: 'Invalid Country Code',
        errorDescription: 'Country Code can not empty or null',
      );
      return false;
    }

    if (sdkConfigurations["transactionCurrency"] == "" ||
        sdkConfigurations["transactionCurrency"] == "null" ||
        sdkConfigurations["transactionCurrency"] == null) {
      _prepareConfigurationsErrorMap(
        errorCode: "501",
        errorMsg: 'Invalid transaction currency',
        errorDescription: 'Transaction currency can not empty or null',
      );
      return false;
    }
    if (sdkConfigurations["allowedCardNetworks"] == "" ||
        sdkConfigurations["allowedCardNetworks"] == "null" ||
        sdkConfigurations["allowedCardNetworks"] == null) {
      _prepareConfigurationsErrorMap(
        errorCode: "501",
        errorMsg: 'Invalid Allowed card networks',
        errorDescription: 'Allowed card networks can not empty or null',
      );
      return false;
    }

    if (sdkConfigurations["allowedCardAuthMethods"] == "" ||
        sdkConfigurations["allowedCardAuthMethods"] == "null" ||
        sdkConfigurations["allowedCardAuthMethods"] == null) {
      _prepareConfigurationsErrorMap(
        errorCode: "501",
        errorMsg: 'Invalid Allowed card auth methods',
        errorDescription: 'Allowed card auth methods can not empty or null',
      );
      return false;
    }

    if (sdkConfigurations["environmentMode"] == "" ||
        sdkConfigurations["environmentMode"] == "null" ||
        sdkConfigurations["environmentMode"] == null) {
      _prepareConfigurationsErrorMap(
        errorCode: "501",
        errorMsg: 'Invalid environment mode',
        errorDescription: 'Environment mode can not empty or null',
      );
      return false;
    }

    if (sdkConfigurations["gatewayId"] == "" ||
        sdkConfigurations["gatewayId"] == "null" ||
        sdkConfigurations["gatewayId"] == null) {
      _prepareConfigurationsErrorMap(
        errorCode: "501",
        errorMsg: 'Invalid gateway id',
        errorDescription: 'Gateway id can not empty or null',
      );
      return false;
    }

    if (sdkConfigurations["gatewayMerchantID"] == "" ||
        sdkConfigurations["gatewayMerchantID"] == "null" ||
        sdkConfigurations["gatewayMerchantID"] == null) {
      _prepareConfigurationsErrorMap(
        errorCode: "501",
        errorMsg: 'Invalid gateway merchant id',
        errorDescription: 'Gateway merchant id can not empty or null',
      );
      return false;
    }

    if (sdkConfigurations["amount"] == "" ||
        sdkConfigurations["amount"] == "null" ||
        sdkConfigurations["amount"] == null) {
      _prepareConfigurationsErrorMap(
        errorCode: "501",
        errorMsg: 'Invalid amount',
        errorDescription: 'Amount can not empty or null',
      );
      return false;
    }

    return true;
  }

  static void _prepareConfigurationsErrorMap({
    required String errorCode,
    required String errorMsg,
    required String errorDescription,
  }) {
    _tapGooglePaySDKResult.putIfAbsent(
      'sdk_result',
      () => 'SDK_ERROR',
    );
    _tapGooglePaySDKResult.putIfAbsent(
      'sdk_error_code',
      () => errorCode,
    );
    _tapGooglePaySDKResult.putIfAbsent(
      'sdk_error_message',
      () => errorMsg,
    );
    _tapGooglePaySDKResult.putIfAbsent(
      'sdk_error_description',
      () => errorDescription,
    );
  }
}
