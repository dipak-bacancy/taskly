import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final Widget minifab;
  final bool backNav;
  Header({@required this.title, this.minifab, this.backNav = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414,
      height: 159,
      padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildBackButton(context),
              Text(
                title,
                style: Theme.of(context).textTheme.headline3.merge(
                      TextStyle(color: Colors.black),
                    ),
              ),
            ],
          ),
          Align(
            child: Container(
                margin: EdgeInsets.only(right: 30),
                alignment: Alignment(1.8, 1.9),
                child: minifab),
          ),
        ],
      ),
    );
  }

  Widget buildBackButton(BuildContext context) {
    if (backNav) {
      return TextButton.icon(
        onPressed: () {
          Navigator.pop(context);
          // Respond to button press
        },
        icon: Icon(
          Icons.chevron_left,
          size: 18,
          color: Colors.black,
        ),
        label: Text(
          'Back',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      );
    } else {
      return SizedBox(
        height: 50,
      );
    }
  }
}
