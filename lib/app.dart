import 'package:cas_business_solutions/routes/app_pages.dart';
import 'package:cas_business_solutions/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CAS Business Solutions',
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      initialRoute: AppPages.initial,
      getPages: AppPages.pages,
    );
  }
}
