import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:db_project/sign_up.dart';
import 'update_password.dart';
import 'package:db_project/modules/http.dart';

class Inputwrapper extends StatefulWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  State<Inputwrapper> createState() => _InputwrapperState();
}

class _InputwrapperState extends State<Inputwrapper> {
  bool _isHidden = true;
  final email = TextEditingController();
  final pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  labelText: 'E-Mail',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'abcdxye@gmail.com'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: pwd,
              obscureText: _isHidden,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () => setState(() {
                      _isHidden = !_isHidden;
                    }),
                    child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off),
                  ),
                  hintText: 'Password'),
            ),
          ],
        ),
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
            onPressed: null,
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
        ),
      ],
    );
  }
}
