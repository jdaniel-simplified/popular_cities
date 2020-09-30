import 'package:cached_network_image/cached_network_image.dart';
///
//
/// @About:     
// @File:       city_detail.dart 
// @Date:       09-30-20
// @Version:    popular_cities 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:popular_cities/models/cities_model.dart';
import 'package:popular_cities/blocs/cities_bloc/cities_bloc.dart';
import 'package:popular_cities/widgets/utils/screen_helper.dart';

class CityDetail extends StatefulWidget {
  final City city;

  const CityDetail({Key key, this.city}) : super(key: key);
  @override
  _CityDetailState createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> {
  City city;

  @override
  void initState() {
    city = widget.city;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenHelper screen = new ScreenHelper(context);
    return Scaffold(
      body: BlocListener<CitiesBloc, CitiesState>(
        listener: (context, state)
        {

        },
        child: BlocBuilder<CitiesBloc, CitiesState>(
          builder: (ctx, st)
          {
            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                        height: screen.setHeight(18),
                        width: screen.setWidth(100),
                        alignment: Alignment.bottomCenter,
                        child: Text(city.name, style: TextStyle(fontSize: screen.textSize(4), fontWeight: FontWeight.bold), textAlign: TextAlign.center)
                    ),
                    SizedBox(height: screen.setHeight(2)),
                    Container(
                        height: screen.setHeight(22),
                        width: screen.setWidth(100),
                        padding: screen.allBorders(0, 0, 8, 8),
                        alignment: Alignment.bottomCenter,
                        child: Text(city.desc, style: TextStyle(fontSize: screen.textSize(2)), textAlign: TextAlign.justify)
                    ),
                    SizedBox(height: screen.setHeight(3)),
                    Container(
                        height: screen.setHeight(34),
                        width: screen.setWidth(100),
                        padding: screen.allBorders(0, 0, 4, 4),
                        alignment: Alignment.centerLeft,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: city.pictures.map((p) {
                            return Container(
                                height: screen.setHeight(34),
                                width: screen.setWidth(54),
                                margin: screen.allBorders(0, 0, 0, 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(screen.setHeight(2)),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(screen.setHeight(2)),
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) => Image.asset('assets/img/default.png', fit: BoxFit.fill),
                                    imageUrl: p.toString(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                    fit: BoxFit.fill,
                                  ),
                                )
                            );
                          }).toList(),
                        )
                    ),
                    SizedBox(height: screen.setHeight(3)),
                    Material(
                        borderRadius: BorderRadius.circular(screen.setHeight(3)),
                        elevation: 4.0,
                        color: Colors.grey[300],
                        child: Container(
                          height: screen.setHeight(6),
                          width: screen.setWidth(20),
                          alignment: Alignment.center,
                          padding: screen.allBorders(1, 1, 4, 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(FontAwesomeIcons.thumbsUp),
                              Text(city.likes.toString(), style: TextStyle(fontSize: screen.textSize(2), fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: screen.setHeight(20),
                    width: screen.setHeight(20),
                    padding: screen.sameBorders(4, 0),
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.reply),
                      onPressed: () => Navigator.pop(context),
                    ),
                  )
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.thumbsUp),
        onPressed: () => context.bloc<CitiesBloc>().add(DoAddLikeToCityEvent(city)),
      ),
    );
  }
}
