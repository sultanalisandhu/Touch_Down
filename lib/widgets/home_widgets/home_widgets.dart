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
  const GameContainer({super.key, this.iconPath, this.sportName,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         CircleAvatar(
              radius: 4.h,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: const AssetImage( ImgUtils.containerBorderImg,),
            child: CircleAvatar(
              radius: 3.h,
                backgroundColor: Colors.white,
                child: Center(child: Image(image: AssetImage(iconPath!,),fit: BoxFit.contain,height: 5.h,width: 5.w,))
            ),
          ),
        1.height,
        Text(sportName!,style: primaryTextStyle(fontSize: 8,fontWeight: FontWeight.w400),)
      ],
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(updateName!,style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w600),),
                Text(newsDetails!,
                  style: primaryTextStyle(fontSize: 7,fontWeight: FontWeight.w400),),

              ],),
          ),
          Container(
            height: 5.h,
            width: 5.w,
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