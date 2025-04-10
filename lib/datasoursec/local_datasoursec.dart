import 'dart:convert';

import 'package:bottom_navigaton_bar/model/app_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatasoursec {
  Future<bool> saveData(AppModel user) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final dataJson = jsonEncode(user.toJson());
    final result = sharedPreferences.setString("user",dataJson);

    return result;
  }

  Future<AppModel?> getData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final dataJson = sharedPreferences.getString("user");
    if (dataJson == null) {
        return null;
    }
    final result = jsonDecode(dataJson);
    final appModel = AppModel.fromJson(result);
    return appModel;
  }
}
