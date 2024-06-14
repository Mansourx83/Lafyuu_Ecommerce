import 'package:flutter/material.dart';

import '../../data.dart';
import '../login/loginhome.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BackTheme(),
        child: ListView(
          children: [
            //search box
            Container(
              child: Row(
                children: [
                  Expanded(
                    //TextFormField for search box
                    child: TextFormField(
                      decoration: InputDecoration(
                        //TextFormField box size
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                        prefixIcon: Icon(Icons.search, color: buttoncolor),
                        border: OutlineInputBorder(),
                        hintText: "Search Product",
                      ),
                      //ظهور صفحة البحث عند الضغط علي التيكست فيلد
                      onTap: () {
                        //showSearch(context: context, delegate: CustomSearch());
                      },
                    ),
                  ),
                  //الايقون الجانبية  بجوار التيكست فيلد
                  SizedBox(width: 5),
                  Icon(Icons.favorite_border, size: 24),
                  SizedBox(width: 5),
                  Stack(alignment: Alignment.topRight, children: [
                    Icon(Icons.notifications_none, size: 24),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                      ),
                      height: 12,
                      width: 12,
                    )
                  ]),
                ],
              ),
            ),
            SizedBox(height: 16),
            //Man Fashion headLine text
            Text("Man Fashion",
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 12),
            //man Fashion List
            GridView.builder(
              //physics هوقف عن طريق السكرول الخاص بالجريد فيو لاني بستعمل بالفعل اسكرول بالليست فيو في اعلي الصفحة
              //هيديني ايرور لاني بستخدم خاصيتين اسكرول بيعملوا اسكرول لنفس الصفحة
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  mainAxisExtent: 130.0,
                  crossAxisSpacing: 15),
              itemCount: Fashion[0]["man"].length,
              itemBuilder: (context, index) {
                //باستخدام الكاستم ويدجيت اللي عملتها هممر الداتا اللي داخل الليست فاشون
               return customCircularCategory(title: Fashion[0]["man"][index]["title"], ImageLink: Fashion[0]["man"][index]["icon"]);
                /*return customCircularCategory(Fashion[0]["man"][index]["icon"],
                    Fashion[0]["man"][index]["title"]);*/
              },
            ),
            SizedBox(height: 16),
            //Woman Fashion headLine text
            Text("Woman Fashion",
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 12),
            //man Fashion List
            GridView.builder(
              //physics هوقف عن طريق السكرول الخاص بالجريد فيو لاني بستعمل بالفعل اسكرول بالليست فيو في اعلي الصفحة
              //هيديني ايرور لاني بستخدم خاصيتين اسكرول بيعملوا اسكرول لنفس الصفحة
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  mainAxisExtent: 130.0,
                  crossAxisSpacing: 15),
              itemCount: Fashion[0]["woman"].length,
              itemBuilder: (context, index) {
                //باستخدام الكاستم ويدجيت اللي عملتها هممر الداتا اللي داخل الليست فاشون
                return customCircularCategory(title: Fashion[0]["woman"][index]["title"], ImageLink: Fashion[0]["woman"][index]["icon"]);
                /*return customCircularCategory(
                    Fashion[0]["woman"][index]["icon"],
                    Fashion[0]["woman"][index]["title"]);*/
              },
            ),
          ],
        ),
      ),
    );
  }
}
