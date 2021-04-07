import 'main.dart';

import 'test_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/services.dart';

class CustomKeyboardDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomKeyboardDemoState();
  }
}

class CustomKeyboardDemoState extends State<CustomKeyboardDemo> {
  TextEditingController textEditingController =
      TextEditingController();
  TextEditingController textEditing2Controller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    // TODO: implement build
    return KeyboardMediaQuery(child: Builder(builder: (ctx) {
      // CoolKeyboard.init(ctx);
      return Scaffold(
          appBar: AppBar(
            title: Text("Custom Keyboard Demo"),
          ),
          body: ListView(
            children: <Widget>[
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(labelText: 'email'),
                keyboardType: TestKeyboard.inputType,
              ),
              TextField(
                controller: textEditing2Controller,
                decoration: InputDecoration(labelText: 'password'),
                keyboardType: TestKeyboard.inputType,
              ),
              FlatButton(
                child: Text('Login'),
                onPressed: (){
                  if(textEditingController.text=="arthy" && textEditing2Controller.text=="arthyb" ){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>new SecondRoute()));
                  }
                  else{
                   return showDialog(
                      context: context,
                      builder: (context) {
                      return AlertDialog(
                      // Retrieve the text the user has entered by using the
                    // TextEditingController.
                    content: Text("Wrong username or password"),
                    );
                  },
                );
                  }
                  /*showInputDialogs(
                    context: context,messageWidget: Text('weertyg'),

                    //keyboardType: NumberKeyboard.inputType

                  );*/
                },
              ),
            ],
          ));
    }));
  }

  static Future<String> showInputDialogs(
      {@required BuildContext context,
      Widget titleWidget,
      Widget messageWidget,
      List<TextInputFormatter> inputFormatters,
      TextInputType keyboardType = TextInputType.number}) {
    String value;
    return showCupertinoDialog<String>(
        context: context,
        builder: (context) {
//       The minimum insets for contents of the Scaffold to keep visible.
          List<Widget> children = [];
          if (messageWidget != null) {
            children.add(messageWidget);
          }
          children.add(Form(
              child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Material(
                      child: Column(children: <Widget>[
                        TextField(
                    inputFormatters: inputFormatters,
                    keyboardType: keyboardType,
                    autofocus: true,
                    onChanged: (newValue) {
                      value = newValue;
                    },
                  ),
                  TextField(
                    inputFormatters: inputFormatters,
                    keyboardType: TextInputType.text,
                    onChanged: (newValue) {
                      value = newValue;
                    },
                  ),
                  TextField(
                    inputFormatters: inputFormatters,
                    keyboardType: keyboardType,
                    onChanged: (newValue) {
                      value = newValue;
                    },
                  )
                      ],)))));
          return CupertinoAlertDialog(
                title: titleWidget,
                content: Column(
                  children: children,
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text("12345"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text("4567y"),
                    onPressed: () {
                      Navigator.of(context).pop(value ?? '');
                    },
                  )
                ],
              );
        });
  }
}