import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final bool isComfirmingController;
  final String labelText;
  const PasswordField(
      {super.key,
      required this.passwordController,
      required this.labelText,
      required this.isComfirmingController});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  String? errorText;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: TextFormField(
        controller: widget.passwordController,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 35, 94, 37),
          labelText: widget.labelText,
          errorText: errorText,
          floatingLabelStyle: const TextStyle(color: Colors.green),
          prefixIcon: Icon(Icons.lock,
              color: const Color.fromARGB(255, 35, 94, 37).withOpacity(0.5)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
              icon: obscureText
                  ? const Icon(
                      Icons.visibility,
                      color: Color.fromARGB(255, 35, 94, 37),
                    )
                  : const Icon(
                      Icons.visibility_off,
                      color: Color.fromARGB(255, 35, 94, 37),
                    ),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              }),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Plese enter passsword";
          } else if (value.length < 6) {
            return 'Password must have at leats 6 characters';
          } else if (widget.isComfirmingController == true &&
              value != widget.passwordController.text) {
            return "Passwords mismatch";
          }
          return null;
        },
      ),
    );
  }
}
