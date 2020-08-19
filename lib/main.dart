import 'package:drawerexamplewithanimations/custom_drawer.dart';
import 'package:drawerexamplewithanimations/custom_drawer_state.dart';
import 'package:drawerexamplewithanimations/routes/routes.dart';
import 'package:drawerexamplewithanimations/views/contact_list_view.dart';
import 'package:drawerexamplewithanimations/views/event_list_view.dart';
import 'package:drawerexamplewithanimations/views/note_list_view.dart';
import 'package:flutter/material.dart';
import 'injection/dependency_injection.dart';

void main() {
  Injector.configure(Flavor.MOCK);

  runApp(new MaterialApp(
    title: 'Flutter Demo',
    theme: new ThemeData(primarySwatch: Colors.indigo),
    home: ContactsPage(),
    routes: {
      Routes.contacts: (context) => ContactsPage(),
      Routes.events: (context) => EventsPage(),
      Routes.notes: (context) => NotesPage(),
    },
  ));
}

/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool flip = false;
    AppBar appBar = flip
        ? AppBar()
        : AppBar(
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => Custom_Drawer.of(context).open(),
                );
              },
            ),
            title: Text('Hello Flutter Europe'),
          );
    Widget child = MyHomePage(appBar: appBar);
    if (flip) {
      child = CustomDrawerState(child: child);
    } else {
      child = Custom_Drawer(child: child);
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: child,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final AppBar appBar;

  MyHomePage({Key key, @required this.appBar}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
