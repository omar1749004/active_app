import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class PrgressSata {
  PrgressSata();
  viewAttend(Map data) async {
    var res = await Api().post(uri: linkAttendView, body: data);
    return res;
  }

  addWeight(Map data) async {
    var res = await Api().post(
      uri: linkWeightAdd,
      body: data,
    );
    return res;
  }

  viewWeight(Map data) async {
    var res = await Api().post(uri: linkWeightView, body: data);
    return res;
  }
}
