# Flutter

- [Background](#background)
- [Widget](#widget)
- [Layout in Flutter](https://flutter.dev/docs/development/ui/layout)
- [Animated Container](#animated-container)
- [Animated Opacity](#animated-opacity)
- [Navigation Drawer](#navigation-drawer)
- [States](#states)
  - [Provider](#provider)
  - [Redux](#redux)
  - [BloC](#bloc)
- [Web Socket](#web-socket)

####  Background

Flutter is a cross-platform mobile app development framework by Google. It used Dart programming language. Flutter compiles to actual native code for (ARM) and is rendered using a library named skia.

- Flutter also supports hot reloading for faster development
- A flutter app is represented by a `widget tree` similar to the `DOM` on the browser.

-  Flutter app uses an `event loop`. Which is a background infinite loop periodically wake up and checks the `event queue` to see if there is any task assigned. If the **CPU is idle**, the event loop puts the task onto the `run stack`. 


### Widget

Flutter is a reactive library like ReactJS on Web. In flutter, ***everything is a widget*** and every widget is a dart class. Using widget we create view.

#### Widgets are 2 types:

1. Stateless - it's immutable
2. Statefull - tracks it's own internal state

#### Some common widgets are:

- Layout - `Container, Row, Column, Scaffold, Stack`
- Structures - `Button, Toast, MenuDrawer`
- Styles - `TextStyle, Color`
- Animations - `FadeInPhoto, transformations`
- Position, Alignment - `Center, Padding`

##### Flutter favors composition over class inheritance

- Every widget must have a `build` method which must returns `widget`
- `BuildContext` contains the reference of the widget location in the widget tree

##### Stateless widget example

```dart
class MyApp extends StatelessWidget {                      
  @override  
  Widget build(BuildContext context) {                     
    return MaterialApp(                                    
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),   
    );
  }
}
```

- Every `StatefulWidget` must have a `createState`method which returns a `State`object
- Every `StatefulWidget` has an associated `State` object, which have a `build`method
- Using `setState(() { })` method state object uses to manage internal state

##### Stateful widget example

```dart
class MyHomePage extends StatefulWidget {
@override
  _MyHomePageState createState() => _MyHomePageState();   
}

class _MyHomePageState extends State<MyHomePage> { 
  int _counter = 0;
  
  @override
  Widget build(BuildContext context) { 
    return Container();
  }
  
  void increment() {
     setState(() {
      _counter += 1;
     });
  }
}
```

### Animated Container

`ÀnimatedContainer` widget when change the properties it shows animation. It's similar like the `Container` widget. It's called implicit animation. [Code](https://github.com/mahmudahsan/thinkdiff/blob/master/flutter/small_demo/animation_container/lib/main.dart)

### Animated Opacity
If we need a widget to fade in and fade out, we can use `AnimatedOpacity` widget. Using `opacity` and `duration` properties we can change the opacity with animation.

```dart
       AnimatedOpacity(
          opacity: _isVisible ? 1 : 0,
          duration: Duration(milliseconds: 500),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),
        ),
      ),

```
[Sample App](https://github.com/mahmudahsan/thinkdiff/blob/master/flutter/small_demo/fade_widget/lib/main.dart)

### Navigation Drawer

To show a navigation drawer within material app, `Scaffold` has a `drawer` property where we can initiate `Drawer()` widget. [Code](https://github.com/mahmudahsan/thinkdiff/blob/master/flutter/small_demo/drawer/lib/main.dart)

### States

There are two types of state:
1. Ephemeral (Widget Specific)
2. App (Global)

**How to do State Management**
1. Simple State (Stateful Widget)
2. InheritedWidget (low level)
3. Provider (Syntactic sugar of InheritedWidget, Recommended)
4. Scoped Model (No longer recommended)
5. Redux
6. BloC (Business Logic Component)

### Provider

It is a [3rd party library](https://pub.dev/packages/provider).

[My Sample Project of Provider](https://github.com/mahmudahsan/thinkdiff/tree/master/flutter/small_demo/states_provider)

There are 3 important class to use this library:
1. `ChangeNotifier` builtin class
2. `ChangeNotifierProvider`
3. `Consumer`

* `ChangeNotifier` is a simple class which provides notification to it's listeners. It's kind of `Observable` pattern. We can extends or use ChangeNotifier as a mixin to create our state model. We only need the `notifyListeners()` to notify the listeners.

```dart
import 'package:flutter/material.dart';

class UI with ChangeNotifier {
  double _fontSize = 0.5;

  set fontSize(newValue) {
    _fontSize = newValue;
    notifyListeners();
  }

  double get fontSize => _fontSize * 30;

  double get sliderFontSize => _fontSize;
}
```

* `ChangeNotifierProvider` is a widget that sends an instance of `ChangeNotifier` to it's descendent. I found it's better to put this widget at the top level of the widget tree.

```dart
import 'package:flutter/material.dart';
import 'package:states_provider/home.dart';
import 'package:states_provider/about.dart';
import 'package:states_provider/settings.dart';
import 'package:provider/provider.dart';
import 'package:states_provider/model/ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => UI(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/about': (context) => About(),
          '/settings': (context) => Settings(),
        },
      ),
    );
  }
}
```

* `Consumer` widget it the widget where we need to consume the change. It's best practice to put `Consumer` as deep in the widget tree as possible.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:states_provider/drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:states_provider/model/ui.dart';

class About extends StatelessWidget {
  String text = lorem(paragraphs: 3, words: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerMenu(),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Consumer<UI>(
          builder: (context, ui, child) {
            return RichText(
              text: TextSpan(
                text: text,
                style:
                    TextStyle(fontSize: ui.fontSize, color: Colors.lightBlue),
              ),
            );
          },
        ),
      ),
    );
  }
}

```

If we do not need to update the widget based on the data  in the model but only need to access it. Then we can use `Provider.of()<T>(context, listen:false)` with listen parameter as `false` 

```dart
Provider.of<CartModel>(context, listen: false).methodName;
```

### Redux
My Sample Project: [Redux](https://git.io/fjScV)
Library: 
* [Redux](https://pub.dev/packages/redux)
* [Flutter Redux](https://pub.dev/packages/flutter_redux)
* [Redux Thunk](https://pub.dev/packages/redux_thunk)

##### Step 1: create an `AppState` model

```dart
import 'package:flutter/material.dart';

class AppState {
  double sliderFontSize;
  bool bold;
  bool italic;

  AppState(
      {@required this.sliderFontSize, this.bold = false, this.italic = false});

  AppState.fromAppState(AppState another) {
    sliderFontSize = another.sliderFontSize;
    bold = another.bold;
    italic = another.italic;
  }

  double get viewFontSize => sliderFontSize * 30;
}
```

##### Step 2: Create Actions

```dart
/// Actions with Payload
class FontSize {
  final double payload;
  FontSize(this.payload);
}

class Bold {
  final bool payload;
  Bold(this.payload);
}

class Italic {
  final bool payload;
  Italic(this.payload);
}
```

##### Step 3: Create Reducers

```dart
import 'package:states_redux/model/app_state.dart';
import 'package:states_redux/redux/actions.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  if (action is FontSize) {
    newState.sliderFontSize = action.payload;
  } else if (action is Bold) {
    newState.bold = action.payload;
  } else if (action is Italic) {
    newState.italic = action.payload;
  }

  return newState;
}
```

##### Step 4: Create Store in the Main.dart

```dart
import 'package:flutter/material.dart';
import 'package:states_redux/home.dart';
import 'package:states_redux/about.dart';
import 'package:states_redux/settings.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:states_redux/model/app_state.dart';
import 'package:states_redux/redux/reducers.dart';

void main() {
  final _initialState = AppState(sliderFontSize: 0.5);
  final Store<AppState> _store =
      Store<AppState>(reducer, initialState: _initialState);

  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/about': (context) => About(),
          '/settings': (context) => Settings(),
        },
      ),
    );
  }
}
```

##### Step 5: Use State and Dispatch Action

```dart
import 'package:flutter/material.dart';
import 'package:states_redux/drawer_menu.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:states_redux/model/app_state.dart';
import 'package:states_redux/redux/actions.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Settings'),
      ),
      drawer: DrawerMenu(),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Font Size: ${state.viewFontSize.toInt()}',
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline.fontSize),
                ),
              ),
              Slider(
                  min: 0.5,
                  value: state.sliderFontSize,
                  onChanged: (newValue) {
                    StoreProvider.of<AppState>(context)
                        .dispatch(FontSize(newValue));
                  }),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: state.bold,
                        onChanged: (newValue) {
                          try {
                            StoreProvider.of<AppState>(context)
                                .dispatch(Bold(newValue));
                          } catch (e) {
                            print(e);
                          }
                        }),
                    Text(
                      'Bold',
                      style: getStyle(state.bold, false),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: state.italic,
                        onChanged: (newValue) {
                          StoreProvider.of<AppState>(context)
                              .dispatch(Italic(newValue));
                        }),
                    Text(
                      'Italic',
                      style: getStyle(false, state.italic),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}
```

### Bloc
B.Lo.C stands for Business Logic Components. Which takes 'Event' as input and produce 'State' as output. Bloc is built on top of RxDart

* [Official Tutorial](https://felangel.github.io/bloc/#/gettingstarted)

##### Architecture
> We can separate an application into three Layers:
1. Data Layer
    * Data Provider
    * Repository
2. Business Logic
3. Presentation

##### 1. Data Layer
It's responsibility is to provide data from any source. 
**Data Provider** provides raw data and **repository** is a wrapper of one or more data providers.

##### 2. Bloc or Business Logic
It's responsibility is to received events from presentation layer and respond with new state. It works as a bridge between data layer and presentation layer.

##### 3. Presentation Layer
It's responsibility is to render itself based on one or more bloc states. It also handles user input and application lifecycle events.

#### Concepts

##### 1. Events
Events are input to a Bloc. It's similar concept of like `action` in Redux. In presentation layer events are generated by user interaction like a button click and passed to Bloc. An event may contain some additional data.

##### 2. States
State are part of application's state. It is the output of a Bloc. When a state changed, UI components will get the notification and based on current state it can re render itself.

##### 3. Transition
The change from one state to another is called transition. It holds current state, event, and the next state.

##### 4. Bloc
- A `Bloc` must extends the base `Bloc` class from the core `bloc` package. 
- Every `Bloc` must define an initial state
- It must implement a function called `mapEventToState`. This function takes incoming `event` as argument. It also returns a `stream` of new `state` as output.
- To access the current bloc state we can use `currentState` property
- A bloc has a `dispatch` method. `Dispatch` takes an `event` and triggers `mapEventToState`. `Dispatch` can be called in presentation layer or from within a bloc
- `onTransition` is called before a bloc state is updated
- `onError` can override to know bloc exception.



**My Demo Project:** [Bloc](https://git.io/fjbWm)

> Library: 
* [Bloc](https://pub.dev/packages/bloc)
* [Flutter Bloc](https://pub.dev/packages/flutter_bloc)


##### Step 1: Create Events 

```dart
part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {
  final dynamic payload;
  SettingsEvent(this.payload);
}

class FontSize extends SettingsEvent {
  FontSize(double payload) : super(payload);
}

class Bold extends SettingsEvent {
  Bold(bool payload) : super(payload);
}

class Italic extends SettingsEvent {
  Italic(bool payload) : super(payload);
}

```

##### Step 2: Create State 

```dart
part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {
  final double sliderFontSize;
  final bool isBold;
  final bool isItalic;

  SettingsState({this.sliderFontSize, this.isBold, this.isItalic});

  double get fontSize => sliderFontSize * 30;
}

class InitialSettingsState extends SettingsState {
  InitialSettingsState()
      : super(sliderFontSize: 0.5, isBold: false, isItalic: false);
}

class NewSettingState extends SettingsState {
  NewSettingState.fromOldSettingState(SettingsState oldState,
      {double sliderFontSize, bool isBold, bool isItalic})
      : super(
          sliderFontSize: sliderFontSize ?? oldState.sliderFontSize,
          isBold: isBold ?? oldState.isBold,
          isItalic: isItalic ?? oldState.isItalic,
        );
}

```

##### Step 3: Create Bloc

```dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsState get initialState => InitialSettingsState();

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is FontSize) {
      yield NewSettingState.fromOldSettingState(currentState,
          sliderFontSize: event.payload);
    } else if (event is Bold) {
      yield NewSettingState.fromOldSettingState(currentState,
          isBold: event.payload);
    } else if (event is Italic) {
      yield NewSettingState.fromOldSettingState(currentState,
          isItalic: event.payload);
    }
  }
}

