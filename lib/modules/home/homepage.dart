import 'package:ecommerce_trining/models/flashsale_and_banner_model.dart';
import 'package:ecommerce_trining/modules/screens/categoris_screen.dart';
import 'package:ecommerce_trining/repository/category_repository.dart';
import 'package:ecommerce_trining/repository/product_Repository.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../data.dart';
import '../../models/category_model.dart';
import '../../repository/home_repository.dart';
import '../login/loginhome.dart';
import '../screens/product_detail.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//دا متغير بيتغير خاص بالسليد بتتغير قيمته مع قيمة الانديكس الخاصة بالليست
int _currentindex = 0;

class _HomePageState extends State<HomePage> {
  late Future<FlashSaleAndBannersModel> bannerData;
  late Future<CategoryModel> categoriesData;
  late Future<FlashSaleAndBannersModel> flashsleData;
  late Future<FlashSaleAndBannersModel> productDara;

  @override
  void initState() {
    bannerData = HomeRepository().getBannersData();
    categoriesData = CategoriesRepository().getCategoriesData();
    flashsleData = HomeRepository().getFlashSaleData();
    productDara = ProductRepository().getProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        //decoration: BackTheme(),
        child: ListView(
          children: [
            //TextFormField for search box
            SectionSearchBox(),
            //Offer Banner slider
            SectionBanner(),
            //slideChoosePoint
            /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                slideChoosePoint(3),
                slideChoosePoint(2),
                slideChoosePoint(1),
                slideChoosePoint(0),
              ],
            ),*/
            SizedBox(height: 5),
            //Category list
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Category",
                    style: Theme.of(context).textTheme.headlineMedium),
                Text("More Category",
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
            SizedBox(height: 10),
            //Category List Product
            SectioncategoryListWidget(),

            //Flash Sale List
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Flash Sale",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text("See More",
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
            SizedBox(height: 5),
            //ListView.separated استخدمتها هنا علشان اعمل فاصلبين العناصر عن طريق الميدياكويري
            SectionFlashSale(flashsleData: flashsleData),

            //text Mega Sale
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mega Sale",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text("See More",
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
            //Mega Sale List
            SectionFlashSale(flashsleData: flashsleData),

            //Image Product
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/product.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 10,
                    child: Text(
                      "Recomended \nProduct",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * .05,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 10,
                    child: Text(
                      "We recommend the best for you",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * .05,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //list of product
            SectionProductList(productDara: productDara),
          ],
        ),
      ),
    );
  }


  FutureBuilder<FlashSaleAndBannersModel> SectionBanner() {
    return FutureBuilder(
              future: bannerData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 200.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey,
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey,
                      ),
                    ),
                  );;
                }
                if (snapshot.hasError) {
                  return Text("error");
                }

                if (snapshot.hasData) {
                  final List  banndata = snapshot.data!.data.banners;
                  return Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Column(
                        children: [
                          CarouselSlider.builder(
                            itemCount: banndata.length,
                            itemBuilder: (context, index, realIndex) {
                              return OfferStackWidget(
                                image: banndata[index].image,

                              );
                            },
                            options: CarouselOptions(
                                initialPage: 0,
                                height: 200.0,
                                //viewportFraction نسبة ظهور العنصر ع الشاشة
                                viewportFraction: 1,
                                //enlargeCenterPage تكبير الصورة اللي في المنتصف
                                enlargeCenterPage: true,
                                //autoPlay التحريك الاوتوامتيك
                                autoPlay: true,
                                //autoPlayInterval مدة التغير بين كل صورة واخري
                                autoPlayInterval: Duration(seconds: 2),
                                //enableInfiniteScroll دي بخلي السكرول ملوش اخر يعني زي نظام الدائرة
                                //لو عملته فولس فاول ما يوصل لاخر انديكس هيرجع للانديكس الاول ويبدأاسكرول من الاول وهكذا
                                enableInfiniteScroll: true,
                                //scrollDirection اتجاه السكرول
                                onPageChanged: (index, reason) {
                                  //همرر قيمة لانديكس للمتغير علشان كل ما يتغير الاندكس يتغير معه قيمة المتغير
                                  setState(() {
                                    _currentindex = index;
                                  });
                                }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(banndata.length, (index) {
                                return Container(
                                  width: 15.0,
                                  height: 15.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentindex == index
                                        ? Color.fromRGBO(0, 250, 0, 50)
                                        : Color.fromRGBO(0, 0, 0, 0.2),
                                  ),
                                );

                              })
                            ],
                          ),
                        ],
                      ));
                }
                return SizedBox();
              });
  }

  //Category List widget Custom
  FutureBuilder SectioncategoryListWidget() {
    return FutureBuilder<CategoryModel>(
        future: categoriesData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 100.0,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(
                      width: MediaQuery.of(context).size.width * .02,
                    ),
                    itemCount: 10,
                  itemBuilder: (context, index) => CircleAvatar(
                    radius: 30,
                  ),
                ),
              ),
            );;
          }
          if (snapshot.hasError) {
            return Text("Error try again");
          }
          if (snapshot.hasData) {
            final catdata = snapshot.data!.data;
            return SizedBox(
              height: 125,
              child: ListView.separated(
                //الميثود اللي بتعمل لوب علشان تعمل فاصل ع حسب عدد العناصر وsدي اجبارية
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * .02);
                },
                scrollDirection: Axis.horizontal,
                itemCount: catdata.data.length,

                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: customCircularCategory(
                      ImageLink: catdata.data[index].image,
                      title: catdata.data[index].name,
                    ),
                    onTap:  () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategoriesScreen(
                            CategoryID: catdata.data[index].id,
                            CategoryName: catdata.data[index].name,
                          )));
                    },
                  );
                },
              ),
            );
          }
          return SizedBox();
        });
  }
}

