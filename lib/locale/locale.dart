import 'package:get/get.dart';
class MyLocale implements Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'ar':{
      'login':'تسجيل الدخول',
      'loginn':'تسجيل',
      'email_address':'عنوان البريد الالكترونى',
      'email':'البريد الالكتروني',
      'password':'الرمز السري',
      're_password':'إعادة إدخال كلمة المرور',
      'forgot':'نسيت الرمز السري؟',
      'new_signup':'ليس لديك حساب؟',
      'signup':'تسجيل حساب',
      'signupp':'تسجيل',
      'full_name':'الاسم الكامل',
      'your_full_name':'اسمك الكامل',
      'gender':'جنس',
      'male':'ذكر',
      'female':'أنثى',
      'stage':'مرحلة',
      'please_email':'الرجاء إدخال عنوان البريد الإلكتروني الخاص بك',
      'send':'إرسال',
      'verify_code':'التحقق من كود',
      'verification':'تَحَقّق',
      'new_password':'كلمة السر الجديدة',
      'please_enter_newpass':'الرجاء إدخال كلمة مرور جديدة',
      'title_new_password':'تم تحديث كلمة السر',
      'body_new_password':'تم تحديث كلمة المرور الخاصة بك ، اضغط على الزر أدناه للعودة إلى شاشة تسجيل الدخول',
      'back_to_login':'العودة إلى تسجيل الدخول',
      'exit':'هل تريد الخروج؟',
      'back to login':'هل تريد العوده الى صفحه تسجيل الدخول؟',
      'exit exam':'هل تريد مغادره الامتحان؟ (سوف تعتبر باقي الاسئله خاطئه)',
      'timeout':'لقد انتهى وقت الامتحان!! اضغط على الزر في الاسفل لمعرفه نتيجتك',
      'yes':'نعم',
      'ok':'موافق',
      'no':'لا',

      'title_signup_screen':'اكد حسابك',
      'body_signup_screen':'لقد قمت بالتسجيل بنجاح ، لقد أرسلنا رابط تأكيد إلى بريدك الإلكتروني',
      /////////////////////
      ////////////////////
      //////////////////////
      /////////////////////
      'home':'الرئيسية',
      'quiz':'اختبار',

      'score_page':'صفحة النتيجة',
      'no_quiz':'لا يوجد اختبار حتى الان',

      'profile':'الملف الشخصي',
      'total_quizzes':'مجموع الاختبارات',
      'avg_score':'متوسط النتيجة',
      'quiz_history':'تاريخ الاختبار',

      'settings':'الإعدادات',
      'profile_settings':'إعدادات الملف الشخصي',
      'language':'اللغة',
      'sign_out':'تسجيل الخروج',
      'name':'الاسم',


      'your_score':'درجاتك',
      'correct':'صحيح',
      'incorrect':'غير صحيح',
      'show_the_correct_answer':'اظهر الإجابة الصحيحة',
      'choose_any_of_the_following':':اختر أي مما يلي',
      'solutions':'حلول',
      'question':'سؤال',

      'timer':'الوقت',
      'score':'نتيجة',
      'next':'التالي',

      'save':'حفظ',


      ///////////////////////////FONTS///////////////////////////////
      'fonts':'SFMarwa',
      'fontsbold':'SFMarwabold',
      'fontsmedium':'SFMarwaMedium',

      ///////////////////////////////////////////////////////////////
      'titelOn1':'تعليم',
      'descripOn1':'يتضمن تطبيق امتحاني اختبارات في جميع المواد الدراسية ولكافة المراحل',
      'titelOn2':'ميزات',
      'descripOn2':'من مميزات التطبيق خزن اختباراتك ومعرفة نقاط ضعفك',
      'titelOn3':'اخيرا',
      'descripOn3':'يساعدك تطبيق امتحاني على اختبار نفسك وتجاوز صعوبات المواد الدراسيه',


    },
    'en':{
      'login':'Login',
      'loginn':'Login',
      'email_address':'Email Address',
      'email':'Email',
      'password':'Password',
      're_password':'Re-Enter Password',
      'forgot':'Forgot your password?',
      'new_signup':"Don't have an account?",
      'signup':'Sign Up',
      'signupp':'Sign Up',
      'full_name':'Full Name',
      'your_full_name':'Your Full Name',
      'gender':'Gender',
      'male':'Male',
      'female':'Female',
      'stage':'Stage',
      'please_email':'Please enter your email',
      'send':'Send',
      'verify_code':'Verify Code',
      'verification':'Verification',
      'new_password':'New Password',
      'please_enter_newpass':'Please enter a new password',
      'title_new_password':'Password Updated',
      'body_new_password':'Your password have been updated, press the button below to go back to login screen',
      'back_to_login':'Back to Login',
      'exit':'Do you want to exit?',
      'back to login':'Do you want to go back to login?',
      'exit exam':"Are you sure you want to quit the quiz?(unsubmitted questions will be considered incorrect)",
      'timeout':'Quiz time is over!!, press the buttom below to view your score',
      'yes':'Yes',
      'OK':'OK',

      'no':'No',

      'title_signup_screen':'Confirm your account',
      'body_signup_screen':'you have successfully signed up, we have send a confirmation link to your email',

      /////////////////////
      ////////////////////
      //////////////////////
      /////////////////////

      'home':'Home',
      'quiz':'Quiz',

      'score_page':'Score Page',
      'no_quiz':'There is no quiz yet',

      'profile':'Profile',
      'total_quizzes':'Total Quizzes',
      'avg_score':'Avg Score',
      'quiz_history':'Quiz History',

      'settings':'Settings',
      'profile_settings':'Profile Settings',
      'language':'Language',
      'sign_out':'Sign Out',
      'name':'Name',


      'your_score':'Your Score',
      'correct':'Correct',
      'incorrect':'Incorrect',
      'show_the_correct_answer':'Show The Correct Answer',
      'choose_any_of_the_following':'Choose any the following',
      'solutions':'Solutions',
      'question':'Question',


      'timer':'TIMER',
      'score':'Score',
      'next':'Next',

      'save':'Save',

      ///////////////////////////FONTS///////////////////////////////
      'fonts':'Poppins',
      'fontsbold':'Poppinsbold',
      'fontsmedium':'PoppinsMedium',
      ///////////////////////////////////////////////////////////////

      'titelOn1':'Education',
      'descripOn1':'Amtihane application includes tests in all subjects for all levels',
      'titelOn2':'Advantages',
      'descripOn2':'One of the features of the application is to store your tests and know your weaknesses',
      'titelOn3':'Finally',
      'descripOn3':'Amtihane application helps you to test yourself and overcome the difficulties of study subjects',



    },
  };

}