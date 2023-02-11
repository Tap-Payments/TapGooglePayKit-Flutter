import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:tap_google_pay_kit_flutter/models/model.dart';

class TapGooglePayKitFlutter {
  static final Map<dynamic, dynamic> _tapGooglePaySDKResult =
      <dynamic, dynamic>{};

  static const MethodChannel _channel =
      MethodChannel('tap_google_pay_kit_flutter');

  static Future<dynamic> get startGooglePaySDK async {
    if (!_validateAppConfig()) return _tapGooglePaySDKResult;
    dynamic result = await _channel.invokeMethod('start', sdkConfigurations);
    if (kDebugMode) {
      print("Result >>>>>> $result");
    }
    return result;
  }

  static Map<String, dynamic> sdkConfigurations = {};

  /// App configurations
  static void configureSDK({
    required String secretKey,
    required String bundleId,
    required String countryCode,
    required String transactionCurrency,
    required SDKMode sdkMode,
    required AllowedMethods allowedMethods,
    required List<String> allowedCardNetworks,
    required String gatewayID,
    required String gatewayMerchantID,
    required String amount,
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