```

##### Step 4: Create BlocProvider in `main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:states_bloc/home.dart';
import 'package:states_bloc/about.dart';
import 'package:states_bloc/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_bloc/bloc/settings/settings_bloc.dart';

void main() {
  final BlocProvider<SettingsBloc> blocProvider = BlocProvider<SettingsBloc>(
    builder: (_) => SettingsBloc(),
    child: MyApp(),
  );

  runApp(blocProvider);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/about': (context) => About(),
        '/settings': (context) => Settings(),
      },
    );
  }
}

```

##### Step 5: Use Bloc state and dispatch events

```dart
/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';
import 'package:states_bloc/drawer_menu.dart';
import 'package:states_bloc/bloc/settings/settings_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  double _value = 0.5;
  bool isBold = false;
  bool isItalic = false;

  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Settings'),
      ),
      drawer: DrawerMenu(),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Font Size: ${state.fontSize.toInt()}',
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline.fontSize),
                ),
              ),
              Slider(
                  min: 0.5,
                  value: state.sliderFontSize,
                  onChanged: (newValue) {
                    settingsBloc.dispatch(FontSize(newValue));
                  }),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: state.isBold,
                      onChanged: (newVal) {
                        settingsBloc.dispatch(Bold(newVal));
                      },
                    ),
                    Text(
                      'Bold',
                      style: getStyle(state.isBold, false),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: state.isItalic,
                        onChanged: (newVal) {
                          settingsBloc.dispatch(Italic(newVal));
                        }),
                    Text(
                      'Italic',
                      style: getStyle(false, state.isItalic),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}
