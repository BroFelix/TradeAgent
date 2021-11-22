import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_agent/theme/color.dart';
import 'package:trade_agent/ui/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      builder: () => MaterialApp(
        title: 'Trade Agent',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            color: AppColors.primaryColor,
          ),
          primarySwatch: Colors.blue,
          primaryColor: AppColors.primaryColor,
          brightness: Brightness.light,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
