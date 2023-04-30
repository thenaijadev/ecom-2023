import "package:flutter/material.dart";
import 'package:country_picker/country_picker.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final formKey = GlobalKey<FormState>();
  String? code = "234";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
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
              const SizedBox(
                height: 100,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: Text(
                  "Password Recovery",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Enter your phone number to recover your password.",
                  style: TextStyle(
                      color: Color.fromARGB(255, 137, 137, 137),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Text(
                              "+$code",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          Flexible(
                            child: IconButton(
                              onPressed: () {
                                showCustomDatePicker();
                              },
                              icon: const Icon(Icons.arrow_drop_down),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        style: const TextStyle(),
                        keyboardType: TextInputType.phone,
                        key: formKey,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
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
                  color: const Color.fromARGB(255, 198, 171, 89),
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
          ),
        ),
      ),
    );
  }

  void showCustomDatePicker() {
    showCountryPicker(
        showPhoneCode: true,
        context: context,
        countryListTheme: CountryListThemeData(
          flagSize: 25,
          backgroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
          bottomSheetHeight: 500, // Optional. Country list modal height
          //Optional. Sets the border radius for the bottomsheet.
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          //Optional. Styles the search field.
          inputDecoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Start typing to search',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xFF8C98A8).withOpacity(0.2),
              ),
            ),
          ),
        ),
        onSelect: (Country country) {
          code = country.phoneCode;
          setState(() {});
        });
  }
}
