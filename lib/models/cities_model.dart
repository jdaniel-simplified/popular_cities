///
//
/// @About:     
// @File:       cities_model.dart 
// @Date:       09-28-20
// @Version:    popular_citiies 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///
///

class City
{
  final String id;
  final String name;
  final List<String> pictures;
  final String desc;
  final int likes;

  City(this.id, this.name, this.pictures, this.desc, this.likes);

  City.fromJson(Map<String, dynamic> json) :
   id = json['id'],
   name = json['name'],
   pictures = json['pictures'],
   desc = json['desc'],
   likes = json['likes'];

  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'name': name,
    'pictures': pictures,
    'desc': desc,
    'likes': likes
  };
}