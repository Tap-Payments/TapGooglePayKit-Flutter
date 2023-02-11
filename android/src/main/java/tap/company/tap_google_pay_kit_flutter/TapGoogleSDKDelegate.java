package tap.company.tap_google_pay_kit_flutter;

import android.app.Activity;
import android.content.Intent;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;


import java.math.BigDecimal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

import company.tap.google.pay.internal.api.responses.Token;
import company.tap.google.pay.open.DataConfiguration;
import company.tap.google.pay.open.GooglePayButton;
import company.tap.google.pay.open.SDKDelegate;
import company.tap.google.pay.open.enums.AllowedMethods;
import company.tap.google.pay.open.enums.SDKMode;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;


public class TapGoogleSDKDelegate implements PluginRegistry.ActivityResultListener,
        PluginRegistry.RequestPermissionsResultListener, SDKDelegate {

    private Activity activity;
    private DataConfiguration dataConfiguration;
    private GooglePayButton googlePayButton;
    private MethodChannel.Result pendingResult;
    private MethodCall methodCall;


    public TapGoogleSDKDelegate(Activity _activity) {
        this.activity = _activity;
        this.dataConfiguration = DataConfiguration.INSTANCE;
        this.googlePayButton = new GooglePayButton(_activity.getApplicationContext());
    }


    @Override
    public void onGooglePayToken(@NonNull String s) {
        HashMap<String, Object> resultData = new HashMap<>();

        resultData.put("googlePayToken", s);
        pendingResult.success(resultData);
    }

    @Override
    public void onTapToken(@NonNull Token token) {
        HashMap<String, Object> resultData = new HashMap<>();
        resultData.put("id", token.getId());
        resultData.put("object", token.getObject());

        if (token.getCard() != null) {
            resultData.put("card", token.getCard().getId());
            resultData.put("funding", token.getCard().getFunding());
            resultData.put("fingerprint", token.getCard().getFingerprint());
            resultData.put("brand", token.getCard().getBrand());
            resultData.put("expirationMonth", token.getCard().getExpirationMonth());
            resultData.put("expirationYear", token.getCard().getExpirationYear());
            resultData.put("lastFour", token.getCard().getFirstSix());
            resultData.put("firstSix", token.getCard().getLastFour());
        }

        if (token.getType() != null) {
            resultData.put("type", token.getType().name());
        }

        resultData.put("created", token.getCreated());
        resultData.put("clientIp", token.getClient_ip());
        resultData.put("isLiveMode", token.getLivemode());
        resultData.put("isUsed", token.getUsed());
        resultData.put("currency", token.getCurrency());
        resultData.put("name", token.getName());
        pendingResult.success(resultData);
    }

    public void start(Activity activity1, MethodChannel.Result callback, HashMap<String, Object> args) {
        this.pendingResult = callback;
        try {
            HashMap<String, Object> resultData = args;
            System.out.println("All Arguments" + resultData.toString());
            String secretKey = Objects.requireNonNull(args.get("secretKey")).toString();
            System.out.println("Secret Key :" + secretKey.toString());
            String bundleID = Objects.requireNonNull(args.get("bundleID")).toString();
            System.out.println("Bundle ID :" + bundleID.toString());
            String countryCode = Objects.requireNonNull(args.get("countryCode")).toString();
            System.out.println("Country Code :" + countryCode.toString());
            String transactionCurrency = Objects.requireNonNull(args.get("transactionCurrency")).toString();
            System.out.println("Transaction Currency :" + transactionCurrency.toString());
            String allowedCardAuthMethodsString = Objects.requireNonNull(args.get("allowedCardAuthMethods")).toString();
            System.out.println("Allowed Card Auth Methods :" + allowedCardAuthMethodsString.toString());
            String environmentModeString = Objects.requireNonNull(args.get("environmentMode")).toString();
            System.out.println("Environment Mode :" + environmentModeString.toString());
            String gatewayId = Objects.requireNonNull(args.get("gatewayId")).toString();
            System.out.println("Gateway ID :" + gatewayId.toString());
            String gatewayMerchantID = Objects.requireNonNull(args.get("gatewayMerchantID")).toString();
            System.out.println("Gateway Merchant ID :" + gatewayMerchantID.toString());
            BigDecimal amount = new BigDecimal(Double.parseDouble((String) Objects.requireNonNull(args.get("amount")).toString()));
            System.out.println("Amount :" + amount);
            List<String> allowedCardNetworks = (List<String>) Objects.requireNonNull(args.get("allowedCardNetworks"));

            SDKMode environmentMode = getSdkMode(environmentModeString);
            AllowedMethods allowedCardAuthMethods = getAllowedMethods(allowedCardAuthMethodsString);

            System.out.println("Allowed card auth method :" + allowedCardAuthMethods.toString());
            System.out.println("Environment Mode :" + environmentMode.toString());
            System.out.println("Amount :" + amount);
            System.out.println("Merchant Id :" + gatewayMerchantID.toString());
            System.out.println("gateway Id :" + gatewayId.toString());
            System.out.println("Allowed card Networks :" + allowedCardNetworks.toString());
            System.out.println("Transaction Currency :" + transactionCurrency.toString());
            System.out.println("Country Code :" + countryCode.toString());
            System.out.println("Bundle ID :" + bundleID.toString());
            System.out.println("Secret Key :" + secretKey.toString());

            DataConfiguration.INSTANCE.initSDK(activity1, secretKey, bundleID);
            DataConfiguration.INSTANCE.addSDKDelegate(this);
            DataConfiguration.INSTANCE.setCountryCode(countryCode);
            DataConfiguration.INSTANCE.setTransactionCurrency(transactionCurrency);
            DataConfiguration.INSTANCE.setAllowedCardNetworks(allowedCardNetworks);
            DataConfiguration.INSTANCE.setAllowedCardAuthMethods(allowedCardAuthMethods);
            DataConfiguration.INSTANCE.setEnvironmentMode(environmentMode); //**Required SDK MODE**/
            DataConfiguration.INSTANCE.setGatewayId(gatewayId); //**Required GATEWAY ID**/
            DataConfiguration.INSTANCE.setGatewayMerchantID(gatewayMerchantID); //**Required GATEWAY Merchant ID**/
            DataConfiguration.INSTANCE.setAmount(amount); //**Required Amount**/
            DataConfiguration.INSTANCE.getTapToken(activity1, googlePayButton);

        } catch (Exception e) {
            pendingResult.error(String.valueOf(500), "Missing params", new Object());
        }

    }


    @NonNull
    private AllowedMethods getAllowedMethods(String allowedCardAuthMethodsString) {
        AllowedMethods allowedCardAuthMethods = AllowedMethods.ALL;


        switch (allowedCardAuthMethodsString) {
            case "AllowedMethods.ALL":
                allowedCardAuthMethods = AllowedMethods.ALL;
            case "AllowedMethods.CRYPTOGRAM_3DS":
                allowedCardAuthMethods = AllowedMethods.CRYPTOGRAM_3DS;
            case "AllowedMethods.PAN_ONLY":
                allowedCardAuthMethods = AllowedMethods.PAN_ONLY;
        }
        return allowedCardAuthMethods;
    }

    @NonNull
    private SDKMode getSdkMode(String environmentModeDouble) {
        SDKMode environmentMode = SDKMode.ENVIRONMENT_TEST;
        switch (environmentModeDouble) {
            case "SDKMode.Sandbox":
                environmentMode = SDKMode.ENVIRONMENT_PRODUCTION;
            case "SDKMode.Production":
                environmentMode = SDKMode.ENVIRONMENT_TEST;
        }
        return environmentMode;
    }

    @Override
    public void onFailed(@NonNull String s) {
        System.out.println("Failed");
    }

    @Override
    public boolean onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        return false;
    }

    @Override
    public boolean onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        return false;
    }
}