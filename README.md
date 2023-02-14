# TapGooglePayKit-Flutter

A standalone Flutter kit for handling Google Pay™ (Only for Android)

## Getting Started

# Table of Contents

1. [Requirements](#requirements)
2. [Installation](#installation)
    1. [Installation with pubspec.yaml](#installation_with_pubspec)
2. [Additional Android Configuration](#additional_config_googlepay)
4. [Usage](#usage)
    1. [Configure Your App](#configure_your_app)
    2. [SDK Enums](#sdk_enums)
    3. [SDK Modes](#sdk_modes)
    4. [Allowed Methods](#allowed_methods)
    5. [Allowed Card Networks](#allowed_card_networks)
    6. [SDK Methods](#sdk_methods)

<a href="requirements"></a>

# Requirements


To use the SDK the following requirements must be met:

1. **Visual Studio - InteliJ Idea**
2. **Dart 2.7.1** or newer
3. **Flutter: >=2.5.0** or newer

<a name="installation"></a>

# Installation


<a name="installation_with_pubspec"></a>

### Include TapGooglePayKit plugin as a dependency in your pubspec.yaml

```dart
 dependencies:
     tap_google_pay_kit_flutter: ^0.0.1
```



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


<a name="configure_your_app"></a>

## Configure your app

`TapGooglePayKit` should be set up. To set it up, add the following lines of code somewhere in your project and make sure they will be called before any usage of `TapGooglePayKit`.

```dart
/**
 * Configure SDK.
 */
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
```

<a name="sdk_enums"></a>
## SDK Enums


<a name="sdk_modes"></a>
**SDK Modes**

``` dart 
sdkMode: SDKMode.Sandbox
```

You can set the sdk mode into one of the following modes:
- **Sandbox**
    - ``` dart SDKMode.Sandbox ```<br/>
  > Testing mode
- **Production**
    - ``` dart SDKMode.Production ```<br/>
  > Production mode

<a name="allowed_methods"></a>

**AllowedMethods**

``` dart 
allowedMethods: AllowedMethods.ALL
```

You can set the allowed methods into one of the following modes:
- **PAN_ONLY**
    - ``` dart AllowedMethods.PAN_ONLY ```<br/>
- **CRYPTOGRAM**
    - ``` dart AllowedMethods.CRYPTOGRAM ```<br/>
- **ALL**
    - ``` dart AllowedMethods.ALL ```<br/>

<a name="allowed_card_networks"></a>

**AllowedCardNetworks**

``` dart 
allowedCardNetworks: [AllowedCardNetworks.VISA.name]
```

You can set the allowed card networks mode into one of the following modes:
- **AMEX**
    - ``` dart AllowedCardNetworks.AMEX.name ```<br/>
- **MASTERCARD**
    - ``` dart AllowedCardNetworks.MASTERCARD.name ```<br/>
- **VISA**
    - ``` dart AllowedCardNetworks.VISA.name ```<br/>

    
<a name="sdk_methods"></a>
## SDK Methods

**Get Google Pay Token**

```dart
   var tapGooglePaySDKResult = await TapGooglePayKitFlutter.getGooglePayToken;
```

**Get Tap Token**

```dart
   var tapTokenSDKResult = await TapGooglePayKitFlutter.getTapToken;
```

