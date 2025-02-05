import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
  _HomePageState createState() => _HomePageState("Tim Bibbee");
  final String title;
}

class _HomePageState extends State<MyHomePage> {
  _HomePageState(this._username);
  double _cornerRadius = 18.0;
  double maxHeightHelpBar, minHeightHelpBar;

  @override
  Widget build(BuildContext context) {
    maxHeightHelpBar = MediaQuery.of(context).size.height / 3;
    minHeightHelpBar = MediaQuery.of(context).size.height / 6;
    return Scaffold(
      drawer: SettingsDrawer(username: _username),
      body: Stack(children: <Widget>[
        MapWidget(),
        MenuButton(),
        SlidingUpPanel(
          maxHeight: maxHeightHelpBar,
          minHeight: minHeightHelpBar,
          panel: HelpSheet(maxHeightHelpBar),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_cornerRadius),
              topRight: Radius.circular(_cornerRadius)),
          onPanelOpened: () {
            setState(() {
              _cornerRadius = 0.0;
            });
          },
          onPanelClosed: () {
            setState(() {
              _cornerRadius = 18.0;
            });
          },
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          title: Text('Quotes'),
        ),
      ]),
    );
  }

  final String _username;
}

class HelpSheet extends StatelessWidget {
  const HelpSheet(
    this._maxHeight, {
    Key key,
  }) : super(key: key);

  final double _maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _maxHeight,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0),
            )),
        child: SafeArea(
            minimum: const EdgeInsets.only(top: 0, left: 36, right: 36),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                HelpSearchBar(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Text(
                    "Quick Select",
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 10,
                  indent: 5.0,
                ),
                QuickHelpGrid()
              ],
              shrinkWrap: true,
            )));
  }
}

class QuickHelpGrid extends StatelessWidget {
  const QuickHelpGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        primary: true,
        padding: EdgeInsets.only(top: 5.0),
        crossAxisCount: 3,
        shrinkWrap: true,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        children: <Widget>[
          QuickHelpItem("Computer"),
          QuickHelpItem("Phone"),
          QuickHelpItem("Network")
        ]);
  }
}

class QuickHelpItem extends StatelessWidget {
  const QuickHelpItem(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(title, style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    );
  }

  final String title;
}

class HelpSearchBar extends StatelessWidget {
  const HelpSearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
                minimum: const EdgeInsets.all(0.0),
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Need help?')))));
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/ubermapimage.jpg'), fit: BoxFit.fill)),
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
        builder: (context) => Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
                minimum: const EdgeInsets.all(16.0),
                child: ClipOval(
                  child: Material(
                    color: Colors.white, // button color
                    child: InkWell(
                      child: SizedBox(
                          width: 42,
                          height: 42,
                          child: Icon(Icons.menu, color: Colors.black)),
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                ))));
  }
}

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({
    Key key,
    @required String username,
  })  : _username = username,
        super(key: key);

  final String _username;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.

      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(_username, style: TextStyle(fontSize: 24))),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text('Account'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Payment'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Previous Order'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
