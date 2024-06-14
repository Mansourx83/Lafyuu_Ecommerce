import 'package:flutter/material.dart';
import 'package:ecommerce_trining/my_import.dart';
import '../../data.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BackTheme(),
      child: Scaffold(
        appBar: AppBar(
          //shape: Border.all(color: Colors.black38),
          title: Text("Account"),
        ),
        body: Column(
          children: [
            //profile Botton
            CustomOutLineBotton(
              icon: Icon(Icons.person_2_outlined),
              text: "Profile",
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen())),
            ),
            //Order Botton
            CustomOutLineBotton(
              icon: Icon(Icons.badge),
              text: "Order",
              onPressed: () {},
            ),
            //Address Botton
            CustomOutLineBotton(
                icon: Icon(Icons.location_on),
                text: "Address",
                onPressed: () {},
            ),
            //Payment Botton
            CustomOutLineBotton(
                icon: Icon(Icons.credit_card),
                text:"Payment",
                onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

//Custom Widget for OutlinedButton.icon
OutlinedButton customOutLineBotton(
    BuildContext context, Icon icon, String text) {
  return OutlinedButton.icon(
    style: OutlinedButton.styleFrom(
      alignment: Alignment.centerLeft,
      fixedSize: Size(MediaQuery.of(context).size.width, 60),
    ),
    onPressed: () {},
    icon: Icon(icon.icon, size: 26),
    label: Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium,
    ),
  );
}
