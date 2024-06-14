import 'package:ecommerce_trining/modules/login/loginhome.dart';
import 'package:flutter/material.dart';

import '../../data.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({super.key});

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BackTheme(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shape: Border.all(color: Colors.black38),
          title: Text(
            "Offer"
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              //Cupon Box
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: buttoncolor,
                ),
                margin: EdgeInsets.symmetric(vertical: 16),
                padding:
                    EdgeInsets.only(right: 115, left: 16, top: 16, bottom: 16),
                width: double.maxFinite,
                height: 100,
                child: Text(
                  "Use “MEGSL” Cupon For Get 90%off",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.5),
                ),
              ),
              //عملت اكسباند للكونتينتر لان الليست فيو مع الكولوم او الرو بيعمل ايرور
              //فبتعمله مساحه حره للويدجيت الاب علشان يقدر يتمدد ويختفي الايرور
              Expanded(
                child: Container(
                  //استخدمت ليست فيو سيبارتيد لان فيها لوب وفيها فانكشن بتعمل فاصل بين العناصر
                  child: ListView.separated(
                    itemCount: offers.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        //عن طريق المديا كويري الكونتينر اخد طول الصفحة وقسمها علي عدد الانيدكس اللي عندي
                        height:
                            MediaQuery.of(context).size.height / offers.length,
                        child: OfferStackWidget(
                      image: offers[i]["image"],
                    ),
                      );
                    },

                    //الميثود اللي بتعمل لوب علشان تعمل فاصل ع حسب عدد العناصر ودي اجبارية
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.transparent,
                        thickness: 50,
                        height: 16,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* 
class _OfferPageState extends State<OfferPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 122, left: 16, right: 16),
        decoration: BackTheme(),
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Text(
                "Offer",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
            Divider(height: 0, thickness: 2),
          ],
        ));
  }
} */
