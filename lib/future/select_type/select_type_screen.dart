import 'package:flutter/material.dart';
import 'package:trainer_project/core/app_constant/app_constant.dart';
import 'package:trainer_project/core/images_path/images_path.dart';
import 'package:trainer_project/core/shared_services/service_shared_pref.dart';
import 'package:trainer_project/future/login_screen/ui/login_screem.dart';
import 'package:trainer_project/future/select_type/widgets/custom_selected_type.dart';

class SelectTypeScreen extends StatefulWidget {
  const SelectTypeScreen({super.key});

  @override
  State<SelectTypeScreen> createState() => _SelectTypeScreenState();
}

class _SelectTypeScreenState extends State<SelectTypeScreen> {
  bool? isTrainer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            CustomSelectType(
              onTap: () {
                setState(() {
                  isTrainer = true;
                });
              },
              image: ImagesPath.trainer,
              type: 'Trainer',
              borderColor: isTrainer == true ? Colors.green : Colors.white,
            ),
            CustomSelectType(
              onTap: () {
                setState(() {
                  isTrainer = false;
                });
              },
              image: ImagesPath.student,
              type: 'Student',
              borderColor: isTrainer == false ? Colors.green : Colors.white,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                ServiceSharedPref.setBoolData(key: AppConstant.isTrainerKey, value: isTrainer??false);
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(
                isTrainer: isTrainer??false,
              ),));
            }, child: Text("Contenue",style: TextStyle(
              fontSize: 25,
              color: Colors.white
            ),) )
          ],
        ),
      ),
    );
  }
}