class SectionProductList extends StatelessWidget {
  const SectionProductList({
    super.key,
    required this.productDara,
  });

  final Future<FlashSaleAndBannersModel> productDara;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productDara,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
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
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Error"),
          );
        }
        if (snapshot.hasData) {
          var ProdData = snapshot.data!.data.products;
          return GridView.builder(
            //physics وقفت السكرول الخاص بالجريد فيو لاني بستخدم بالفعل سكرول للصفحة بالليست فيو
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: ProdData.length,
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
                              ProdData[i].image,
                              height: 100,
                              width: 150,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            ProdData[i].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "${ProdData[i].price} \$",
                            textAlign: TextAlign.end,
                            style: TextStyle(color: buttoncolor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                          "${ProdData[i].oldPrice} \$",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              SizedBox(width: 7),
                              Text(
                                "${ProdData[i].discount} \$",
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
    );
  }
}

class SectionFlashSale extends StatelessWidget {
  const SectionFlashSale({
    super.key,
    required this.flashsleData,
  });

  final Future<FlashSaleAndBannersModel> flashsleData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: flashsleData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 100.0,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  height: 120,
                  width: 100,
                  color: Colors.grey.shade50,
                )
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return Text("error");
        }
        if (snapshot.hasData) {
          final List flashdata = snapshot.data!.data.products;
          return SizedBox(
            height: 240,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                    width: MediaQuery.of(context).size.width * .02);
              },
              scrollDirection: Axis.horizontal,
              itemCount: flashdata.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    width: 140,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, top: 15, bottom: 8),
                        child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100,
                                child: Image.network(
                                  flashdata[index].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                flashdata[index].name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                  "${flashdata[index].price}",
                                textAlign: TextAlign.end,
                                style: TextStyle(color: buttoncolor),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${flashdata[index].oldPrice}",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        decoration:
                                        TextDecoration.lineThrough),
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    "${flashdata[index].discount}",
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
                  ),
                  onTap: () {
                    //عملت نافيجتور تنقلني لصفحة الديتيلز وعن طريق المتغير اللي اسمه داتا اللي في صفحة الديتيلز
                    //همرر من خلاله الداتا اللي عايز اعرضها
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetail(id: flashdata[index].id,title: flashdata[index].name,),
                    ));
                  },
                );
              },
            ),
          );
        }
        return SizedBox();
      }
    );
  }
}

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
                fillColor: Colors.transparent,
                filled: true,
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

//عملت كاستم ويدجيت للدوائر اللي تحت السليدر وهممر من خلالها الانديكس
Container slideChoosePoint(int indexnum) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 2),
    //هتحكم في حجم الكونتينر عن طريق المتغير والانديكس بحيث ان لما المتغير يكون بيساوي الانديكس ياخد حجم معين
    height: _currentindex == indexnum ? 15 : 10,
    width: _currentindex == indexnum ? 15 : 10,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        border: Border.all(width: .3),
        borderRadius: BorderRadius.circular(20),
        color:
            _currentindex == indexnum ? Colors.lightBlue : Colors.transparent),
  );
}
