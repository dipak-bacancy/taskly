import 'package:flutter/material.dart';

import 'components/header.dart';

class TaskDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            // top Header
            Header(
              title: 'Task',
              minifab: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    color: Colors.green[400],
                    textColor: Colors.white,
                    child: Text('FINISH'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    mini: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () {
                      buildSuccessDialog(context);
                    },
                    child: Icon(Icons.done),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),

            buildTaskbody(context)
            // Body
          ],
        ),
        // delete button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            buildDeleteDialog(context);
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

// task updated Dailog
  Future buildSuccessDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.green,
                      ),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Success',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Task Updated successfully'),
                    RaisedButton(
                      onPressed: () {
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, '/', (route) => false);

                        Navigator.pop(context);
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text('OK'),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

// delete dailog
  Future buildDeleteDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delete Task',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: Center(
                      child: Text(
                        'Are you sure, you want to delete this task?',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
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
              ),
            ),
          );
        });
  }
}
