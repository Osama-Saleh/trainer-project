import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_project/core/app_constant/app_constant.dart';
import 'package:trainer_project/core/shared_services/service_shared_pref.dart';
import 'package:trainer_project/future/home_trainer/ui/home_trainer_screen.dart';
import 'package:trainer_project/future/home_trainer/ui/view_courses.dart';
import 'package:trainer_project/future/select_type/select_type_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://xohbbthqdwddebenaqow.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhvaGJidGhxZHdkZGViZW5hcW93Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYxMzcyODgsImV4cCI6MjA3MTcxMzI4OH0.e65KyD7bhsWpaMSSgIKW90dvJxW1VtLOU_0aQjTay44',
  );
  await EasyLocalization.ensureInitialized();

  bool? isTrainer =
      await ServiceSharedPref.getBoolData(key: AppConstant.isTrainerKey);
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
            'assets/lang', 
        fallbackLocale: Locale('en'),
        child: MyApp(
          isTrainer: isTrainer,
        )),
  );
}

class MyApp extends StatelessWidget {
  final bool? isTrainer;
  const MyApp({super.key, required this.isTrainer});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Supabase.instance.client.auth.currentUser == null
          ? SelectTypeScreen()
          : isTrainer == true
              ? HomeTrainerScreen()
              : ViewCourses(),
    );
  }
}
