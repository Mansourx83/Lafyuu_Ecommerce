import 'package:ecommerce_trining/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../data.dart';
import 'loginhome.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //هعمل 2 متغير علشان اتاكد انه الباسورد والكارنت باسورد نفس بعض ولا لا واقدر لو في غلط عن طريقهم
  //هخليه يساوو النفس القيم ببعضها
  String? password;
  String? curpassword;

  //متغيرات لحفظ الداتا عن طريق التيكست فيلد كونترولر علشان اقدر استخدمها فيها بعد
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var curentpassword = TextEditingController();

  //متغير لاظهار واخفاء الباسورد
  bool _showpassword = true;

  //هعمل كاي للفورم
  GlobalKey<FormState> _keystat = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BackTheme(),
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 72,
                      height: 72,
                    ),
                  ),
                  //Text at the bottom of the logo
                  Text(
                    "Let's Get Started",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  //Text at the bottom of the logo
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 50),
                    child: Text(
                      "Create an new account",
                      style: TextStyle(color: Colors.blueGrey[600]),
                    ),
                  ),
                  //textfield for Register info
                  Form(
                      key: _keystat,
                      child: Column(
                        children: [
                          //full name box
                          defaultTextFormFiled(
                            controller: nameController,
                            keyboardtype: TextInputType.name,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "name must not be empty";
                              }
                            },
                            label: "your name",
                            hint: "Full Name",
                            prefix: Icons.account_box_outlined,
                          ),

                          SizedBox(height: 8),
                          //email text field
                          defaultTextFormFiled(
                            controller: emailController,
                            keyboardtype: TextInputType.emailAddress,
                            validate: (value) {
                              //هنا هبدأ اديله الاحتمالات بتاعتي والرسايل اللي هتظهر لليوزر
                              if (value!.isEmpty) {
                                return "email must not be empty";
                              } else if (!value.contains("@") ||
                                  !value.contains(".")) {
                                return "wrong email format. Example: mail@gamil.com";
                              }
                            },
                            label: "E-mail",
                            hint: "Your E-mail",
                            prefix: Icons.mail_outline,
                          ),

                          SizedBox(height: 8),
                          //password text field
                          defaultTextFormFiled(
                            controller: passwordController,
                            keyboardtype: TextInputType.visiblePassword,
                            onSaved: (newValue) => password = newValue,
                            onChanged: (value) {
                              password = value;
                            },
                            maxLength: 15,
                            isPassword: _showpassword,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "password must not be empty";
                              } else if (value!.length <= 8) {
                                return "password must be more than 8";
                              }
                            },
                            label: "Password",
                            hint: "Your Password",
                            prefix: Icons.lock_outline,
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

                          SizedBox(height: 8),
                          defaultTextFormFiled(
                            controller: curentpassword,
                            isPassword: _showpassword,
                            keyboardtype: TextInputType.visiblePassword,
                            onSaved: (newValue) => curpassword = newValue,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "password must not be empty";
                              }
                              if (password != curpassword) {
                                return "password must be same";
                              }
                            },
                            label: "Password again",
                            hint: "Password again",
                            prefix: Icons.lock_outline,
                            onChanged: (value) {
                              curpassword = value;
                            },
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

                        ],
                      )),
                  SizedBox(height: 15),
                  //sign in button
                  DefaultButton(
                    function: () {
                      if (!_keystat.currentState!.validate()) {
                      } else {
                        Navigator.of(context).pushNamed("homelayout");
                      }
                    },
                    text: "sign in",
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "have a account?  ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).popAndPushNamed("loginhome"),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: buttoncolor, fontWeight: FontWeight.bold),
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
