import 'package:flutter/material.dart';

class Sliverpage extends StatefulWidget {
  @override
  _SliverpageState createState() => _SliverpageState();
}

class _SliverpageState extends State<Sliverpage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            ///Properties of app bar
            backgroundColor: Colors.green,
            floating: true,
            // pinned: true,
            expandedHeight: 200.0,

            ///Properties of the App Bar when it is expanded
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "SliverList Widget",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20.0,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.black26,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          MyList()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) => setState(() => _index = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_post_office), label: 'office'),
        ],
      ),
    );
  }
}

class MyList extends StatelessWidget {
  const MyList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      // Use a delegate to build items as they're scrolled on screen.
      delegate: SliverChildBuilderDelegate(
        // The builder function returns a ListTile with a title that
        // displays the index of the current item.
        (context, index) => ListTile(title: Text('Item #$index')),
        // Builds 1000 ListTiles
        childCount: 1000,
      ),
    );
  }
}
