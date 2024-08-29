import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions/extensions.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/custom_text_fields/k_textfields.dart';

class AddTeam extends StatefulWidget {
   AddTeam({super.key});

  @override
  State<AddTeam> createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  final FlutterContactPicker _contactPicker =  FlutterContactPicker();
   List<Contact>? _contacts;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.height,
          Text('Team A',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
          3.height,
          Text('Team Name',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
          GetTextField(context: context),
          2.height,
          Text('Add Players',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: GetTextField(context: context)),
              2.width,
              Expanded(
                flex: 2,
                child: kTextButton(
                    height: 5.h,
                    borderRadius: 26,
                    onPressed: (){
                      addPlayersDialog(context);
                    },
                    widget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Add Players',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                        const Icon(Icons.add,)
                      ],)
                ),
              ),
            ],
          ),

          Divider(
            height: 10.h,
            color: AppColor.primaryColor,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Player Name',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                  GetTextField(context: context),
                ],),
              ),
              2.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Phone Number',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                  GetTextField(context: context),
                ],),
              ),
              2.width,
              CircleAvatar(
                radius: 2.h,
                backgroundColor: AppColor.primaryColor,
                child: IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 2.h,)),
              )
            ],
          ),
          Divider(
            height: 10.h,
            color: AppColor.primaryColor,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 9,
                padding: EdgeInsets.zero,
                itemBuilder: (context,index){
              return  Card(
                margin: EdgeInsets.symmetric(vertical: 1.h),
                child: ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  onTap: (){},
                  tileColor: AppColor.containerGreyColor,
                  title: Text('Player ${index+1}',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
                  subtitle: Text('+91-1234567890',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w400),),
                  trailing:  CircleAvatar(
                    radius: 2.h,
                    backgroundColor: AppColor.primaryColor,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.minimize_rounded,size: 2.h,)),
                  )
                ),
              );
            }),
          )

        ],
      ).paddingSymmetric(horizontal: 10)
    );
  }

  void addPlayersDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Invite Link :', style: primaryTextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                Text(
                  'https://tdsports.com/invitelink', style: primaryTextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
                1.height,
                Text(
                  'Invite via Phone number :', style: primaryTextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
                GetTextField(
                  context: context,
                obSecureText: false,
                keyboardType: TextInputType.phone,
                ),
                2.height,
                Text(
                  'Invite via Contacts :',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
                GetTextField(context: context,
                  obSecureText: false,
                suffixIcon: Icons.contacts,
                  suffixOnTap: () async {
                    Contact? contact = await _contactPicker.selectContact();
                    setState(() {
                      _contacts = contact == null ? null : [contact];
                    });
                  },
                ),
                if (_contacts != null)..._contacts!.map((e) => Text(e.toString()),),
                2.height,
                Align(
                  alignment: Alignment.center,
                  child: kTextButton(
                    onPressed: () {
                      successDialog(context);
                    },
                    color: AppColor.primaryColor,
                    width: 40.w,
                    borderRadius: 26,
                    height: 5.h,
                    btnText: 'Send Invite',
                    textColor: AppColor.blackColor,
                  ),
                ),
              ],
            ),
          ),
    );
  }

  void successDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            icon: const CircleAvatar(
              radius: 50,
              backgroundColor: AppColor.primaryColor,
              child: Icon(Icons.check, color: Colors.white,size: 40,),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Booking',
                  style: primaryTextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                Text(
                  'Successful !',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                1.height,
                Text(
                  'We will confirm your booking in sometime',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                ),
                2.height,
                kTextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: AppColor.primaryColor,
                  width: 40.w,
                  borderRadius: 20,
                  height: 5.h,
                  btnText: 'Okay !',
                  textColor: AppColor.blackColor,
                ),
              ],
            ),
          ),
    );
  }
}
