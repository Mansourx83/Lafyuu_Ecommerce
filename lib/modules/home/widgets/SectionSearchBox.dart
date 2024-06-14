import 'package:ecommerce_trining/data.dart';
import 'package:ecommerce_trining/modules/login/loginhome.dart';
import 'package:flutter/material.dart';

class SectionSearchBox extends StatelessWidget {
  const SectionSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                showSearch(context: context, delegate: CustomSearch());
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
    );
  }
}