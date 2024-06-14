import 'package:ecommerce_trining/cubit/cubit_app.dart';
import 'package:ecommerce_trining/cubit/cubit_states.dart';
import 'package:ecommerce_trining/layout/home_layout.dart';
import 'package:ecommerce_trining/modules/home/homepage.dart';
import 'package:ecommerce_trining/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_trining/my_import.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../data.dart';

//botton color Default
Color buttoncolor = const Color.fromRGBO(64, 191, 255, 1);

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  //هعمل متغير  خاص بالفورم علشان امرر منه الداتا للكاي وهيبقي من نفس النوع اللي بيحمله الكاي الخاص بالفورم
  GlobalKey<FormState> _keystat = GlobalKey();

  //متغيرلاظهار الباسورد او اخفاءه
  bool _showpassword = true;

  //هعمل متغيرين احفظ فيهم الميل والباسورد
  String? email;
  String? password;

  //متغيرات لحفظ الداتا وعمل كونترول عليها داخل التيكست فيلد
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Background Color and theme
      body: Container(
        decoration: BackTheme(),
        //باستخدام الميديا كويري هخلي الكونتينر ياخد طول  وعرض الجهاز بالكامل
        height: context.height,
        width: context.width,

        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: context.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //logo image
                  Padding(
                    padding: EdgeInsets.only(top: context.height * 0.1),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: context.width * 0.5,
                      height: context.height * 0.1,
                    ),
                  ),
                  //Text at the bottom of the logo
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: context.height * 0.01),
                    child: Text(
                      "Wellcome To mega",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  //Text at the bottom of the logo
                  Text(
                    "Sign in to continue",
                    style: TextStyle(color: Colors.blueGrey[600]),
                  ),
                  SizedBox(height: context.height * 0.05),
                  //E-mail and pass TextFormField
                  Form(
                    key: _keystat,
                    //autovalidateMode ضيفته في الفورم الاساسي علشان لو عندي اكتر من تيكستفيلد يعمل تشيك عليهم كلهم اوتوماتيك
                    //autovalidateMode: AutovalidateMode.always,
                    //TextFormField for Email and Password
                    child: Column(
                      children: [
                        //E-mail TextFormField
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: context.height * 0.01),
                          //Email TextFormField
                          child: defaultTextFormFiled(
                            //controller لحفظ القيمة او الداتا داخل المتغير واقدر اكنترول عليها او استخدمها
                            controller: emailController,
                            keyboardtype: TextInputType.emailAddress,
                            //validator بيخزن التكست او الداتا اليي بيدخلها المستخدم في المتغير فاليو اللي هو المتغير الخاص بالفانكشن بتاعته
                            //ليه مزايا كتير منها انه لو المستخدم مدخلش داتا في البورد يقدر يظهرله رسالة ان الحقل فارغ
                            //او مثلا حددتله نوع داتا ودخل عكسها او عدد حروف اكبر هنا الفاليديتور بيظهر رسالة للمستخدم بالخطأ اللي بيعمله
                            //تابع الكود علشان تعرف الاستخدام
                            validate: (value) {
                              //هنا هبدأ اديله الاحتمالات بتاعتي والرسايل اللي هتظهر لليوزر
                              if (value!.isEmpty) {
                                return "email must not be empty";
                              } else if (!value.contains("@") ||
                                  !value.contains(".")) {
                                return "wrong email format. Example: mail@gamil.com";
                              }
                              ;
                            },
                            label: "E-mail",
                            hint: "Your E-mail",
                            prefix: Icons.email_outlined,
                          ),
                        ),
                        //Password TextFormField
                        defaultTextFormFiled(
                          controller: passwordController,
                          keyboardtype: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Password must not be empty";
                            } else if (value.length < 8) {
                              return "Password is too short";
                            }
                          },
                          label: "Password",
                          hint: "Your Password",
                          prefix: Icons.lock,
                          //obscureText لاخفاء الداتا المكتوبة زي الباسورد
                          isPassword: _showpassword,
                          //هعمل اظهار واخفائ للباسورد عند الضغط علي الايقون الخاصة باخفاء الباسورد
                          suffixicon: IconButton(
                            icon: _showpassword
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _showpassword = !_showpassword;
                              });
                            },
                          ),
                        ),

                        //MaterialButton for sign in
                        Padding(
                          padding: EdgeInsets.only(
                              top: context.height * 0.02,
                              bottom: context.height * 0.02),
                          child: DefaultButton(
                              function: () {
                                {
                                  //هعمل شرط لو شروط الفالديت الخاصة بالتيكست فيلد اتحققت  النافيجيتور يشتغل ويتم تسجيل الدخول
                                  //غير كدا لا
                                  if (_keystat.currentState!.validate()) {
                                    Navigator.of(context)
                                        .popAndPushNamed("homelayout");
                                  }
                                }
                                ;
                              },
                              text: "login"),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: context.height * 0.02),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 2,
                          ),
                        ),
                        const Text("OR"),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //login with Google button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 5,
                    ),
                    onPressed: () async {
                      final UserCredential userCredential =
                      await BlocProvider.of<AppCubit>(context).signInWithGoogle();
                      if (userCredential.user != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeLayOut(),
                            ));
                      }
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/images/google.png",
                            height: context.height * 0.03),
                        Spacer(),
                        const Text("Login With Google",
                            style: TextStyle(color: Colors.black54)),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(height: context.height * 0.01),
                  //login with facebook button
                   ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 5,
                        ),
                        onPressed: () async {
                          final UserCredential userCredential =
                              await BlocProvider.of<AppCubit>(context).signInWithFacebook();
                          if (userCredential.user != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeLayOut(),
                                ));
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.facebook,
                              size: context.height * 0.04,
                            ),
                            Spacer(),
                            const Text(
                              "Login With Facebook",
                              style: TextStyle(color: Colors.black54),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                   //forgot password
                  Padding(
                    padding: EdgeInsets.only(
                        top: context.height * 0.03,
                        bottom: context.height * 0.03),
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: Color.fromRGBO(64, 191, 255, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have a account?  ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      //Navigator to Register screan
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            )
                          );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Color.fromRGBO(64, 191, 255, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
