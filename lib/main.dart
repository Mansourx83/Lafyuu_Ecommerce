import 'package:ecommerce_trining/cubit/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_trining/cubit/cubit_app.dart';
import 'package:ecommerce_trining/modules/screens/categoris_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_trining/my_import.dart';
import 'layout/home_layout.dart';
import 'modules/home/homepage.dart';
import 'modules/login/loginhome.dart';
import 'modules/screens/cartpage.dart';
import 'modules/screens/product_detail.dart';
import 'modules/screens/splashscreen.dart';
import 'tester_code.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        //Theme App
        theme: ThemeData(
          //textTheme
          textTheme: const TextTheme(
            //خاصة بالعناوين بحجم كبير
            headlineLarge: TextStyle(
                letterSpacing: .80,
                color: Color.fromRGBO(34, 50, 99, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            //خاص بالعناوين الفرعية بحجم متوسط ولون كحلي
            headlineMedium: TextStyle(
                letterSpacing: .80,
                color: Color.fromRGBO(34, 50, 99, 1),
                fontSize: 16,
                fontWeight: FontWeight.bold),
            //خاصة بالعناوين الرئيسية القابلة للضغط بلون ثيم البوتن
            headlineSmall: TextStyle(
                color: Color.fromRGBO(64, 191, 255, 1),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          //button Theme to all app
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(64, 191, 255, 1),
                elevation: 10,
                fixedSize: Size(MediaQuery.of(context).size.width * .98,
                    MediaQuery.of(context).size.height * .07),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )),
          ),
          primaryColor: const Color.fromRGBO(64, 191, 255, 1),

          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            toolbarHeight: 90,
            //white appbar and black text to app theme
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(34, 50, 99, 1),
            ),
            elevation: 0.0,

            //statusBarColor شريط الحالة الخاص بالهاتف
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
          ),
        ),

        initialRoute: ScreenPaths.loginhome,
        routes: {
          ScreenPaths.loginhome: (context) => LoginHome(),
        },
        //home: LoginHome(),
      ),
    );
  }
}
