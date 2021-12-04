import 'package:db_project/modules/http.dart';
import 'package:flutter/material.dart';

class MySignUp extends StatefulWidget {
  const MySignUp({Key? key}) : super(key: key);

  @override
  _MySignUpState createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final confirmpwdController = TextEditingController();
  final addressController = TextEditingController();
  final phnoController = TextEditingController();
  final ageController = TextEditingController();
  final cnicController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final dateController = TextEditingController();
  bool _isHidden = true;
  bool _isHidden1 = true;
  @override
  /* void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }*/

  String response = "";

  CreateUser() async {
    var result = await http_post("create-user", {
      "fname": fnameController.text,
      "lname": lnameController.text,
      "email": emailController.text,
      "pwd": pwdController.text,
      "address": addressController.text,
      "ph_no": phnoController.text,
      "Age": ageController.text,
      "uDOB": dateController.text,
      "CNIC": cnicController.text,
      "ZIP": zipController.text,
      "City": cityController.text,
      "Country": countryController.text,
    });
    if (result.ok) {
      setState(() {
        response = result.data['status'];
      });
    }
  }

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
            padding: EdgeInsets.only(top: 70, left: 50),
            child: Text(
              'Medicare \nSign Up',
              style: TextStyle(
                  fontFamily: 'Lobster',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
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
                  controller: fnameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'First Name',
                    hintText: 'First Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: lnameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'Last Name',
                    hintText: 'Last Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'Email',
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: pwdController,
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
                      child: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: confirmpwdController,
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
                      child: Icon(
                          _isHidden1 ? Icons.visibility : Icons.visibility_off),
                    ),
                    errorText: confirmpwdController.text.toString() ==
                            pwdController.text.toString()
                        ? null
                        : 'Password Didnt Match',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'Address',
                    hintText: 'Address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.home),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: phnoController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'Phone#',
                    hintText: 'Phone#',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.phone),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'Age',
                    hintText: 'Age',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'DOB',
                    hintText: 'Date Of Birth',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2022),
                    );
                    dateController.text = date.toString().substring(0, 10);
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: cnicController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'CNIC',
                    hintText: 'CNIC',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.badge),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: countryController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'Country',
                    hintText: 'Country',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.flag),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'City',
                    hintText: 'City',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.flag),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: zipController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelText: 'Zip Code',
                    hintText: 'Zip Code',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(Icons.add_location),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 22),
                    ),
                    onPressed: () {
                      if (pwdController.text.toString() ==
                          confirmpwdController.text.toString()) {
                        CreateUser();
                      }
                    },
                  ),
                ),
                Text(response),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
