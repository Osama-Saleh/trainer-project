import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_project/future/home_trainer/data/moduls/home_trianer_moduls.dart';

class HomeTrainerDataSource {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<void> uploadData({
    required String name,
    required String title,
    required int phone,
    required double price,
    required BuildContext context,
  }) async {
    try {
      CourseModel courseModel = CourseModel(
        name: name,
        title: title,
        phone: phone,
        price: price,
      );
      final res =
          await supabase.from('course').insert(courseModel.toMap());
      if (res == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('cource upload succefly'),
          backgroundColor: Colors.green,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('cource upload faild'),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<List<CourseModel>> getData() async {
    try {
      List<CourseModel> courseData = [];
      final data = await supabase.from('course').select();
      for(var item in data){
        courseData.add(CourseModel.fromMap(item));
      }
      return courseData;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
