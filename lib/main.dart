import 'package:flutter/material.dart';
import 'file:///E:/Ashwini_Work/Flutter_Workspace/masscoinex_nikhat_task/masscoinex_nikhat_task/lib/ui/dashboard.dart';
import 'file:///E:/Ashwini_Work/Flutter_Workspace/masscoinex_nikhat_task/masscoinex_nikhat_task/lib/ui/profile_page.dart';
import 'package:masscoinex_nikhat_task/ui/login_screen.dart';
import 'package:masscoinex_nikhat_task/ui/otpscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.orange,
        accentColor: Colors.yellowAccent,
      ),
      title: 'Masscoinex Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => UploadingImage(),
        'splash': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/profile': (context) => Profile(),
        '/otp': (context) => OtpScreen(),
      },
    );
  }
}
