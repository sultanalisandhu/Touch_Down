import 'package:flutter/material.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';

class Centauraus extends StatelessWidget {
  final String? iconPath;
  final String? sportName;
  Function()? onTap;
  Centauraus({super.key, this.iconPath, this.sportName,this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        size: Size(150, 150),
        painter: SegmentedCirclePainter(),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(image: AssetImage(iconPath!), )
              ),
            ),
            10.height,
            Text(sportName!,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
          ],
        ),
      ),
    );
  }
}

class SegmentedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width / 2;

    // Paint for the complete circle background
    Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;

    // Draw the complete circle background
    canvas.drawCircle(Offset(radius, radius), radius, backgroundPaint);

    // Paint for the segmented strokes
    Paint paint = Paint()
      ..color = AppColor.primaryColor
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Set stroke edges to be rounded

    double segmentWidth = 30; // Width of each segment
    double gapWidth = 33; // Width of the gap between segments
    double angle = 0; // Starting angle

    for (int i = 0; i < 4; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        angle,
        segmentWidth / radius,
        false,
        paint,
      );
      angle += (segmentWidth + gapWidth) / radius;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


Widget newsContainer ({
  String? updateName,
  String? newsDetails,
  Function()? onTap
}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: mQ.width,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColor.containerGreyColor,
          borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(updateName!,style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                Text(newsDetails!,
                  style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),),

              ],),
          ),
          Container(
            height: mQ.height*0.04,
            width: mQ.width*0.10,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primaryColor,
            ),
            child:showSvgIconWidget(iconPath: IconUtils.nextIcon,height: 15,width: 15),
          )
        ],
      ),
    ),
  );
}


Widget addMatchContainer({
  String? title,
  Function()? onTap,
  required final bool isSelected,
}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10) ,
    decoration: BoxDecoration(
      color: isSelected? AppColor.primaryColor:Colors.transparent,
    borderRadius: BorderRadius.circular(18),
    border: Border.all(color: AppColor.primaryColor)
    ),
    child: Text(title!,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: isSelected? AppColor.whiteColor:AppColor.blackColor),),
    ),
  );
}

Widget imgContainer({
  String? imgPath,
}){
  return Container(
    height: mQ.height*0.15,
    width: mQ.width,
    margin: EdgeInsets.symmetric(vertical: 10),
    decoration:  BoxDecoration(
        image: DecorationImage(image: AssetImage(imgPath!),fit: BoxFit.cover)
    ),
  );
}