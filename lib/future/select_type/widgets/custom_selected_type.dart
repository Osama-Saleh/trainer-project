import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
