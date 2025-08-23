import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trainer_project/core/images_path/images_path.dart';
import 'package:trainer_project/future/login_screen/ui/login_screem.dart';

class SelectTypeScreen extends StatefulWidget {
  const SelectTypeScreen({super.key});

  @override
  State<SelectTypeScreen> createState() => _SelectTypeScreenState();
}

class _SelectTypeScreenState extends State<SelectTypeScreen> {
  bool? isTrainer = true;
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
                  isTrainer = !isTrainer!;
                });
              },
              image: ImagesPath.trainer,
              type: 'Trainer',
              borderColor: isTrainer == true ? Colors.green : Colors.white,
            ),
            CustomSelectType(
              onTap: () {
                setState(() {
                  isTrainer = !isTrainer!;
                });
              },
              image: ImagesPath.student,
              type: 'Student',
              borderColor: isTrainer == true ? Colors.white : Colors.green,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(
                isTrainer: isTrainer,
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

class CustomSelectType extends StatelessWidget {
  final String image;
  final String type;
  final Color? borderColor;
  final Function()? onTap;
  const CustomSelectType({
    required this.image,
    required this.type,
    this.borderColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor ?? Colors.white, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 20,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CircleAvatar(
                radius: 50,
                child: SvgPicture.asset(image),
              ),
            ),
            Text(type,
                style: TextStyle(
                  fontSize: 25,
                ))
          ],
        ),
      ),
    );
  }
}
