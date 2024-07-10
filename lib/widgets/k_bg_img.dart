import 'package:flutter/material.dart';
import 'package:touch_down/utils/asset_utils.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImgUtils.bgImg),
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        ),
      ),
    );
  }
}
