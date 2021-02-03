import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: 414,
              height: 159,
              padding: EdgeInsets.fromLTRB(20, 80, 0, 0),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Projects',
                    style: Theme.of(context).textTheme.headline3.merge(
                          TextStyle(color: Colors.black),
                        ),
                  ),
                  Align(
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      alignment: Alignment(1.8, 2.5),
                      child: FloatingActionButton(
                        onPressed: () {
                          // Respond to button press
                        },
                        mini: true,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0))),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              child: buildBodyGride(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBodyGride() {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
          ),
          delegate: SliverChildListDelegate(
            [
              buildSizedBox(
                icon: Icon(Icons.favorite),
                letter: 'T',
                title: 'Inbox',
              ),
              buildSizedBox(
                icon: Icon(Icons.favorite),
                letter: 'T',
                title: 'Inbox',
              ),
              buildSizedBox(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                letter: 'W',
                title: 'Welcome',
              ),
              buildSizedBox(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                letter: 'W',
                title: 'Welcome',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSizedBox({Icon icon, String letter, String title}) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
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
