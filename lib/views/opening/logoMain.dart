import 'package:amti7ane_unicoding/views/auth/mainScreen/loginScreen.dart';
import 'package:amti7ane_unicoding/views/opening/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LogoMain extends StatefulWidget {
  const LogoMain({Key? key, required this.showw}) : super(key: key);
  final bool showw;
  @override
  State<LogoMain> createState() => _LogoMainState();
}

class _LogoMainState extends State<LogoMain> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  widget.showw ? IntroScreen() : const LoginScreen()));
    });
  }

  @override
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
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.only(left: 35),
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