```

### Web Socket

WebSocket is a computer communications protocol, providing full-duplex communication channels over a single TCP connection. Using this protocol, server also can push data to client even if client not requested. Like a chat app.

Library: [Web Socket](https://pub.dev/packages/web_socket_channel)
```
dependencies:
  web_socket_channel: ^1.0.15
```

#### Demo

```
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Web Socket Demo'),
        ),
        body: WebSocketDemo(),
      ),
    );
  }
}

class WebSocketDemo extends StatefulWidget {
  final WebSocketChannel channel =
      IOWebSocketChannel.connect('ws://echo.websocket.org');

  @override
  _WebSocketDemoState createState() => _WebSocketDemoState(channel: channel);
}

class _WebSocketDemoState extends State<WebSocketDemo> {
  final WebSocketChannel channel;
  final inputController = TextEditingController();
  List<String> messageList = [];

  _WebSocketDemoState({this.channel}) {
  // Comment below part if use StreamBuilder Widget
    channel.stream.listen((data) {
      setState(() {
        print(data);
        messageList.add(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: inputController,
                    decoration: InputDecoration(
                      labelText: 'Send Message',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text(
                      'Send',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (inputController.text.isNotEmpty) {
                        print(inputController.text);
                        channel.sink.add(inputController.text);
                      }
                      inputController.text = '';
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: getMessageList(),
          ),
//          Expanded(
//            child: StreamBuilder(
//              stream: channel.stream,
//              builder: (context, snapshot) {
//                if (snapshot.hasData) {
//                  messageList.add(snapshot.data);
//                }
//
//                return getMessageList();
//              },
//            ),
//          ),
        ],
      ),
    );
  }

  ListView getMessageList() {
    List<Widget> listWidget = [];

    for (String message in messageList) {
      listWidget.add(ListTile(
        title: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              style: TextStyle(fontSize: 22),
            ),
          ),
          color: Colors.teal[50],
          height: 60,
        ),
      ));
    }

    return ListView(children: listWidget);
  }

  @override
  void dispose() {
    inputController.dispose();
    widget.channel.sink.close();
    super.dispose();
  }
}


```
