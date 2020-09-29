import 'package:flutter/material.dart';
import 'package:popular_cities/widgets/utils/colors.dart';
import 'package:popular_cities/widgets/utils/screen_helper.dart';
class Loading
{
  Widget loadingProgress(BuildContext context, bool loading)
  {
    ScreenHelper screen = new ScreenHelper(context);
    return Visibility(
      visible: loading,
      child: Container(
        height: screen.setHeight(100),
        width: screen.setWidth(100),
        child: Stack(
          children: [
            new Opacity(
              opacity: 1,
              child: const ModalBarrier(dismissible: false, color: Colors.white),
            ),
            new Center(
              child: new CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppColors.primary),
              ),
            ),
          ],
        ),
      )
    );
  }
}