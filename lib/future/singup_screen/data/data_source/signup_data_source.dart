import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_project/future/home_student/home_student_screen.dart';
import 'package:trainer_project/future/home_trainer/home_trainer_screen.dart';

class SignupDataSource {
  static final supabase = Supabase.instance.client;

  static Future signUp(
    {
    required  String email,
    required  String password,
    required BuildContext context,
    required bool isTrainer,
    }
  ) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      if(res.user != null){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign Up Successfully'),
          backgroundColor: Colors.green,
          ),
        );
        Navigator.pushAndRemoveUntil(context, 
        MaterialPageRoute(builder: (context) =>isTrainer? HomeTrainerScreen() : HomeStudentScreen(),)
        , (route) => false,);
      }else{
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error in Sign Up'),
          backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      if(e is AuthApiException){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message),
          backgroundColor: Colors.red,
          ),
        );
      }
      print(e.toString());
    }
  }
}
