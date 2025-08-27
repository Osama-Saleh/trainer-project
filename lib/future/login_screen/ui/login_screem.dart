import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trainer_project/core/images_path/images_path.dart';
import 'package:trainer_project/core/validator/validator.dart';
import 'package:trainer_project/future/login_screen/data/data_source/login_data_source.dart';
import 'package:trainer_project/future/singup_screen/ui/signup_screen.dart';

import '../../../widgets/custom_text_form_filed.dart';

class LoginScreen extends StatefulWidget {
  bool isTrainer;
  LoginScreen({super.key, required this.isTrainer});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;
  var formKey = GlobalKey<FormState>();
  TextEditingController emailSignInController = TextEditingController();
  TextEditingController passwordSignInController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                ImagesPath.background,
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Container(
                height: 380,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          CustomTextFormField(
                            hintText: 'Email',
                            labelText: 'Email',
                            prefixIcon: Icons.email,
                            controller: emailSignInController,
                            // validator: (value) {
                            // return  CustomValidator.emailValidate(value);
                            // },
                            validator: CustomValidator.emailValidate,
                          ),
                          CustomTextFormField(
                            controller: passwordSignInController,
                            validator: CustomValidator.passwordValidate,
                            hintText: 'Password',
                            labelText: 'Password',
                            prefixIcon: Icons.lock,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: Icon(
                                  isVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                )),
                            obscureText: isVisible,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  if(formKey.currentState!.validate()){
                                    LoginDataSource.signIn(email: emailSignInController.text,
                                     password: passwordSignInController.text,
                                      context: context, 
                                      isTrainer: widget.isTrainer);
                                  
                                  }
                                },
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 22),
                                )),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don\'t have an account ? ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                TextSpan(
                                  text: 'Sign up',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SignupScreen(
                                              isTrainer: widget.isTrainer,
                                            ),
                                          ));
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
