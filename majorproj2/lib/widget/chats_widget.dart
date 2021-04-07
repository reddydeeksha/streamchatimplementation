import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:majorproj2/main.dart';
import 'package:majorproj2/chat/chat_page_mobile.dart';
import 'package:majorproj2/widget/chats_widget.dart';
import 'package:majorproj2/widget/channel_list_widget.dart';
class ChatsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //final idUser=StreamChat.of(context).user.id;
    return ChannelListView(
      /*filter:{
        'members':{
           '\$in':[idUser],
        }
      },*/
      sort:[SortOption('last_message_at')],
    pagination: PaginationParams(limit:20),
    channelPreviewBuilder: (context,channel) =>
            ChannelListWidget(channel:channel),
    /*onChannelTap: (channel, _){
       Navigator.of(context).push(MaterialPageRoute(
         builder: (context) => ChatPageMobile(channel:channel),
         ));
    },*/
    );

  }
}