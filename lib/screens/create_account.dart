import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:matunda/components/custom_snackbar.dart';
import 'package:matunda/components/password_input.dart';
import 'package:matunda/components/submit_button.dart';
import 'package:matunda/components/username_input.dart';
import 'package:matunda/graphqlservices/client.dart';
import 'package:matunda/screens/complete_profile.dart';
import 'package:matunda/screens/login_page.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({super.key});
  final TextEditingController emailText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();
  final TextEditingController confirmPasswordtext = TextEditingController();

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final Client graPhqlClient = Client();
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  //user registration function
  Future<void> _userRegistrationFunction(context) async {
    final ValueNotifier<GraphQLClient> client =
        await graPhqlClient.graphQlclient();
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          });
      try {
        final QueryResult result = await client.value.mutate(
          MutationOptions(
            document: gql('''
            mutation CreateUser(\$email: String!, \$password: String!) {
              createUser(createUserInput: {
                email: \$email,
                password: \$password
              }) {
                id
                email
              }
            }
          '''),
            variables: {
              'email': widget.emailText.text.trim(),
              'password': widget.passwordText.text.trim(),
            },
          ),
        );
        if (result.hasException) {
          setState(() {
            isLoading = false;
          });

          Navigator.pop(context);
          AwesomeDialog(
                  context: context,
                  headerAnimationLoop: false,
                  title: 'Error',
                  animType: AnimType.topSlide,
                  dialogType: DialogType.error,
                  showCloseIcon: true,
                  btnCancelOnPress: (){},
                  btnOkOnPress: (){},
                  desc: result.exception?.graphqlErrors[0].message)
              .show();
              
        } else {
          final String createdEmail = result.data?['createUser']['email'] ?? '';
          CustomSnackbar(
                  context: context,
                  erroMessage: 'Successfuly!  registered $createdEmail',
                  backgroundColor: Colors.green)
              .show();
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => CompleteProfile(
                        createdUserEmail: createdEmail,
                      )));
        }
      } catch (e) {
        CustomSnackbar(
            context: context,
            erroMessage: e.toString(),
            backgroundColor: Colors.red);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
           
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SvgPicture.asset('assets/svg/register.svg',
                    height: 210, width: size.width),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Create Account',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: EmailField(
                      emailController: widget.emailText,
                      labelText: 'Enter email'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: PasswordField(
                      isComfirmingController: false,
                      passwordController: widget.passwordText,
                      labelText: 'Create strong password'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: PasswordField(
                      isComfirmingController: true,
                      passwordController: widget.confirmPasswordtext,
                      labelText: 'Confirm your password'),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 15, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Already have account? ',
                        style:
                            TextStyle(color: Color.fromARGB(255, 35, 94, 37)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>LoginPanel()));
                        },
                        child: const Text('Login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 35, 94, 37),
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),

                // Create user account button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                      onTap: () async {
                        await _userRegistrationFunction(context);
                      },
                      highlightColor: Colors.grey[50],
                      child: const Button(buttonText: 'Create account')),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/google.png',
                        width: 30,
                        height: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/fb.png',
                        width: 30,
                        height: 50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.emailText.dispose();
    widget.passwordText.dispose();
    widget.confirmPasswordtext.dispose();
    super.dispose();
  }
}















  // Future<void> fetchUsers(BuildContext context) async {
  //   final GraphQLClient client = widget.client.value;

  //   final QueryResult results = await client.query(
  //     QueryOptions(
  //       document: gql(r'''
  //     query GetUsers {
  //           users {
  //                 id,
  //                 name,
  //                 email

  //              }

  //          }
  //      '''),
  //     ),
  //   );
  //   if (results.hasException) {
  //     print(results.exception.toString());
  //     CustomSnackbar(
  //             context: context,
  //             erroMessage:
  //                 'Faild to fetch users:${results.exception.toString()}',
  //             backgroundColor: Colors.red)
  //         .show();
  //   } else if (results.isLoading) {
  //     CustomSnackbar(
  //             context: context,
  //             erroMessage: 'data isloading',
  //             backgroundColor: Colors.green)
  //         .show();
  //   } else {
  //     final List<dynamic> users = results.data?['users'] ?? [];
  //     for (var user in users) {
  //       final userEmail = user['email'];
  //       print('Registerd user are:$userEmail');
  //     }
  //   }
  // }
