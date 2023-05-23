import 'package:ecommerce_application/app/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class PaymentChoiceScreen extends StatefulWidget {
  const PaymentChoiceScreen({super.key});

  @override
  State<PaymentChoiceScreen> createState() => _PaymentChoiceScreenState();
}

class _PaymentChoiceScreenState extends State<PaymentChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar(context, key, "Payment"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (index) {
                return const AddCardForm();
              });
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AddCardForm extends StatefulWidget {
  const AddCardForm({super.key});

  @override
  State<AddCardForm> createState() => _AddCardFormState();
}

class _AddCardFormState extends State<AddCardForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 238, 238, 238),
      ),
      width: double.infinity,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Add new card",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: InputBorder.none,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: "Name on card",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      keyboardType: TextInputType.name,

                      // key: formfieldkey_1,
                      // onChanged: (val) {
                      //   formfieldkey_1.currentState!.validate();
                      // // },
                      // // validator: (val) {
                      // //   if (!val!.isValidEmail) {
                      // //     return 'Enter valid email';
                      // //   }

                      //   return null;
                      // },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: InputBorder.none,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: "Card number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      keyboardType: TextInputType.name,

                      // key: formfieldkey_1,
                      // onChanged: (val) {
                      //   formfieldkey_1.currentState!.validate();
                      // // },
                      // // validator: (val) {
                      // //   if (!val!.isValidEmail) {
                      // //     return 'Enter valid email';
                      // //   }

                      //   return null;
                      // },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: InputBorder.none,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: "Expiry Date",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      keyboardType: TextInputType.name,

                      // key: formfieldkey_1,
                      // onChanged: (val) {
                      //   formfieldkey_1.currentState!.validate();
                      // // },
                      // // validator: (val) {
                      // //   if (!val!.isValidEmail) {
                      // //     return 'Enter valid email';
                      // //   }

                      //   return null;
                      // },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: InputBorder.none,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: "CVV",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      keyboardType: TextInputType.name,

                      // key: formfieldkey_1,
                      // onChanged: (val) {
                      //   formfieldkey_1.currentState!.validate();
                      // // },
                      // // validator: (val) {
                      // //   if (!val!.isValidEmail) {
                      // //     return 'Enter valid email';
                      // //   }

                      //   return null;
                      // },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 0, 0, 0),
                    minWidth: 350,
                    height: 60,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Add Card",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 300,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
