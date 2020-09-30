///
//
/// @About:     Class for get and set user preferences
// @File:       preferences_repository.dart
// @Date:       2020-05-27T23:49:30
// @Version:    $Rev:$ 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///

import 'dart:convert';

import 'package:popular_cities/models/cities_model.dart';
import 'package:popular_cities/models/preferences_model.dart';
import 'package:popular_cities/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class Preferences
{
  Future<bool>getLoginState();
  Future<bool>isFirstTime();
  Future<PreferencesModel> getPreferences();
  Future<User> getUserData();
  Future<List<City>> getFavorites();
  Future saveFavorites(City c);
  savePreferences(PreferencesModel preferencesModel);
  deletePreferences();
  saveFirst();
}

class PreferencesImpl extends Preferences
{
  @override
  Future<bool> getLoginState() async
  {
    bool state = false;
    final prefs = await SharedPreferences.getInstance();
      //await prefs.setString('user', null);
     String user = prefs.getString('preferences');

     if(user != null)
     {
       state = true;
     }

     return state;
  }

  @override
  deletePreferences() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('preferences', null);
  }

  @override
  savePreferences(PreferencesModel preferencesModel) async
  {
    var pref = json.encode(preferencesModel.toJson());

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('preferences', pref);
  }

  @override
  Future<PreferencesModel> getPreferences() async
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String data = prefs.getString('preferences');

    PreferencesModel preferencesModel = PreferencesModel.fromJson(json.decode(data));

    return preferencesModel;
  }

  @override
  Future<User> getUserData() async
  {
    PreferencesModel prefs = await this.getPreferences();

    User user = User.fromJson(json.decode(prefs.user));

    return user;
  }
  @override
  Future<bool> isFirstTime() async
  {
    bool state = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
      //await prefs.setString('user', null);
     state = prefs.getBool('first');

     if(state == null)
     {
       state = true;
       this.saveFirst();
     }

     return state;
  }

  @override
  saveFirst() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('first', false);
  }

  @override
  Future<List<City>> getFavorites() async
  {
    List<City> fvs = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String data = prefs.getString('preferences');

    PreferencesModel preferencesModel = PreferencesModel.fromJson(json.decode(data));

    List<dynamic> favsL = json.decode(preferencesModel.favorites);

    for(int i = 0; i < favsL.length; i++)
     {
       //print(favsL[i]);
       fvs.add(City.fromJson(json.decode(favsL[i])));
     }
    return fvs;
  }

  @override
  Future saveFavorites(City c) async
  {

    List favs = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String data = prefs.getString('preferences');

    PreferencesModel preferencesModel = PreferencesModel.fromJson(json.decode(data));

    if(preferencesModel.favorites != '')
    {
      favs = json.decode(preferencesModel.favorites);
    }

    favs.add(json.encode(c.toJson()));

    PreferencesModel pref = PreferencesModel(preferencesModel.user, '', json.encode(favs));

    this.savePreferences(pref);
  }

  
}
