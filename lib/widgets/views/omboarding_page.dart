///
//
/// @About:     Omboarding view for first open
// @File:       omboarding_page.dart
// @Date:       2020-05-27T23:45:18
// @Version:    $Rev:$ 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:popular_citiies/blocs/omboarding_bloc/omboarding_bloc.dart';
import 'package:popular_citiies/widgets/utils/colors.dart';
import 'package:popular_citiies/widgets/utils/screen_helper.dart';
import 'package:popular_citiies/widgets/views/home_page.dart';



class OmboardingPage extends StatelessWidget {
  final bool iosLogin;

  const OmboardingPage({Key key, this.iosLogin}) : super(key: key);
  @override
  Widget build(BuildContext context) 
  {
    ScreenHelper screen = new ScreenHelper(context);
    return BlocBuilder<OmboardingBloc, OmboardingState>(
      builder: (context, state)
      {
        List<PageViewModel> listPagesViewModel = [
          PageViewModel(
            title: "",
            bodyWidget: Column(
              children: <Widget>[
                Container(
                  height: screen.setHeight(40),
                  width: screen.setWidth(80),
                  alignment: Alignment.bottomCenter,
                  child:Image.asset('assets/img/logo.png', height: screen.setHeight(30)),
                ),
                Container(
                  height: screen.setHeight(14),
                  width: screen.setWidth(80),
                  alignment: Alignment.center,
                  child: Text('', style: TextStyle(fontSize: screen.setHeight(2.5), fontWeight: FontWeight.bold, color: AppColors.primary)),
                ),
              ],
            ),
            footer: Align(
              alignment: Alignment.bottomCenter,
              child: Text('Bienvendos a Zuapp una experiencia innovadora en servicio a domicilio.', style: TextStyle(fontSize: screen.setHeight(3.6), color: Colors.white), textAlign: TextAlign.center)
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: Column(
              children: <Widget>[
                Container(
                  height: screen.setHeight(40),
                  width: screen.setWidth(80),
                  alignment: Alignment.bottomCenter,
                  child:Image.asset('assets/img/logo.png', height: screen.setHeight(30)),
                ),
                Container(
                  height: screen.setHeight(14),
                  width: screen.setWidth(80),
                  alignment: Alignment.center,
                  child: Text('', style: TextStyle(fontSize: screen.setHeight(2.5), fontWeight: FontWeight.bold, color: AppColors.primary)),
                ),
              ],
            ),
            footer: Align(
              alignment: Alignment.bottomCenter,
              child: Text('Selecciona tu producto, paga con efectivo o tarjeta de crédito, síguelo y disfrútalo.', style: TextStyle(fontSize: screen.setHeight(3.6), color: Colors.white), textAlign: TextAlign.center)
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: Column(
              children: <Widget>[
                Container(
                  height: screen.setHeight(40),
                  width: screen.setWidth(80),
                  alignment: Alignment.bottomCenter,
                  child:Image.asset('assets/img/logo.png', height: screen.setHeight(30)),
                ),
                Container(
                  height: screen.setHeight(14),
                  width: screen.setWidth(80),
                  alignment: Alignment.center,
                  child: Text('', style: TextStyle(fontSize: screen.setHeight(2.5), fontWeight: FontWeight.bold, color: AppColors.primary)),
                ),
              ],
            ),
            footer: Align(
              alignment: Alignment.bottomCenter,
              child: Text('Toda una variedad de productos y servicios disponibles. Disfrútalos!', style: TextStyle(fontSize: screen.setHeight(3.6), color: Colors.white), textAlign: TextAlign.center)
            ),
          ),
        ];

        return IntroductionScreen(
          pages: listPagesViewModel,
          globalBackgroundColor: AppColors.primary,
          next: Material(
            color: AppColors.primary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(screen.setHeight(1.6)),
            child: Container(
              alignment: Alignment.center,
              height: screen.setHeight(3.2),
              width: screen.setWidth(20),
              child: Text('Siguiente', style: TextStyle(color: Colors.white, fontSize: screen.setHeight(2))),
            ),
          ),
          dotsDecorator: DotsDecorator(
            activeColor: Colors.white,
          ),
          done: Material(
            color: AppColors.primary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(screen.setHeight(1.6)),
            child: Container(
              alignment: Alignment.center,
              height: screen.setHeight(3.2),
              width: screen.setWidth(20),
              child: Text('Terminar', style: TextStyle(color: Colors.white, fontSize: screen.setHeight(2))),
            ),
          ),
          onDone: ()
          {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
          },
        );

      },
    );
  }
}