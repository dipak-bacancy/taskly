import 'package:flutter/material.dart';

import 'model/authentication.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // logo
            buildLogo(),
            SizedBox(
              height: 50,
            ),
            Text(
              'Welcome back!',
              style: TextStyle(fontSize: 24),
            ),

            SizedBox(
              height: 50,
            ),

            OutlineButton(
              color: Colors.blue,
              splashColor: Colors.grey,
              onPressed: () {
                // signin
                AuthenticationProvider().signInWithGoogle().then((result) {
                  if (result != null) {
                    Navigator.pushReplacementNamed(context, '/');
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('error'),
                    ));
                  }
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Text('Login with google'),
            ),
          ],
        ),
      ),
    );
  }

  Container buildLogo() {
    return Container(
      height: 80,
      width: 80,
      // padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue),
      child: Center(
        child: Text(
          "T",
          style: TextStyle(color: Colors.white, fontSize: 60.0),
        ),
      ),
    );
  }
}
