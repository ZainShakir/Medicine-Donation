import 'package:db_project/inputfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:db_project/sign_up.dart';
import 'update_password.dart';

class Inputwrapper extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  void hello() {
    print("Hello world");
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Inputfield(),
        // ignore: prefer_const_constructors
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return MyForgetPassword();
              }));
            },
            child: Text('Forgot Password ?'),
          ),
        ),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.73,
          child: ElevatedButton(
            onPressed: hello,
            child: Text(
              'Login',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t have an Account ?'),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return MySignUp();
                }));
              },
              child: Text('Sign Up'),
            )
          ],
        )
      ],
    );
  }
}
