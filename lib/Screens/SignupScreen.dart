import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../CustomWidgets/CustomButton.dart';
import '../CustomWidgets/CustomSnackBar.dart';
import '../CustomWidgets/CustomTextField.dart';
import '../Functions/DBandAuth/database.dart';
import '../Functions/DBandAuth/firebaseAuth.dart';
import '../Functions/DBandAuth/sharedPrefs.dart';
import '../Providers/SignProvider.dart';
import 'HomeScreen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  static const String id = 'SignupScreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => SignProvider(), child: Signup());
  }
}

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  TextEditingController _userName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingOverlay(
        isLoading: Provider.of<SignProvider>(context).isLoading,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Welcome!',
                    style: TextStyle(
                        color: const Color(0xff053d5d),
                        fontSize: 50,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(30),
                      child: Image.asset('assets/doctors.png')),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _userName,
                          validator: MultiValidator(
                              [RequiredValidator(errorText: "Required")]),
                          icon: Icons.person,
                          labelText: 'Name',
                        ),
                        CustomTextField(
                          controller: _email,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            EmailValidator(
                                errorText:
                                    "Please enter a valid email address"),
                          ]),
                          icon: Icons.email,
                          labelText: 'Email',
                        ),
                        CustomTextField(
                          controller: _password,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            MinLengthValidator(6,
                                errorText:
                                    "Password must contain at least 6 characters"),
                            MaxLengthValidator(15,
                                errorText:
                                    "Password cannot be more 15 characters"),
                            PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                errorText:
                                    "Password must have at least one special character"),
                          ]),
                          icon: Icons.lock,
                          labelText: 'Password',
                          obscure: true,
                          prefix: Icons.remove_red_eye_outlined,
                        ),
                      ],
                    ),
                  ),
                  Consumer<SignProvider>(builder: (_, value, child) {
                    return CustomButton(
                        text: 'Sign Up',
                        function: () async {
                          await checkUsersName(_userName.text);
                          await checkEmail(_email.text);

                          ///check user or email is exist or not
                          if (resultOfUserName != 0 && resultOfEmail != 0) {
                            buildSnackBar(context,
                                'Email and username are not available');
                          } else if (resultOfUserName != 0) {
                            buildSnackBar(context, 'Username is not available');
                          } else if (resultOfEmail != 0) {
                            buildSnackBar(context, 'Email is not available');
                          } else if (_formKey.currentState!.validate()) {
                            Provider.of<SignProvider>(context, listen: false)
                                .loading();
                            await signUp(_email.text, _password.text);

                            Map<String, dynamic> userInfo = {
                              'email': _email.text,
                              'username': _userName.text,
                            };

                            ///store data in FireStore
                            upLoadProfile(userInfo, _userName.text);
                            setLoggedInUser(_userName.text);

                            Navigator.pushReplacementNamed(
                                context, HomeScreen.id);
                            Provider.of<SignProvider>(context, listen: false)
                                .signed();
                          }
                        });
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
