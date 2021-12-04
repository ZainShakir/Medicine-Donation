import 'package:flutter/material.dart';

class MyForgetPassword extends StatefulWidget {
  const MyForgetPassword({Key? key}) : super(key: key);

  @override
  _MyForgetPasswordState createState() => _MyForgetPasswordState();
}

class _MyForgetPasswordState extends State<MyForgetPassword> {
  bool _validator = false;
  final _text = TextEditingController();
  bool _isHidden = true;
  bool _isHidden1 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned(
            top: -100,
            child: Image.asset(
              'assets/login.png',
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 100, left: 50),
            child: Text(
              'Verification',
              style: TextStyle(
                  fontFamily: 'Lobster',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 45),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.4,
              right: 35,
              left: 35,
            ),
            child: ListView(
              children: [
                TextField(
                  controller: _text,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'Email',
                    hintText: 'Optional Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.email),
                    errorText: _text.text.toString() == 'abbasbasit'
                        ? null
                        : _text.text.toString().isEmpty
                            ? null
                            : 'Wrong Email',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    child: const Text(
                      'Verify',
                      style: TextStyle(fontSize: 22),
                    ),
                    onPressed: () => {
                      setState(() {
                        _text.text.toString() == 'abbasbasit'
                            ? _validator = true
                            : _validator = false;
                      }),
                      FocusScope.of(context).unfocus()
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (_validator)
                  TextField(
                    obscureText: _isHidden,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText: 'Password',
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: InkWell(
                        onTap: () => setState(() {
                          _isHidden = !_isHidden;
                        }),
                        child: Icon(_isHidden
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 25,
                ),
                if (_validator)
                  TextField(
                    obscureText: _isHidden1,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: InkWell(
                        onTap: () => setState(() {
                          _isHidden1 = !_isHidden1;
                        }),
                        child: Icon(_isHidden1
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 25,
                ),
                if (_validator)
                  Align(
                    alignment: Alignment.topCenter,
                    child: ElevatedButton(
                      child: const Text(
                        'Update Password',
                        style: TextStyle(fontSize: 22),
                      ),
                      onPressed: () => {
                        setState(() {
                          _text.text.toString() == 'abbasbasit'
                              ? _validator = true
                              : _validator = false;
                        }),
                        FocusScope.of(context).unfocus()
                      },
                    ),
                  ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
