
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:majorproj2/UserManualPage.dart';
import 'package:majorproj2/streamchatmain.dart';
import 'custom_keyboard.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:highlight_text/highlight_text.dart';
import 'test_keyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:cool_ui/cool_ui.dart';
import 'UserManualPage.dart';
import 'UserNotesDemo.dart';
//import 'custom_keyboard.dart';
import 'package:flutter/services.dart';
//import 'custom_button.dart';
//import 'package:eosdart/eosdart.dart' as eos;

void main() {
  NumberKeyboard.register();
  TestKeyboard.register();
  runApp(KeyboardRootWidget(child: MyApp()));
  // runApp(MyApp());
}
//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Login'),
     // home: KeyboardDemo(),
    );
  }
}

class MyHomePage extends StatefulWidget {
      MyHomePage({Key key, this.title}) : super(key: key);
      // This widget is the home page of your application. It is stateful, meaning
      // that it has a State object (defined below) that contains fields that affect
      // how it looks.
      // This class is the configuration for the state. It holds the values (in this
      // case the title) provided by the parent (in this case the App widget) and
      // used by the build method of the State. Fields in a Widget subclass are
      // always marked "final".
      final String title;
      @override
      _MyHomePageState createState() => new _MyHomePageState();
      //_KeyboardDemoState createState1() => _KeyboardDemoState();
      //SecondRoute createState2() => SecondRoute();
      
    }
class SecondRoute extends StatefulWidget{
    _SecondRoute createState() => new _SecondRoute();
}
class KeyboardDemo extends StatefulWidget{
    _KeyboardDemoState createState() => new _KeyboardDemoState();
}
class _SecondRoute extends State<SecondRoute> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Welcome',
       style: optionStyle,
    ),
    Text(
      'Index 1: Mic',
       style: optionStyle,
    ),
    Text(
      'Index 2: Keyboard',
      style: optionStyle,
    ),
    Text(
      'Index 3: User Manual',
      style: optionStyle,
    ),
    Text(
      'Index 4: Settings',
      style: optionStyle,
    ),

    
  ];

  //get bottomNavigationBar => null;

  void _onItemTapped(int index) { 
    setState(() {
      _selectedIndex = index;
    
    });
    if (index == 1){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>new MicDemo()));

    }
    if (index == 2){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>new KeyboardDemo()));

    }
    if (index == 3){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>new MyApp1()));

    }
    if (index == 4){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>new MyApp3()));

    }
    if (index == 5){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>new UserNotesDemo()));

    }
  }
  
  @override
  String text = 'Press the button and start speaking';
  @override
  Widget build(BuildContext context) {
    Material loginButon;
        return Scaffold(
          appBar: AppBar(
            //automaticallyImplyLeading: false,
            title: Text("Welcome"),
            //title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
        
          ), 

                //flatButtonLocation: FlatButtonLocation.centerFloat,
                
    

                body: Center( 
                    child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            backgroundColor: Colors.red,
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic_none),
            label: 'Mic',
            backgroundColor: Colors.red,
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard),
            label: 'Keyboard',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'User Manual',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'User Notes',
            backgroundColor: Colors.pink,
          ),
          
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
             
      ),
      );



             
            }
}
 
