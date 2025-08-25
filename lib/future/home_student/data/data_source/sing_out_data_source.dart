import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_project/core/shared_services/service_shared_pref.dart';
import 'package:trainer_project/future/select_type/select_type_screen.dart';

class CustomSingOutDataSource {
static  Future<void> signOut(
      {required BuildContext context}
  ) async {
    await Supabase.instance.client.auth.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SelectTypeScreen() ,), (route) => false,);
    ServiceSharedPref.clearData();
  }
}