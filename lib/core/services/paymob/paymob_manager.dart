import 'package:active_app/api_link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../class/api.dart';

class PaymobManger {
  final String _uri = "https://accept.paymob.com/api";
  Future<String> getPaymentkeyFristThreeStep(
      double amount, String currency, String subName, Map data) async {
    try {
      //frist step
      String authToken = await _getAuthToken();

      //2 step
      int orderId = await _getorderId(
          authToken: authToken,
          cents: (amount * 100).toString(),
          currency: currency,
          //amount: amount,
          data: data,
          subNme: subName
          );

      // //3 step
      String paymentKey = await _getpaymentkey(
          authToken: authToken,
          cents: (amount * 100).toString(),
          orderId: orderId.toString(),
          currency: currency);
      return paymentKey;
    } catch (e) {
      return "error";
    }
  }

  Future<String> _getAuthToken() async {
    var res = await Api().postJsonType(
        uri: "$_uri/auth/tokens",
        headers: {'Content-Type': 'application/json'},
        body: {"api_key": apiKeyPaymob});

    return res["token"]; // for each user
  }

  Future<int> _getorderId(
      {required String authToken,
      required String cents,
      required String currency,
      required String subNme,
      required Map data
    //  required int amount
      }) async {
    var res = await Api().postJsonType(uri: "$_uri/ecommerce/orders", headers: {
      'Content-Type': 'application/json'
    }, body: {
      "auth_token": authToken,
      "delivery_needed": "false",
      "amount_cents": cents,
      "currency": currency, //not requir
      "items": [
        {
      "name": subNme,
      "amount_cents": cents,
      "description": "Subscription",
      "quantity": "1"
    }
      ] ,//item details
      "data":data
    });
    return res["id"];
  }

  Future<String> _getpaymentkey(
      {required String authToken,
      required String cents,
      required String orderId,
      required String currency}) async {
    var res = await Api()
        .postJsonType(uri: "$_uri/acceptance/payment_keys", headers: {
      'Content-Type': 'application/json'
    }, body: {
      "auth_token": authToken,

      "expiration": 3600, //amount second token avilble
      "order_id": orderId,
      "integration_id": intagrationCardId,

      "amount_cents": cents,
      "currency": currency,

      "billing_data": {
        //have to be value
        "first_name": "Clifford",
        "last_name": "Nicolas",
        "email": "claudette09@exa.com",
        "phone_number": "+86(8)9135210487",

        "apartment": "Na",
        "floor": "Na",
        "street": "Na",
        "building": "Na",
        "shipping_method": "Na",
        "postal_code": "Na",
        "city": "Na",
        "country": "Na",
        "state": "Na"
      },
      
    });

    
    return res["token"];
  }

  ////card
  Future<void> payCard(String paymentKey) async {
    launchUrl(Uri.parse(
        "https://accept.paymob.com/api/acceptance/iframes/798984?payment_token=$paymentKey"));
  }

// Mobile Wallets
  Future<void> payWallet(String url) async {
    launchUrl(Uri.parse(url));
  }

  Future<String> mobileWallets({required String paymentKey,required String phone}) async {
    var res = await Api()
        .postJsonType(uri: "$_uri/acceptance/payments/pay", headers: {
      'Content-Type': 'application/json'
    }, body: {
      "source": {"identifier": phone, "subtype": "WALLET"},
      "payment_token": paymentKey
    });

    return res["redirect_url"];
  }
}
