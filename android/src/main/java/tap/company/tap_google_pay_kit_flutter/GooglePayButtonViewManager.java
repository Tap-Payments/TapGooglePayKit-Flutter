package tap.company.tap_google_pay_kit_flutter;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Map;

import company.tap.google.pay.open.GooglePayButton;
import company.tap.google.pay.open.enums.GooglePayButtonType;
import io.flutter.plugin.platform.PlatformView;

public class GooglePayButtonViewManager implements PlatformView {

    private GooglePayButton googlePayButton;
    private FrameLayout containerView;

    GooglePayButtonViewManager(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams) {
        // Create views programmatically instead of using XML inflation
        containerView = new FrameLayout(context);
        googlePayButton = new GooglePayButton(context);

        // Add GooglePayButton to the container
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.WRAP_CONTENT);
        containerView.addView(googlePayButton, params);

        // Set button type if provided in creation params
        if (creationParams != null && creationParams.containsKey("type")) {
            googlePayButton.setGooglePayButtonType(getGooglePayType(creationParams.get("type").toString()));
        } else {
            // Default type
            googlePayButton.setGooglePayButtonType(GooglePayButtonType.NORMAL_GOOGLE_PAY);
        }

        System.out.println("Google Pay Button View Manager programmatically created >>>>>>>>>>>>>>");
    }

    @NonNull
    private GooglePayButtonType getGooglePayType(String typeValue) {
        GooglePayButtonType type = GooglePayButtonType.NORMAL_GOOGLE_PAY;
        switch (typeValue) {
            case "BUY_WITH_GOOGLE_PAY":
                type = GooglePayButtonType.BUY_WITH_GOOGLE_PAY;
                break;
            case "NORMAL_GOOGLE_PAY":
                type = GooglePayButtonType.NORMAL_GOOGLE_PAY;
                break;
            case "PAY_WITH_GOOGLE_PAY":
                type = GooglePayButtonType.PAY_WITH_GOOGLE_PAY;
                break;
            case "SUBSCRIBE_WITH_GOOGLE_PAY":
                type = GooglePayButtonType.SUBSCRIBE_WITH_GOOGLE_PAY;
                break;
            case "CHECKOUT_WITH_GOOGLE_PAY":
                type = GooglePayButtonType.CHECKOUT_WITH_GOOGLE_PAY;
                break;
            case "ORDER_WITH_GOOGLE_PAY":
                type = GooglePayButtonType.ORDER_WITH_GOOGLE_PAY;
                break;
            case "BOOK_WITH_GOOGLE_PAY":
                type = GooglePayButtonType.BOOK_WITH_GOOGLE_PAY;
                break;
        }
        System.out.println(typeValue);
        return type;
    }

    @Nullable
    @Override
    public View getView() {
        return containerView;
    }

    @Override
    public void dispose() {
        // Clean up any resources
    }
}