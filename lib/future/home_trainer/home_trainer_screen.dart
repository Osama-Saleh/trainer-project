import 'package:flutter/material.dart';
import 'package:trainer_project/future/home_student/data/data_source/sing_out_data_source.dart';

class HomeTrainerScreen extends StatelessWidget {
  const HomeTrainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Trainer'),
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
        child: Text('Home Trainer Screen'),
      ),
    );
  }
}