import 'package:ecommerce_application/app/presentation/widgets/otp_verification_form.dart';
import 'package:flutter/material.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
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
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "An authentication code has been sent to (+61) 0486935279",
                  style: TextStyle(
                      color: Color.fromARGB(255, 137, 137, 137),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              OTPVerificationForm()
            ],
          ),
        ),
      ),
    );
  }
}
