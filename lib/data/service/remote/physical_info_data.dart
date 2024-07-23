import 'package:active_app/api_link.dart';
import 'package:active_app/core/class/api.dart';

class PhysicalInfoData {
  PhysicalInfoData();
  view(Map data) async {
    var res = await Api().post(uri: linkBracnhView, body: data);
    return res;
  }

  add(Map data) async {
    var res = await Api().post(
      uri: linkPhysicalhAdd,
      body: data,
    );
    return res;
  }

  edit(Map data) async {
    var res = await Api().post(uri: linkPhysicalEdit, body: data);
    return res;
  }
}


// {
//       'physical_Info_id': physicalInfoId,
//       'physical_Info_userid': physicalInfoUserId,
//       'physical_Info_length': physicalInfoLength,
//       'physical_Info_weight': physicalInfoWeight,
//       'physical_Info_age': physicalInfoAge,
//       'physical_Info_musclepe': physicalInfoMusclePercentage,
//       'physical_Info_fatpe': physicalInfoFatPercentage,
//     };