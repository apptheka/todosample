import 'package:hive/hive.dart';

import '../../../../app/constant.dart';
import '../../binding/binding_datasource.dart';
// import 'package:shared_preferences/shared_preferences.dart';

abstract class BindingLocal implements BindingDataSource {
  Future<String> getStringValue(String key);
  Future<String> setData(String key, String value);
}

class BindingLocalImpl implements BindingLocal {
  // final SharedPreferences _sharedPreferences;

  // BindingLocalImpl(this._sharedPreferences);
  @override
  Future<String> getStringValue(String key) async {
    return Hive.box(HiveConstant.ADD_BOX).get(HiveFieldConstant.TODO) ?? "";
  }

  @override
  Future<String> setData(String key, String value) async {
    Hive.box(HiveConstant.ADD_BOX).put(HiveFieldConstant.TODO, value);
    return Hive.box(HiveConstant.ADD_BOX).get(HiveFieldConstant.TODO) ?? "";
  }
}
