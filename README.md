# TapGooglePayKit-Flutter
# tap_google_pay_kit_flutter (Only Android)
A standalone Flutter kit for handling Google Pay™

# Installation

---

<a name="installation_with_pubspec"></a>

### Include TapGooglePayKit plugin as a dependency in your pubspec.yaml

```dart
 dependencies:
     tap_google_pay_kit_flutter: ^0.0.1
```

---

<a name="additional_config_googlepay"></a>
# Additional Android Configuration
To use GooglePay in your app , you will be required to do additional configuration as follows:

1. In build.gradle file add

```kotlin
implementation "com.google.android.gms:play-services-wallet:18.1.3"
```

2. Ensure your min sdk is 24
```kotlin
minSdk 24
targetSdk 32
```

3. In Manifest file , Inside the <application tag do the below:

```kotlin
<meta-data
    android:name="com.google.android.gsm.wallet.api.enabled"
    android:value="true"
    />
```

### Configure SDK Example

```ts
enum SDKMode { 
   Sandbox,
   Production
}
```

```ts
enum SDKCallbackMode { 
   GetGooglePayToken,
   GetTapToken
}
```

```ts
enum AllowedMethods {
  PAN_ONLY,
  CRYPTOGRAM,
  ALL,
}
```

```ts
enum AllowedCardNetworks {
  AMEX,
  MASTERCARD,
  VISA,
}
```

## Usage

```ts
import 'package:tap_google_pay_kit_flutter/models/model.dart';
import 'package:tap_google_pay_kit_flutter/tap_google_pay_kit_flutter.dart';

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
      sdkCallbackMode: SDKCallbackMode.GetGooglePayToken,
    );
  }
  
// ...
```
## Start

```ts

tapGooglePaySDKResult =  await TapGooglePayKitFlutter.startGooglePaySDK;

```
