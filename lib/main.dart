import 'dart:io';
import 'package:amti7ane_unicoding/controllers/jsonControllers/Initalize.dart';
import 'package:amti7ane_unicoding/controllers/quiz_controller.dart';
import 'package:amti7ane_unicoding/locale/locale.dart';
import 'package:amti7ane_unicoding/locale/locale_Controller.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/controllers/init_dependency.dart';
import 'package:amti7ane_unicoding/models/networking/quiz.dart';
import 'package:amti7ane_unicoding/views/opening/logoMain.dart';
import 'package:amti7ane_unicoding/views/opening/logoMain2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:path_provider/path_provider.dart';

//this is a comment
bool show = true;
late SharedPreferences sharepref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(QuizQuastionAdapter());
  Hive.registerAdapter(QuizChoiceAdapter());
  await Hive.openBox<dynamic>('lastQuizScore');
  await Hive.openBox<dynamic>('lastQuestions');
  await Hive.openBox<dynamic>('auth');

  sharepref = await SharedPreferences.getInstance();
  UsersBinding().dependencies();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MyLocaleController c = Get.put(MyLocaleController());
    MyLocaleController c = Get.find();

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
          // initialBinding: c.isiniilized? null:InitDep(),
      // initialBinding:InitDep(),

      textDirection: TextDirection.ltr,
          builder: (context, child) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              maxWidth: 1200,
              minWidth: 410,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(410, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(650, name: TABLET),
                const ResponsiveBreakpoint.autoScale(900, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
              background: Container(color: const Color(0xFFF5F5F5))),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: MyColor.mainColor,
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
          locale: c.intiallang,
          translations: MyLocale(),
          home: show
              ? LogoMain(
                  showw: show,
                )
              :
              // VerificationScreen()
              LogoMain2(
                  showw: show,
                )),
    );
  }
}
