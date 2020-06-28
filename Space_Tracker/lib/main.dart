import 'package:flutter/material.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Space Tracker',
			theme: ThemeData(
				// This is the theme of your application.
				//
				// Try running your application with "flutter run". You'll see the
				// application has a blue toolbar. Then, without quitting the app, try
				// changing the primarySwatch below to Colors.green and then invoke
				// "hot reload" (press "r" in the console where you ran "flutter run",
				// or simply save your changes to "hot reload" in a Flutter IDE).
				// Notice that the counter didn't reset back to zero; the application
				// is not restarted.
				primarySwatch: Colors.blue,
				// This makes the visual density adapt to the platform that you run
				// the app on. For desktop platforms, the controls will be smaller and
				// closer together (more dense) than on mobile platforms.
				visualDensity: VisualDensity.adaptivePlatformDensity,
			),
			home: MyHomePage(title: 'Space Tracker'),
		);
	}
}

class MyHomePage extends StatefulWidget {
	MyHomePage({this.title} );
	
	// This widget is the home page of your application. It is stateful, meaning
	// that it has a State object (defined below) that contains fields that affect
	// how it looks.

	// This class is the configuration for the state. It holds the values (in this
	// case the title) provided by the parent (in this case the App widget) and
	// used by the build method of the State. Fields in a Widget subclass are
	// always marked "final".
	@override 
	_HomePageState createState() => _HomePageState();
	final String title;
}

class _HomePageState extends State<MyHomePage> {
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			drawer: Drawer(
				// Add a ListView to the drawer. This ensures the user can scroll
				// through the options in the drawer if there isn't enough vertical
				// space to fit everything.
				child: ListView(
					// Important: Remove any padding from the ListView.
					padding: EdgeInsets.zero,
					children: <Widget>[
						DrawerHeader(
							child: Text('Drawer Header'),
							decoration: BoxDecoration(
								color: Colors.blue,
							),
						),
						ListTile(
							title: Text('Item 1'),
							onTap: () {
								// Update the state of the app.
								// ...
								Navigator.pop(context);
							},
						),
						ListTile(
							title: Text('Item 2'),
							onTap: () {
								// Update the state of the app.
								// ...
								Navigator.pop(context);
							},
						),
					],
				),
			),
			body: MenuButton()
		);
	}
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
    	builder: (context) =>
    		Align(
    			alignment: Alignment.topLeft,
    			child: SafeArea(
    				minimum: const EdgeInsets.all(16.0),
    				child: ClipOval(
    					child: Material(
    						color: Colors.grey[800], // button color
    						child: InkWell(
    							child: SizedBox(
    								width: 42,
    								height: 42,
    								child: Icon(Icons.menu, color: Colors.white)),
    							onTap: () {
    								Scaffold.of(context).openDrawer();
    							},
    						),
    					),
    				)
    			)
    		) 
    );
  }
}