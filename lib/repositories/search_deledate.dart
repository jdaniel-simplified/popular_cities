import 'package:flutter/material.dart';
import 'package:popular_cities/models/cities_model.dart';
import 'package:popular_cities/widgets/views/city_detail.dart';


class HomeSearch extends SearchDelegate
{
  final List<City> cities;

  HomeSearch(this.cities);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = '';
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    final suggestionList = this.cities;

    return ListView.builder(itemBuilder: (context, index) => ListTile(
      title: Text(this.cities[index].name),
      subtitle: Text(this.cities[index].desc.substring(0, 40)),
    ),
      itemCount: suggestionList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    final suggestionList = query.isEmpty
        ? []
    //: this.places.retainWhere((p) => p.name.toLowerCase().contains(RegExp(query, caseSensitive: false)));
        : this.cities.where((p) => p.name.toLowerCase().contains(query.toLowerCase(), 0)).toList();
    //List<WinePlace> ll = suggestionList;

    List<City> sugs = [];

    for(int i = 0; i < suggestionList.length; i++)
    {
      if(!sugs.contains(suggestionList[i]))
      {
        sugs.add(suggestionList[i]);
      }
    }
    return ListView.builder(itemBuilder: (context, index) => ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CityDetail(city: sugs[index]),
          ),
        );
      },
      trailing: Icon(Icons.remove_red_eye),
      title:RichText(
        text:
        TextSpan(
            text: sugs[index].name.substring(0, query.length),
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: sugs[index].name.substring(query.length),
                  style: TextStyle(color: Colors.grey)),
            ]),
      ),
    ),
      itemCount: sugs.length,
    );
  }

}