enum SDKMode { Sandbox, Production }

enum SDKCallbackMode { GetGooglePayToken, GetTapToken }

enum AllowedMethods { PAN_ONLY, CRYPTOGRAM, ALL }

enum AllowedCardNetworks { AMEX, MASTERCARD, VISA }

enum GooglePayButtonType {
  BUY_WITH_GOOGLE_PAY,
  DONATE_WITH_GOOGLE_PAY,
  NORMAL_GOOGLE_PAY,
  PAY_WITH_GOOGLE_PAY,
  SUBSCRIBE_WITH_GOOGLE_PAY,
  CHECKOUT_WITH_GOOGLE_PAY,
  ORDER_WITH_GOOGLE_PAY,
  BOOK_WITH_GOOGLE_PAY,
}
