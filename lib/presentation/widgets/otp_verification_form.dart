import 'package:ecommerce_application/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPVerificationForm extends StatefulWidget {
  const OTPVerificationForm({super.key});

  @override
  State<OTPVerificationForm> createState() => _OTPVerificationFormState();
}

class _OTPVerificationFormState extends State<OTPVerificationForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 64,
                height: 68,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              SizedBox(
                width: 64,
                height: 68,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              SizedBox(
                width: 64,
                height: 68,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              SizedBox(
                width: 64,
                height: 68,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              SizedBox(
                width: 64,
                height: 68,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, "/otpverification");
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: kaccentGold,
            minWidth: 350,
            height: 60,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.keyboard_double_arrow_right_outlined,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
