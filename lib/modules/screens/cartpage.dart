// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ecommerce_trining/modules/login/loginhome.dart';

import '../../data.dart';
import '../../shared/components/components.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}
/*
استخدم انيميشن  لوتي واعمل كونديشن لو الكارت فاضي اظهر الانيميشن غي كدا اظهر الايتم
* */
class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BackTheme(),
      child: Scaffold(
        appBar: AppBar(title: Text('Your Cart')),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Column(
                children: [
                  // create Card contain image and title and 2 icon and price and 2 icon buttom
                  cardOfProduct(
                    imagetext: "assets/images/sale1.jpg",
                    title: "FS - Nike Air Max 270 React...",
                    price: "\$280",
                  ),
                  SizedBox(height: 10),
                  cardOfProduct(
                    imagetext: "assets/images/sale1.jpg",
                    title: "FS - Nike Air Max 270 React...",
                    price: "\$280",
                  ),

                  SizedBox(height: 15),
                  //TextField cupon and apply Button
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white38,
                    // width: 100,
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 70,
                            //width: MediaQuery.of(context).size.width * .95,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Enter Cupon Code",
                                  suffixIcon: MaterialButton(
                                    minWidth:
                                        MediaQuery.of(context).size.width * .20,
                                    height: double.maxFinite,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(5)),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Apply",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    color: buttoncolor,
                                  ),
                                  suffixStyle: TextStyle(color: Colors.amber)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Total order
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.white,
                    height: 165,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("items(2)"),
                            Text("560\$"),
                          ],
                        ),
                        Divider(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shipping"),
                            Text("60\$"),
                          ],
                        ),
                        Divider(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Import charges"),
                            Text("110\$"),
                          ],
                        ),
                        Divider(height: 20, thickness: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "500\$",
                              style: TextStyle(color: buttoncolor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),
                  //Check Out button
                  DefaultButton(
                    function: () {},
                    text: "Check Out",
                    isUpperCase: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
