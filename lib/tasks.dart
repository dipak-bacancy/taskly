import 'package:flutter/material.dart';

import 'components/header.dart';

class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            // top Header
            Header(
              title: 'Task',
              minifab: FloatingActionButton(
                mini: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Icon(Icons.repeat),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            buildTaskbody(context)
            // Body
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog<void>(
                context: context,
                builder: (context) => buildAlertDialog(context));
          },
          child: Icon(Icons.delete),
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
        ),
      ),
    );
  }

  Widget buildTaskbody(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: <Widget>[
          // title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Description :',
                style: Theme.of(context).textTheme.headline6,
              ),
              RaisedButton(
                onPressed: () {
                  // Respond to button press
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                color: Colors.green,
                textColor: Colors.white,
                child: Text('Completed'),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),
          // description
          TextFormField(
            initialValue: 'Click this task to see more details',
            maxLines: 4,
            decoration: InputDecoration(
              filled: true,
            ),
          ),

          SizedBox(height: 40),

          buildRichText('Project', 'Welcome 👋'),

          SizedBox(height: 10),
          buildRichText('Created at', 'Jan 12, 2021'),
        ],
      ),
    );
  }

  Text buildRichText(String item, String value) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: ' $item :  ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextSpan(text: value, style: TextStyle()),
        ],
      ),
    );
  }

  // delete dailog
  AlertDialog buildAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Delete task'),
      content: Text('Are you sure, you want to delete this task?'),
      // actionsPadding: EdgeInsets.symmetric(horizontal: 50),
      actions: [
        ButtonBar(
          buttonMinWidth: 120,
          buttonHeight: 45,
          children: [
            RaisedButton(
              onPressed: () {
                // Respond to button press
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0),
              ),
              color: Colors.grey,
              textColor: Colors.white,
              child: Text('Cancel'),
            ),
            RaisedButton(
              onPressed: () {
                // Respond to button press
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0),
              ),
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Delete'),
            )
          ],
        ),
      ],
    );
  }
}
