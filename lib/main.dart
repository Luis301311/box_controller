import 'package:box_controller/pages/PaymentPage.dart';
import 'package:box_controller/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; 

/* import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart'; */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
/*   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); */

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "Mi aplicación",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: PaymentPage(), // Tu página principal
        );
      },
    );
  }
}
