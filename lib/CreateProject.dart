import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
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

class CreateProjectBody extends StatefulWidget {
  @override
  _CreateProjectBodyState createState() => _CreateProjectBodyState();
}

class _CreateProjectBodyState extends State<CreateProjectBody> {
  Color _tempMainColor;

  Color _mainColor = Colors.blue;

  bool _favorite = false;

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('SUBMIT'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _mainColor = _tempMainColor);
              },
            ),
          ],
        );
      },
    );
  }

  void _openMainColorPicker() async {
    _openDialog(
      "Main Color picker",
      MaterialColorPicker(
        selectedColor: _mainColor,
        allowShades: false,
        onMainColorChange: (color) => setState(() => _tempMainColor = color),
      ),
    );
  }

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
              GestureDetector(
                onTap: () {
                  _openMainColorPicker();
                },
                child: CircleAvatar(
                  backgroundColor: _mainColor,
                  radius: 15.0,
                ),
              )
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
                value: _favorite,
                onChanged: (val) => setState(() => _favorite = val),
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
