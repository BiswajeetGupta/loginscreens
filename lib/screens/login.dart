import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loginscreens/repo/apiCalls.dart';
import 'package:loginscreens/screens/signUp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  Apicalls apicalls = Apicalls();
  TextEditingController phonecontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();

  var countryCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.fork_left),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Lets's sign you in.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "welcome back. You've been mised!",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Phone",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              IntlPhoneField(
                controller: phonecontrol,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  setState(() {
                    countryCode = phone.countryCode;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Passowrd",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: passwordcontrol,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !passwordVisible,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Forget Passowrd?",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  apicalls.apihitforLogIn(
                      phonecontrol.text, passwordcontrol.text, countryCode);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " Sign Up",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
