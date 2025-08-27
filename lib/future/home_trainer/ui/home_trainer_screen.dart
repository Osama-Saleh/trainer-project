import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trainer_project/future/home_student/data/data_source/sing_out_data_source.dart';
import 'package:trainer_project/future/home_trainer/data/data_source/home_trainer_data_source.dart';
import 'package:trainer_project/future/home_trainer/ui/view_courses.dart';
import 'package:trainer_project/future/home_trainer/widgets/custom_drawer.dart';
import 'package:trainer_project/widgets/custom_text_form_filed.dart';

class HomeTrainerScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  HomeTrainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home_trainer'.tr()),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            onPressed: () async {
              CustomSingOutDataSource.signOut(context: context);
            },
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            CustomTextFormField(
              controller: nameController,
              hintText: 'Name',
              labelText: 'Name',
              borderColor: Colors.green,
              labelTextColor: Colors.black,
              hintTextColor: Colors.black,
              inputTextColor: Colors.black,
              validator: (p0) {},
            ),
            CustomTextFormField(
              controller: titleController,
              hintText: 'Title',
              labelText: 'Title',
              borderColor: Colors.green,
              labelTextColor: Colors.black,
              hintTextColor: Colors.black,
              inputTextColor: Colors.black,
              validator: (p0) {},
            ),
            CustomTextFormField(
              controller: phoneController,
              hintText: '0123456789',
              labelText: 'Phone ',
              borderColor: Colors.green,
              labelTextColor: Colors.black,
              hintTextColor: Colors.black,
              inputTextColor: Colors.black,
              validator: (p0) {},
            ),
            CustomTextFormField(
              controller: priceController,
              hintText: 'Price',
              labelText: 'Price',
              borderColor: Colors.green,
              labelTextColor: Colors.black,
              hintTextColor: Colors.black,
              inputTextColor: Colors.black,
              validator: (p0) {},
            ),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                
                onPressed: () {
                HomeTrainerDataSource.uploadData(
                  name: nameController.text,
                  title: titleController.text,
                  phone: int.parse(phoneController.text), 
                  price: double.parse(priceController.text),
                  context: context
                );
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                textStyle: TextStyle(
                  fontSize: 20,
                 fontWeight: FontWeight.bold),
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                 ),
              ),
              child: Text('Add Course')),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                
                onPressed: () {
                  HomeTrainerDataSource.getData();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCourses(
                  isStudent: false,
                ),));
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                textStyle: TextStyle(
                  fontSize: 20,
                 fontWeight: FontWeight.bold),
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                 ),
              ),
              child: Text('View Courses')),
            )
          ],
        ),
      )),
    
      drawer: Drawer(
        child: SafeArea(
          child: CustomDrawer(),
        ),
      ),
    );
  }
}
