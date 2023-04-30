import 'package:ecommerce_application/presentation/widgets/registration_form.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 25,
                    ),
                    Text(
                      " Lagos, Nigeria.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Create an account to continue!",
                  style: TextStyle(
                      color: Color.fromARGB(255, 137, 137, 137),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: RegistrationForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
