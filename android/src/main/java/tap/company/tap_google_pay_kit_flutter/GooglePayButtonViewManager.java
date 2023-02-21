package tap.company.tap_google_pay_kit_flutter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Map;

import company.tap.google.pay.open.GooglePayButton;
import company.tap.google.pay.open.enums.GooglePayButtonType;
import io.flutter.plugin.platform.PlatformView;

public class GooglePayButtonViewManager implements PlatformView {

    private  GooglePayButton googlePayButton;
    private View view;

    GooglePayButtonViewManager(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams) {
        view = LayoutInflater.from(context).inflate(R.layout.google_pay_button_layout,null);
        googlePayButton = view.findViewById(R.id.googlePayView);
        googlePayButton.setGooglePayButtonType(getGooglePayType(creationParams.get("type").toString()));
        System.out.println("Google Pay Button View Manager >>>>>>>>>>>>>>");
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


//    public void setType(@NonNull View view, String type) {
//        googlePayButton = view.findViewById(R.id.googlePayView);
//        googlePayButton.setGooglePayButtonType(getGooglePayType("BUY_WITH_GOOGLE_PAY"));
//    }

    @Nullable
    @Override
    public View getView() {
        return view;
    }


    @Override
    public void dispose() {

    }
}
