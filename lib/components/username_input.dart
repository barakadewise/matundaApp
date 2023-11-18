import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  final TextEditingController emailController;
  final String labelText;

  const EmailField(
      {super.key, required this.emailController, required this.labelText});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  String? errorText;
  String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: TextFormField(
        controller: widget.emailController,
        decoration: InputDecoration(
            focusColor: const Color.fromARGB(255, 35, 94, 37),
            fillColor: const Color.fromARGB(255, 35, 94, 37),
            labelText: widget.labelText,
            prefixIcon: Icon(
              Icons.email,
              color: const Color.fromARGB(255, 35, 94, 37).withOpacity(0.5),
            ),
            floatingLabelStyle: const TextStyle(color: Colors.green),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 35, 94, 37))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 35, 94, 37))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.green))),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email!';
          } else if (!RegExp(emailRegex)
              .hasMatch(widget.emailController.text)) {
            return 'Please enter valid email';
          }
          return null;
        },
      ),
    );
  }
}
