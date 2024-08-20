

import 'package:flutter/material.dart';

class DrawerContent {
  String? title;
  IconData? icon;

  DrawerContent({this.title, this.icon});
}
List<DrawerContent> drawerList=[
  DrawerContent(title: 'My Stats'),
  DrawerContent(title: 'My Team'),
  DrawerContent(title: 'Book My Venue'),
  DrawerContent(title: 'Book My Trainer/Coach'),
  DrawerContent(title: 'Start Match'),
  DrawerContent(title: 'Start Tournament'),
  DrawerContent(title: 'Touchdown Store '),
  DrawerContent(title: 'Live', icon: Icons.live_tv),
  DrawerContent(title: 'Pick up & Drop'),
  DrawerContent(title: 'All Sports'),
  DrawerContent(title: 'Add Tournament'),
  DrawerContent(title: 'Become a Coach'),
  DrawerContent(title: 'Sports Installation'),
  DrawerContent(title: 'Community Connect'),
  DrawerContent(title: 'Help'),
  DrawerContent(title: 'Logout'),
];

List<DrawerContent> coachDrawerList=[
  DrawerContent(
    title: 'Add Availability',icon: Icons.event_available
  )
];