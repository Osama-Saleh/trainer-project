import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_project/future/home_student/data/data_source/sing_out_data_source.dart';

class HomeStudentScreen extends StatelessWidget {
  const HomeStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Student'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout,
            color: Colors.red,
            ),
            onPressed: () async{
              CustomSingOutDataSource.signOut(context: context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Home Student Screen'),
      ),
    );
  }
}