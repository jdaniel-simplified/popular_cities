///
//
/// @About:     User preferences class model
// @File:       preferences_model.dart
// @Date:       09-28-20
// @Version:    popular_citiies 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///

class PreferencesModel
{
  final String user;
  final String settings;
  final String favorites;

  PreferencesModel(this.user, this.settings, this.favorites);

  PreferencesModel.fromJson(Map<String, dynamic> json) :
    user = json['user'],
    settings = json['settings'],
    favorites = json['favorites'];

    Map<String, dynamic> toJson() =>
    {
      'user': user,
      'settings': settings,
      'favorites' : favorites
    };
}
