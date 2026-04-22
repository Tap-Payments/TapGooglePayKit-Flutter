package tap.company.tap_google_pay_kit_flutter;

import android.content.Context;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.google.android.gms.wallet.button.ButtonConstants.ButtonTheme;
import com.google.android.gms.wallet.button.ButtonConstants.ButtonType;
import com.google.android.gms.wallet.button.ButtonOptions;
import com.google.android.gms.wallet.button.PayButton;

import java.util.Map;

import io.flutter.plugin.platform.PlatformView;

public class GooglePayButtonViewManager implements PlatformView {

    private final PayButton payButton;

    GooglePayButtonViewManager(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams) {
        payButton = new PayButton(context);

        String typeStr = (creationParams != null && creationParams.get("type") != null)
                ? creationParams.get("type").toString()
                : "PAY_WITH_GOOGLE_PAY";

        double cornerRadiusDp = (creationParams != null && creationParams.get("cornerRadius") != null)
                ? ((Number) creationParams.get("cornerRadius")).doubleValue()
                : 4.0;
        int cornerRadiusPx = (int) (cornerRadiusDp * context.getResources().getDisplayMetrics().density);

        String allowedPaymentMethods =
                "[{\"type\":\"CARD\",\"parameters\":{" +
                "\"allowedAuthMethods\":[\"PAN_ONLY\",\"CRYPTOGRAM_3DS\"]," +
                "\"allowedCardNetworks\":[\"AMEX\",\"DISCOVER\",\"MASTERCARD\",\"VISA\"]}}]";

        payButton.initialize(
                ButtonOptions.newBuilder()
                        .setButtonTheme(ButtonTheme.DARK)
                        .setButtonType(getButtonType(typeStr))
                        .setCornerRadius(cornerRadiusPx)
                        .setAllowedPaymentMethods(allowedPaymentMethods)
                        .build()
        );
    }

    private int getButtonType(String typeValue) {
        switch (typeValue) {
            case "BUY_WITH_GOOGLE_PAY":       return ButtonType.BUY;
            case "PAY_WITH_GOOGLE_PAY":       return ButtonType.PAY;
            case "SUBSCRIBE_WITH_GOOGLE_PAY": return ButtonType.SUBSCRIBE;
            case "CHECKOUT_WITH_GOOGLE_PAY":  return ButtonType.CHECKOUT;
            case "ORDER_WITH_GOOGLE_PAY":     return ButtonType.ORDER;
            case "BOOK_WITH_GOOGLE_PAY":      return ButtonType.BOOK;
            default:                          return ButtonType.PAY;
        }
    }

    @NonNull
    @Override
    public View getView() {
        return payButton;
    }

    @Override
    public void dispose() {}
}
