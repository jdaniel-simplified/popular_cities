///
//
/// @About:     
// @File:       cards.dart 
// @Date:       09-30-20
// @Version:    popular_cities 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///
///
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:popular_cities/models/cities_model.dart';
import 'package:popular_cities/widgets/utils/screen_helper.dart';
import 'package:popular_cities/widgets/views/city_detail.dart';

class PopularCitiesCards
{
  Widget cityCard(City c, ScreenHelper screen, BuildContext context)
  {
    return InkWell(
      child: Column(
        children: [
          Material(
            elevation: 3.0,
            child: Container(
                height: screen.setHeight(18),
                width: screen.setWidth(94),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screen.setHeight(2)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screen.setHeight(2)),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Image.asset('assets/img/default.png', fit: BoxFit.fill),
                    imageUrl: c.pictures[0].toString(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),
                )
            ),
          ),
          SizedBox(height: screen.setHeight(1)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(c.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: screen.textSize(2.2))),
                  Text(c.desc.substring(0, 30) + '...', style: TextStyle(fontSize: screen.textSize(1.8)))
                ],
              ),
              Row(
                children: [
                  Icon(FontAwesomeIcons.thumbsUp),
                  SizedBox(width: screen.setWidth(2)),
                  Text(c.likes.toString(), style: TextStyle(fontSize: screen.textSize(2), fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          SizedBox(height: screen.setHeight(3))
        ],
      ),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CityDetail(city: c))),
    );
  }
}