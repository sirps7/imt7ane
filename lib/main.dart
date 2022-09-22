import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/controllers/init_dependency.dart';
import 'package:amti7ane_unicoding/views/main/main_screen.dart';
import 'package:amti7ane_unicoding/views/opening/logoMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: InitDep(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
              ),
              backgroundColor: MyColor.mainColor,
              titleTextStyle: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            navigationBarTheme: NavigationBarThemeData(
                labelTextStyle: MaterialStateProperty.all(const TextStyle(
              fontFamily: 'Poppins',
            )))),
        home: show
            ? LogoMain(
                showw: show,
              )
            : const MainScreen());
  }
}
