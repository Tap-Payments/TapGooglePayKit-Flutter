package tap.company.tap_google_pay_kit_flutter;

import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Map;

import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class GooglePayButtonFactory extends PlatformViewFactory {
    GooglePayButtonFactory() {
        super(StandardMessageCodec.INSTANCE);
    }

    @NonNull
    @Override
    public PlatformView create(@NonNull Context context, int id, @Nullable Object args) {
        final Map<String, Object> creationParams = (Map<String, Object>) args;
        System.out.println("Google Pay Button Factory >>>>>>>>>>"+creationParams);
        return new GooglePayButtonViewManager(context ,id,creationParams);
    }
}

