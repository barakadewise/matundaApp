import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:matunda/graphqlservices/client.dart';
import 'package:matunda/screens/dashboard_screen.dart';

class CompleteProfile extends StatefulWidget {
  final TextEditingController nameText = TextEditingController();

  final String createdUserEmail;

  CompleteProfile({
    super.key,
    required this.createdUserEmail,
  });

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final Client graPhqlClient = Client();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? regionText;
  String? errorTextmsg;
  bool isloading = false;

  final List<String> selectedRegion = [
    "Arusha",
    "Kilimanjaro",
    "Dar es salaam",
    "Mwanza",
    "Morogoro",
    "Dododma",
    "Tanga"
  ];

  String runQuery =
      '''mutation UpdateUser(\$name: String!, \$email: String!, \$address: String!) {
  updateUser(updateUser: { name: \$name, email: \$email, address: \$address }) {
    name
    email
    address
  }
}
''';

  ///complete user profile function
  Future<void> _completeUserProfile(context) async {
    final ValueNotifier<GraphQLClient> client =
        await graPhqlClient.graphQlclient();
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 35, 94, 37),
              ),
            );
          });
      try {
        final QueryResult result = await client.value
            .mutate(MutationOptions(document: gql(runQuery), variables: {
          "name": widget.nameText.text.trim(),
          "email": widget.createdUserEmail.trim(),
          "address": regionText!.trim(),
        }));
        if (result.hasException) {
          setState(() {
            isloading = false;
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
          Navigator.pop(context);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const Dashboard()));
        }
      } catch (e) {
        setState(() {
          isloading = false;
          errorTextmsg = "An error occured :$e";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Complete your profile',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: widget.nameText,
                    decoration: InputDecoration(
                      labelText: "Enter you name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.green)),
                      floatingLabelStyle: const TextStyle(color: Colors.green),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: DropdownButtonFormField<String>(
                      value: regionText,
                      decoration: const InputDecoration(
                          hintText: "select address location"),
                      dropdownColor: Colors.green[50],
                      items: selectedRegion
                          .map((value) => DropdownMenuItem<String>(
                              value: value, child: Text(value)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          regionText = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select location address";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () async {
                          await _completeUserProfile(context);
                        },
                        child: const Text('Submit')),
                  ),
                  if (errorTextmsg != null) Text(errorTextmsg!),
                ],
              )),
        )
      ],
    )));
  }

  @override
  void dispose() {
    widget.nameText.dispose();
    regionText ?? dispose();
    super.dispose();
  }
}








  //  final GraphQLClient client = widget.client.value;

  // //complet user profille function
  // Future<QueryResult> _completeUserProfile() async {

  //   final QueryResult result = await client.mutate(
  //     MutationOptions(

  //       variables: {
  //         'name': widget.nameText.text,
  //         'email': widget.createdUserEmail,
  //         'address': regionText
  //       },
  //       fetchPolicy: FetchPolicy.noCache,
  //       errorPolicy: ErrorPolicy.all,
  //     ),
  //   );
  //   return result;
  // }