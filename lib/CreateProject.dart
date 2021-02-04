import 'package:flutter/material.dart';

import 'components/header.dart';

class CreateProject extends StatelessWidget {
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
                // mini: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                onPressed: () {
                  // Add your onPressed code here!
                  buildSuccessDialog(context);
                },
                child: Icon(Icons.done),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            CreateProjectBody()
            // Body
          ],
        ),
      ),
    );
  }

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
                    Text('Project created successfully'),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/', (route) => false);
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
}

class CreateProjectBody extends StatelessWidget {
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
                'Create new Project',
                style: Theme.of(context).textTheme.headline6,
              ),
              IconButton(
                  icon: Icon(Icons.favorite_border_outlined), onPressed: null),
            ],
          ),
          // project name field
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              labelText: 'Project Name',
              filled: true,
            ),
          ),

          SizedBox(
            height: 10,
          ),
          // Color
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
                  icon: Icon(Icons.add),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, '/task');
                  })
            ],
          ),

          // devider
          Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
