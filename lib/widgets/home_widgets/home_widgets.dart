import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';

class GameContainer extends StatelessWidget {
  final String? iconPath;
  final String? sportName;
  final Function()? onTap;
  final double? radius;
  final double? imgRadius;
  final Color? textColor;
  const GameContainer({super.key, this.iconPath, this.sportName,this.onTap, this.radius, this.imgRadius, this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
           CircleAvatar(
                radius: radius?? 5.h,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: const AssetImage( ImgUtils.containerBorderImg,),
              child: CircleAvatar(
                radius: imgRadius?? 4.h,
                  backgroundColor: Colors.white,
                  child: Center(child: Image(image: NetworkImage(iconPath!,),fit: BoxFit.cover,))
              ),
            ),
          1.height,
          Text(sportName!,style: primaryTextStyle(fontSize: 8,fontWeight: FontWeight.w400,color: textColor),)
        ],
      ),
    );
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
      margin:  EdgeInsets.symmetric(vertical: 0.5.h),
      padding:  EdgeInsets.all(1.h),
      decoration: BoxDecoration(
          color: AppColor.containerGreyColor,
          borderRadius: BorderRadius.circular(1.h)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(updateName!,style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w600),),
                Text(newsDetails!,
                  style: primaryTextStyle(fontSize: 8,fontWeight: FontWeight.w400),),

              ],),
          ),
          Container(
            height: 7.h,
            width: 6.5.w,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primaryColor,
            ),
            child:showSvgIconWidget(iconPath: IconUtils.nextIcon,height: 1.h,width: 1.w),
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
    padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h) ,
    decoration: BoxDecoration(
      color: isSelected? AppColor.primaryColor:Colors.transparent,
    borderRadius: BorderRadius.circular(18),
    border: Border.all(color: AppColor.primaryColor)
    ),
    child: Text(title!,style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: isSelected? AppColor.whiteColor:AppColor.blackColor),),
    ),
  );
}

Widget imgContainer({
  String? imgPath,
}){
  return Container(
    height: mQ.height*0.15,
    width: mQ.width,
    margin: const  EdgeInsets.symmetric(vertical: 10),
    decoration:  BoxDecoration(
        image: DecorationImage(image: AssetImage(imgPath!),fit: BoxFit.cover)
    ),
  );
}