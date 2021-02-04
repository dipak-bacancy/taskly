import 'package:flutter/material.dart';

import 'components/header.dart';

class Project extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            // top Header
            Header(
              // backNav: true,
              title: 'Project',
              minifab: FloatingActionButton(
                mini: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Icon(Icons.done),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            // Body

            ProjectBody()
          ],
        ),
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
                    'Delete Project',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: Center(
                      child: Text(
                        'Are you sure, you want to delete “Welcome 👋” Project?',
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

class ProjectBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: <Widget>[
          // title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Project :',
                style: Theme.of(context).textTheme.headline6,
              ),
              IconButton(
                  icon: Icon(Icons.favorite_border_outlined), onPressed: null),
            ],
          ),

          // project name
          TextFormField(
            initialValue: 'Welcome',
            decoration: InputDecoration(
              filled: true,
            ),
          ),

          SizedBox(height: 10),
          // description

          Row(
            children: [
              Text(
                'Color',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(
                width: 40,
              ),
              Switch(
                value: false,
                onChanged: null,
              ),
            ],
          ),

          // Favorite
          Row(
            children: [
              Text(
                'Favorite',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(
                width: 40,
              ),
              Switch(
                value: false,
                onChanged: null,
              ),
            ],
          ),

          // Tasks
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Task:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              IconButton(
                  icon: Icon(Icons.add), color: Colors.black, onPressed: null)
            ],
          ),

          // devider
          Divider(
            color: Colors.black,
          ),

          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/task');
            },
            child: ListTile(
              title: Text('Click this task to see more details'),
              tileColor: Colors.grey[100],
            ),
          ),
          ListTile(
            title: Text('You can add subtasks here! ✅ '),
            tileColor: Colors.grey[100],
          ),
          ListTile(
            title: Text('Add a new task ➕'),
            tileColor: Colors.grey[100],
          )
        ],
      ),
    );
  }
}
