

import 'package:shared_preferences/shared_preferences.dart';
class CashMemmory{
static late SharedPreferences sharedPreferences;
static Future startSharedPref()async{
  sharedPreferences = await SharedPreferences.getInstance();
}
static Future <bool> SaveDate({
required String key,
required  dynamic value,
})async{

if(value is String) return await sharedPreferences.setString(key, value);
if(value is int)return await sharedPreferences.setInt(key, value);
if(value is bool)return await sharedPreferences.setBool(key, value);
return sharedPreferences.setDouble(key, value);
}

static dynamic getData({required String key}){
return sharedPreferences.get(key);
}

}