/*class UserManualDemo extends StatefulWidget{
  _UserManualDemo createState() => new _UserManualDemo();

}  
class _UserManualDemo extends State<UserManualDemo>{
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('User Manual'),
        
          ), 
              bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: FlatButton(

                child: Text('Back', style: TextStyle(fontSize: 20.0),),  
                color: Colors.blueAccent,  
                
                textColor: Colors.white,  
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>new MyApp1()));
                },  
          
      ),
                ),  
                
                body: Center(child: Text('hello'),)
        );
} 
}*/
class SettingsDemo extends StatefulWidget{
  _SettingsDemo createState() => new _SettingsDemo();
}  
class _SettingsDemo extends State<SettingsDemo>{
  Widget build(BuildContext context) {
    //Material loginButon;
        return Scaffold(
          appBar: AppBar(
            title: Text('Settings'),
          ), 
                bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: FlatButton(

                child: Text('Back', style: TextStyle(fontSize: 20.0),),  
                color: Colors.blueAccent,  
                
                textColor: Colors.white,  
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>new SecondRoute()));
                },  
          
      ),
                ),
                body: Center(child: Text('Settings'),)
        );
} 
} 
class MicDemo extends StatefulWidget{
  _MicDemo createState() => new _MicDemo();
}      
class _MicDemo extends State<MicDemo>{
final Map<String, HighlightedWord> _highlights = {
    'flutter': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
    'voice': HighlightedWord(
      onTap: () => print('voice'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'subscribe': HighlightedWord(
      onTap: () => print('subscribe'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'like': HighlightedWord(
      onTap: () => print('like'),
      textStyle: const TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'comment': HighlightedWord(
      onTap: () => print('comment'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState(); 
    _speech = stt.SpeechToText();
  }

  @override
  //String text = 'Press the button and start speaking';
  @override
  Widget build(BuildContext context) {
    //Material loginButon;
        return Scaffold(
          appBar: AppBar(
            //automaticallyImplyLeading: false,
            //title: Text("Second Route"),
            title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
        
          ), 

                //flatButtonLocation: FlatButtonLocation.centerFloat,
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                floatingActionButton: AvatarGlow(
                  animate: _isListening,
                  glowColor: Theme.of(context).primaryColor,
                  endRadius: 75.0,
                  duration: const Duration(milliseconds: 2000),
                  repeatPauseDuration: const Duration(milliseconds: 100),
                  repeat: true,
                  child: FloatingActionButton(
                    onPressed: _listen,
                    child: Icon(_isListening ? Icons.mic : Icons.mic_none),
                  ),
                ),
                bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: FlatButton(

                child: Text('Back', style: TextStyle(fontSize: 20.0),),  
                color: Colors.blueAccent,  
                
                textColor: Colors.white,  
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>new SecondRoute()));
                },  
          
      ),
                ),
                
                body: SingleChildScrollView(
                  reverse: true,
                  /*child:Column(
                    children:<Widget>[*/
                   child: Container(
                    padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
                    child: TextHighlight(
                      text: _text,
                      words: _highlights,
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      
                        
                      ),
                    ),
                    ),

                  /*  ]
                  ),*/
                ), 
        );
              
            }
          void _listen() async {
              if (!_isListening) {
                bool available = await _speech.initialize(
                  onStatus: (val) => print('onStatus: $val'),
                  onError: (val) => print('onError: $val'),
                );
                if (available) {
                  setState(() => _isListening = true);
                          _speech.listen(
                            onResult: (val) => setState(() {
                              _text = val.recognizedWords;
                              if (val.hasConfidenceRating && val.confidence > 0) {
                                _confidence = val.confidence;
                              }
                            }),
                          );
                        }
                      } else {
                        setState(() => _isListening = false);
                        _speech.stop();
                      }
                    }
                  
                    
                  
        
}

class SpeechApi{

  static final _speech=stt.SpeechToText();
  static Future<bool> toggleRecording({Function(Text) onResult}) async{
    @required Function(String text) onResult;
    final isAvailable=await _speech.initialize();
    if (isAvailable){
      _speech.listen(onResult: (value)=>onResult(value.recognizedWords));
    }
    return isAvailable;
  }
}

class _MyHomePageState extends State<MyHomePage> {
      FloatingActionButton floatingActionButton;
      /*TextEditingController textEditingController =
      TextEditingController(text: 'test');
      TextEditingController textEditing2Controller =
      TextEditingController(text: 'test');
      final KeyboardController controller ;*/
      String text = 'Press the button and start speaking';
      TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  //_MyHomePageState(this.controller);
      @override
      Widget build(BuildContext context){
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),

            child: Text(
              text,
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
        );
                        
                        final loginButon = Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0xff01A0C7),
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            //onPressed: () {},
                            child: Text("Login",
                                textAlign: TextAlign.center,
                                style: style.copyWith(
                                    color: Colors.white, fontWeight: FontWeight.bold)),
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder:(context)=>new CustomKeyboardDemo()),
                                      );
                                      
                                    },
                          ),
                          );
                        
                
                        return Scaffold(
                          body: Center(
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(36.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 155.0,
                                      child: Image.asset(
                                        "assets/logo.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(height: 45.0),
                                    /*emailField,
                                    SizedBox(height: 25.0),
                                    passwordField,
                                    SizedBox(
                                      height: 35.0,
                                    ),*/
                                    loginButon,
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ), //FloatingActionButton floatingActionButton, 
                        );
                      }
          Future  toggleRecording() =>SpeechApi.toggleRecording(
            onResult: (text) => setState(() => this.text = text as String),
          );

  }
