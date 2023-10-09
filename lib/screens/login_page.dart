import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matunda/components/password_input.dart';
import 'package:matunda/components/submit_button.dart';
import 'package:matunda/components/username_input.dart';
import 'package:matunda/screens/dashboard_screen.dart';

class LoginPanel extends StatefulWidget {
  LoginPanel({super.key});
  final TextEditingController emailTex = TextEditingController();
  final TextEditingController passwordText = TextEditingController();

  @override
  State<LoginPanel> createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  final formKey = GlobalKey<FormState>();

//User LoginFunctionality
  void _loginUserFunction() {
    if (formKey.currentState!.validate()) {
      print('thats good');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: [
            const SizedBox(
              height: 40,
            ),
            SvgPicture.asset('assets/svg/register.svg',
                height: 210, width: size.width),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: EmailField(
                  emailController: widget.emailTex, labelText: 'Enter email'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PasswordField(
                isComfirmingController: false,
                  passwordController: widget.passwordText,
                  labelText: 'Enter you password'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 4, bottom: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Forget Password? ',
                    style: TextStyle(color: Color.fromARGB(255, 35, 94, 37)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Dashboard()));
                    },
                    child: const Text('Reset',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 35, 94, 37),
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                  onTap: () {
                    _loginUserFunction();
                  },
                  highlightColor: Colors.grey[50],
                  child: const Button(buttonText: 'Login')),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Don\'t have account? ',
                    style: TextStyle(color: Color.fromARGB(255, 35, 94, 37)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Dashboard()));//goto create account
                    },
                    child: const Text('Signup',
                        style: TextStyle(
                            color: Color.fromARGB(255, 35, 94, 37),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
