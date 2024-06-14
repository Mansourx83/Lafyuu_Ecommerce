import 'package:ecommerce_trining/data.dart';
import 'package:ecommerce_trining/models/categories_product_model.dart';
import 'package:ecommerce_trining/modules/login/loginhome.dart';
import 'package:ecommerce_trining/repository/categories_product_repository.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesScreen extends StatefulWidget {
  String? CategoryName;
  int? CategoryID;
   CategoriesScreen({super.key,this.CategoryName,this.CategoryID});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<CategoriesProductModel> categoryProductData;

  @override
  void initState() {
    categoryProductData = CategoriesProductRepository().getCatProductData(widget.CategoryID.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
      color: Colors.white,
      //decoration: BackTheme(),
      child: Scaffold(
        appBar:  AppBar(
          title: Text(widget.CategoryName!),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: categoryProductData,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 140,
                              width: 100,
                              color:  Colors.grey,
                            );
                          }
                      )
                  ),
                );
              }
              if(snapshot.hasError){
                return Center(
                  child: Text('Error'),
                );
              }
              if(snapshot.hasData){
                final catPrudData = snapshot.data!.data.data;
                return GridView.builder(
                  //physics وقفت السكرول الخاص بالجريد فيو لاني بستخدم بالفعل سكرول للصفحة بالليست فيو
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: catPrudData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //mainAxisExtent علشان ازود مساحة البوكس اللي هيظهر فيه العناصر
                    crossAxisCount: 2,
                    mainAxisExtent: 240,
                  ),
                  itemBuilder: (context, i) {
                    return Container(
                      width: 140,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 15, bottom: 8),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 150,
                                  child: Image.network(
                                    catPrudData[i].image.toString(),
                                    height: 100,
                                    width: 150,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  catPrudData[i].name.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "${catPrudData[i].price.toString()} \$",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: buttoncolor),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${catPrudData[i].oldPrice.toString()} \$",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          decoration: TextDecoration.lineThrough),
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      "${catPrudData[i].discount.toString()} \$",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    );
                  },
                );
              }
              return Container();
            }

          )
        ),
      ),
    );
  }
}
