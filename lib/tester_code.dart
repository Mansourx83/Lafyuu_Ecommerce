import 'package:ecommerce_trining/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*void main(List<String> args) {
  runApp(Tester());
}*/

class Tester extends StatelessWidget {
  const Tester({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.blue,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tester"),
        ),
        body: Center(
          child: DefaultButton(
            function: () {
              print("press");
            },
            text: "text",
          ),
        ),
      ),
    );
  }
}
