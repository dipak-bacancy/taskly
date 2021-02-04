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

  // delete dailog
  AlertDialog buildAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Project'),
      content: Text('Are you sure, you want to delete “Welcome 👋” Project?'),
      actionsPadding: EdgeInsets.symmetric(horizontal: 50),
      actions: [
        RaisedButton(
          onPressed: () {
            // Respond to button press

            Navigator.pop(context);
          },
          color: Colors.grey,
          textColor: Colors.white,
          child: Text('cancel'),
        ),
        SizedBox(
          width: 20,
        ),
        RaisedButton(
          onPressed: () {
            // Respond to button press
            Navigator.pop(context);
          },
          color: Colors.red,
          textColor: Colors.white,
          child: Text('Delete'),
        ),
      ],
    );
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

          ListTile(
            title: Text('Click this task to see more details'),
            tileColor: Colors.grey[100],
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
