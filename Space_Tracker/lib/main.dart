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
	MyHomePage({this.title});
	
	// This widget is the home page of your application. It is stateful, meaning
	// that it has a State object (defined below) that contains fields that affect
	// how it looks.

	// This class is the configuration for the state. It holds the values (in this
	// case the title) provided by the parent (in this case the App widget) and
	// used by the build method of the State. Fields in a Widget subclass are
	// always marked "final".
	@override 
	_SatellitePageState createState() => _SatellitePageState();
	final String title;
}

class _SatellitePageState extends State<MyHomePage> {
	final List<Tab> myTabs = <Tab>[
		Tab(text: 'Satellites'),
		Tab(text: 'Launches'),
  	];
	  
	@override
	Widget build(BuildContext context) {
		return DefaultTabController(
		length: myTabs.length,
		child: Scaffold(
			appBar: AppBar(
			bottom: TabBar(
				tabs: myTabs,
			),
			),
			body: TabBarView(
			children: myTabs.map((Tab tab) {
				final String label = tab.text.toLowerCase();
				if (label == "satellites"){
					return Scaffold(
						body: Center(
							// Center is a layout widget. It takes a single child and positions it
							// in the middle of the parent.
							child: GridView.count(
									primary: true,
									padding: const EdgeInsets.all(20),
									crossAxisSpacing: 10,
									mainAxisSpacing: 10,
									crossAxisCount: 3,
									
									children: List.generate(50, (index){
										return new FlatButton(
											onPressed: (){},
											padding: const EdgeInsets.all(8),
											color: Colors.blue,
											child: new Center(
												child: const Text(
													'ISS',
													textAlign: TextAlign.center,
													style: TextStyle(
															fontSize: 24,
															fontWeight: FontWeight.bold,
															color: Colors.white
													),
												),
											),
										);
									},
								)
							),
						),
					);
				}else if (label == "launches"){

				}
			}).toList(),
			),
		),
		);
	}
}