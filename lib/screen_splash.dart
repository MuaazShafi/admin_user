import 'dart:async';

import 'package:admin_user/screen_admin.dart';
import 'package:admin_user/screen_home.dart';
import 'package:admin_user/screen_login.dart';
import 'package:admin_user/screen_student.dart';
import 'package:admin_user/screen_teacher.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if (isLogin == true && userType == 'Admin') {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AdminScreen()));
      });
    } else if (isLogin == true && userType == 'Teacher') {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TeacherScreen()));
      });
    } else if (isLogin = true && userType == 'Student') {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StudentScreen()));
      });
    }  else if(isLogin == true && userType == ''){
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Image(
          height: double.infinity,
          fit: BoxFit.fill,
          image: NetworkImage(
              'https://images.pexels.com/photos/3825296/pexels-photo-3825296.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        ),
      ),
    );
  }
}
