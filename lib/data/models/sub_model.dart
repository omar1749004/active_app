class SubModel {
  int subscriptionsId;
  String subscriptionsName;
  double subscriptionsPrice;
  int subscriptionsDay;
  int subscriptionsSessionsNumber;
 

  SubModel({
    required this.subscriptionsId,
    required this.subscriptionsName,
    required this.subscriptionsPrice,
    required this.subscriptionsDay,
    required this.subscriptionsSessionsNumber,
  });

  factory SubModel.fromJson(Map<String, dynamic> json) {
    return SubModel(
      subscriptionsId: json['subscriptions_id'],
      subscriptionsName: json['subscriptions_name'],
      subscriptionsPrice: double.parse(json['subscriptions_price']) ,
      subscriptionsDay: json['subscriptions_day'],
      subscriptionsSessionsNumber: json['subscriptions_sessions_number'],
    );
  }
}