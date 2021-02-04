import 'package:flutter/material.dart';

import 'components/header.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          // Header
          Header(
            backNav: false,
            title: 'Projects',
            minifab: FloatingActionButton(
              heroTag: "gotoCreateProject",
              onPressed: () {
                // Respond to button press

                Navigator.pushNamed(context, '/create');
              },
              // mini: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              child: Icon(Icons.add),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          // Body

          Expanded(
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProjectThumbnail(
                  icon: Icon(Icons.favorite),
                  letter: 'T',
                  title: 'Inbox',
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}

class ProjectThumbnail extends StatelessWidget {
  final Icon icon;
  final String letter;
  final String title;
  ProjectThumbnail({this.icon, this.letter, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/project');
          },
          child: Container(
            height: 80,
            width: 80,
            // color: Colors.grey[200],
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[300]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: icon,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    letter,
                    style: TextStyle(fontSize: 25),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(title),
        )
      ],
    );
  }
}
