import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isEnglish = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Language : ${context.locale.languageCode=='en'? "english" : "arabic"}'),
            Spacer(),
            Switch(
              value:context.locale.languageCode=='en'?true:false,
              onChanged: (value) {
                setState(() {
                context.setLocale(value == true ? Locale('en'):Locale('ar'));
                });
              },
            )
          ],
        ),
      ],
    );
  }
}
