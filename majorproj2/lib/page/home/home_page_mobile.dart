import 'package:majorproj2/widget/chats_widget.dart';
import 'package:flutter/material.dart';
import 'package:majorproj2/widget/user_image_widget.dart';
class HomePageMobile extends StatelessWidget{
  Widget build(BuildContext context) =>Scaffold(
    appBar:AppBar(
      title:Text('chats'),
      centerTitle: true,
      leading: UserImageWidget(),
      actions: [
        IconButton(icon: Icon(Icons.edit), onPressed: (){}),
        SizedBox(width:8),
      ],
    ),
    body: ChatsWidget(),
  );
}