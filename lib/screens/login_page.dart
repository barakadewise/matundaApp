import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:matunda/components/password_input.dart';
import 'package:matunda/components/submit_button.dart';
import 'package:matunda/components/username_input.dart';
import 'package:matunda/graphqlservices/client.dart';
import 'package:matunda/screens/create_account.dart';
import 'package:matunda/screens/dashboard_screen.dart';

class LoginPanel extends StatefulWidget {
  LoginPanel({super.key});
  final TextEditingController emailTex = TextEditingController();
  final TextEditingController passwordText = TextEditingController();

  @override
  State<LoginPanel> createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  final Client graphqlClient = Client();
  final formKey = GlobalKey<FormState>();
  bool isLoding = false;

  // FocusNode loginFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

//login user query String
  String query = r'''
query loginUser($email: String!, $password: String!) {
  login(loginInput: { email:$email, password: $password }) {
    user {
      id
      email
    }
    access_token
  }
}
''';

//User LoginFunctionality
  Future<void> _loginUserFunction(context) async {
    final ValueNotifier<GraphQLClient> client =
        await graphqlClient.graphQlclient();
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoding = true;
        });
        final QueryResult result = await client.value
            .query(QueryOptions(document: gql(query), variables: {
          "email": widget.emailTex.text.trim(),
          "password": widget.passwordText.text.trim()
        }));
        if (result.hasException) {
          setState(() {
            isLoding = !isLoding;
          });

          AwesomeDialog(
                  context: context,
                  headerAnimationLoop: false,
                  title: 'Error',
                  animType: AnimType.topSlide,
                  dialogType: DialogType.error,
                  showCloseIcon: true,
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {},
                  desc: result.exception?.graphqlErrors[0].message)
              .show();
        } else {
          setState(() {
            isLoding = false;
          });

          final userToken = result.data?['login']['access_token'];
          final jwtToemail =JWT.decode(userToken).payload['email'];
          print('$jwtToemail');
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => Dashboard(userToken: userToken,)));
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.grey.shade50,
              behavior: SnackBarBehavior.floating,
              content: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20)
              ),
              // ignore: prefer_const_constructors
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Row(children: [
                  Icon(Icons.info,color: Colors.white,),
                  Text('Successfully loggin!')
                ],),
              ),
            ))
          );
        }
      } catch (e) {
        setState(() {
          isLoding = !isLoding;
        });
        throw e;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Focus(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset('assets/images/login.png',
                  height: 220, width: size.width),
              const Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w800)),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>  LoginPanel()));
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
                    onTap: () async {
                      await _loginUserFunction(context);
                    },
                    child: isLoding
                        ? const Center(
                            child:
                                CircularProgressIndicator(color: Colors.green),
                          )
                        : const Button(buttonText: 'Login')),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    CreateAccount())); //goto create account
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
      ),
    ));
  }

  @override
  void dispose() {
    widget.emailTex.dispose();
    widget.passwordText.dispose();
    super.dispose();
  }
}
