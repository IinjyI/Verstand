import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:verstand/Functions/DBandAuth/database.dart';
import 'package:verstand/Screens/NavBottomBar.dart';
import '../CustomWidgets/CustomButton.dart';
import '../CustomWidgets/CustomTextField.dart';
import '../Functions/DBandAuth/firebaseAuth.dart';
import '../Functions/DBandAuth/sharedPrefs.dart';
import '../Providers/SignProvider.dart';
import 'SignupScreen.dart';

class SigninScreen extends StatelessWidget {
  static const String id = 'SigninScreen';

  SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => SignProvider(), child: Signin());
  }
}

class Signin extends StatelessWidget {
  Signin({
    super.key,
  });
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<SignProvider>(context).isLoading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                            color: const Color(0xff07304b),
                            fontSize: 50,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Image.asset('assets/doctors.png'),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
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
                              validator:
                                  RequiredValidator(errorText: "Required"),
                              icon: Icons.lock,
                              labelText: 'Password',
                              prefix: Icons.remove_red_eye_outlined,
                              obscure: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Consumer<SignProvider>(builder: (_, value, child) {
                        return CustomButton(
                            text: 'Sign In',
                            function: () async {
                              if (_formKey.currentState!.validate()) {
                                Provider.of<SignProvider>(context,
                                        listen: false)
                                    .loading();

                                signIn(context, _email.text, _password.text)
                                    .then((value) async {
                                  if (value != null) {
                                    await setLoggedInUser(
                                        await getUsername(_email.text));
                                    await getLoggedInUser();

                                    Navigator.pushReplacementNamed(
                                        context, NavBottomBar.id);
                                  }
                                  Provider.of<SignProvider>(context,
                                          listen: false)
                                      .signed();
                                });
                              }
                            });
                      }),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SignupScreen.id);
                        },
                        child: const Text(
                          "Sign up instead",
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
