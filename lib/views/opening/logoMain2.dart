import 'package:amti7ane_unicoding/views/auth/mainScreen/login_Screen.dart';
import 'package:amti7ane_unicoding/views/opening/introduction_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

import '../../Services/sign_in_remote.dart';
import '../../controllers/init_dependency.dart';
import '../../controllers/jsonControllers/userController.dart';
import '../main/main_screen.dart';

class LogoMain2 extends StatefulWidget {
  const LogoMain2({Key? key, required this.showw}) : super(key: key);
  final bool showw;
  @override
  State<LogoMain2> createState() => _LogoMain2State();
}

final userC = Get.find<SignInController>();

class _LogoMain2State extends State<LogoMain2> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () async {
      Box auth = Hive.box<dynamic>('auth');
      var e = auth.get('email');
      var p = auth.get('password');
      Map json = {"email": e, "password": p};
      try {
        await userC.sign_in_user(json);
      } catch (e) {
        print('error');
      }
      print(SignInRemote.sc);
      if (SignInRemote.sc == 200) {
        Get.offAll(const MainScreen(), binding: InitDep());
      }
      // else if (SignInRemote.sc==404){
      //
      // }
      else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    widget.showw ? IntroScreen() : LoginScreen()));
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xff870DFF),
            statusBarIconBrightness: Brightness.light),
        backgroundColor: const Color(0xff870DFF),
        elevation: 0,
      ),
      backgroundColor: const Color(0xff870DFF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 130,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo2.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: 200,
                height: 130,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.only(left: 35),
                child: Column(
                  children: const [
                    Text(
                      'امتحاني',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontFamily: 'SFMarwa'),
                    ),
                    SpinKitThreeBounce(
                      color: Colors.white,
                      size: 25,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
