import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_project/future/home_trainer/ui/home_trainer_screen.dart';
import 'package:trainer_project/future/home_trainer/ui/view_courses.dart';

class LoginDataSource {
  static final supabase = Supabase.instance.client;

  static Future signIn({
    required String email,
    required String password,
    required BuildContext context,
    required bool isTrainer,
  }) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (res.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign In Successfully'),
            backgroundColor: Colors.green,
          ),
        );
        isTrainer == true
            ? Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeTrainerScreen(),
                ),
                (route) => false,
              )
            : 
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ViewCourses(),),
                (route) => false,
                )
            ;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign in filed'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      if (e is AuthApiException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
            backgroundColor: Colors.red,
          ),
        );
      }
      print(e.toString());
    }
  }
}
