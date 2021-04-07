import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:majorproj2/api/stream_api.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:majorproj2/page/home/home_page_mobile.dart';
import 'package:majorproj2/api/stream_user_api.dart';
import 'api/stream_channel_api.dart';
import 'package:uuid/uuid.dart';
class MyApp3 extends StatelessWidget{
Future main1() async{
   WidgetsFlutterBinding.ensureInitialized();
   await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
   ]);
   /*final idUser=Uuid().v4();
   print('IdUser:$idUser');
   await StreamUserApi.createUser(
     idUser: idUser,
     username: 'Deeksha',
     urlImage: '',
   );*/
   final idUser = '7A111F45-21CF-4DFE-A96E-6CB58E5C01A1';
   await StreamUserApi.login(idUser: idUser);
   await StreamChannelApi.createChannelWithUsers(
     name: 'My First Channel',
     urlImage: 'http://images.unsplash.com/photo-1529736576495-1ed4a29ca7e1?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
     idMembers: [idUser],
   );
   runApp(MyApp2());
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class MyApp2 extends StatelessWidget{
    static final String title = 'Facebook Messenger';
    @override
    Widget build(BuildContext context) => StreamChat(
      streamChatThemeData: StreamChatThemeData(),
      client: StreamApi.client,
      child: ChannelsBloc(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: title,
                theme: ThemeData(
                  primaryColor: Colors.white,
                  ),
                home: HomePageMobile()),
            
            ),
            
          );
      
        ChannelsBloc({MaterialApp child}) {}
}