class _KeyboardDemoState extends State<KeyboardDemo> {
  TextEditingController _controller = TextEditingController();
  bool _readOnly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //resizeToAvoidBottomPadding: false,
      body: Column(
        children: [
          SizedBox(height: 50),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            style: TextStyle(fontSize: 24),
            autofocus: true,
            showCursor: true,
            readOnly: _readOnly,
          ),
          
          IconButton(
            icon: Icon(Icons.keyboard),
            onPressed: () {
              setState(() {
                _readOnly = !_readOnly;
              });
            },
          ),
          Spacer(),
          Container(  
                    margin: EdgeInsets.all(25), 
                    alignment: Alignment.bottomCenter, 
                    child: 
                    FlatButton(  
                child: Text('back', style: TextStyle(fontSize: 20.0),),  
                color: Colors.blueAccent,  
                
                textColor: Colors.white,  
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>new SecondRoute()));
                },  
              ),

                ),
          CustomKeyboard(
            onTextInput: (myText) {
              _insertText(myText);
            },
          ),
        ],
      ),
    );
  }

  void _insertText(String myText) {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final selectionLength = textSelection.end - textSelection.start;

    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      _controller.text = newText;
      _controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }

    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CustomKeyboard extends StatelessWidget {
  CustomKeyboard({
    Key key,
    this.onTextInput,
    //this.onBackspace,
  }) : super(key: key);

  final ValueSetter<String> onTextInput;
  //final VoidCallback onBackspace;

  void _textInputHandler(String text) => onTextInput?.call(text);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: Colors.blue,
      child: Column(
        children: [
          buildRowOne(),
          buildRowTwo(),
          buildRowThree(),
          buildRowFour(),
        ],
      ),
    );
  }
  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'q',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'w',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'e',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'r',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 't',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'y',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'u',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'i',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'o',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'p',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }
  

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'a',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 's',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'd',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'f',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'g',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'h',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'j',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'k',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'l',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }
  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'z',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'x',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'c',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'v',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'b',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'n',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'm',
            onTextInput: _textInputHandler,
          ),
          /*BackspaceKey(
            onBackspace: _backspaceHandler,
          ),*/
        ],
      ),
    );
  }
  Expanded buildRowFour() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: ' ',
            flex: 4,
            onTextInput: _textInputHandler,
          ),
          
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    Key key,
    @required this.text,
    this.onTextInput,
    this.flex = 1,
  }) : super(key: key);

  final String text;
  final ValueSetter<String> onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.blue.shade300,
          child: InkWell(
            onTap: () {
              onTextInput?.call(text);
            },
            child: Container(
              child: Center(child: Text(text)),
            ),
          ),
        ),
      ),
    );
  }
}

/*class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    Key key,
    //this.onBackspace,
    this.flex = 1,
  }) : super(key: key);

  //final VoidCallback onBackspace;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Colors.blue.shade300,
          child: InkWell(
            onTap: () {
              onBackspace?.call();
            },
            child: Container(
              child: Center(
                child: Icon(Icons.backspace),
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/
