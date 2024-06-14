import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_trining/cubit/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_trining/models/categories_product_model.dart';
import 'package:ecommerce_trining/models/flashsale_and_banner_model.dart';
import 'package:ecommerce_trining/models/product_info_model.dart';
import 'package:ecommerce_trining/modules/home/homepage.dart';
import 'package:ecommerce_trining/modules/login/loginhome.dart';
import 'package:ecommerce_trining/repository/home_repository.dart';
import 'package:ecommerce_trining/repository/product_Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../data.dart';

class ProductDetail extends StatefulWidget {
  final String title;
  final int id;
  ProductDetail({super.key, required this.id, required this.title});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  //متغير لاختيار حجم البروداكت
  int size = 2;

  int _currentindex = 0;

  late Future<ProductInfoModel> productItemInfo;
  late Future<FlashSaleAndBannersModel> flashsleData;

  @override
  void initState() {
    productItemInfo = ProductRepository().getProductItemInfo(widget.id);
    flashsleData = HomeRepository().getFlashSaleData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is NotAuthorizedInCart) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("يجب تسجيل الدخول اولا"),
            ),
          );
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return LoginHome();
            }));
          });
        }
      },
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BackTheme(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
          body: FutureBuilder<ProductInfoModel>(
              future: productItemInfo,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error"),
                  );
                }
                if (snapshot.hasData) {
                  final productInfo = snapshot.data!.data;
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SafeArea(
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              //product image
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  child: Column(
                                    children: [
                                      CarouselSlider.builder(
                                        itemCount: productInfo.images.length,
                                        itemBuilder:
                                            (context, index, realIndex) {
                                          return OfferStackWidget(
                                            image: productInfo.images[index],
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
                                            autoPlayInterval:
                                                Duration(seconds: 2),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ...List.generate(
                                              productInfo.images.length,
                                              (index) {
                                            return Container(
                                              width: 15.0,
                                              height: 15.0,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 2.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: _currentindex == index
                                                    ? Color.fromRGBO(
                                                        0, 250, 0, 50)
                                                    : Color.fromRGBO(
                                                        0, 0, 0, 0.2),
                                              ),
                                            );
                                          })
                                        ],
                                      ),
                                    ],
                                  )),

                              SizedBox(height: 10),
                              //Product title and icon Favorite and rating stars and price
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Product title and icon Favorite
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .75,
                                        child: Text(
                                          productInfo.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.favorite_border)),
                                    ],
                                  ),

                                  //rating stars
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          size: 25,
                                          color:
                                              Color.fromRGBO(255, 200, 51, 1)),
                                      Icon(Icons.star,
                                          size: 25,
                                          color:
                                              Color.fromRGBO(255, 200, 51, 1)),
                                      Icon(Icons.star,
                                          size: 25,
                                          color:
                                              Color.fromRGBO(255, 200, 51, 1)),
                                      Icon(Icons.star,
                                          size: 25,
                                          color:
                                              Color.fromRGBO(255, 200, 51, 1)),
                                      Icon(Icons.star,
                                          size: 25, color: Colors.grey),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  //product Price
                                  Text(
                                    "${productInfo.price} \$",
                                    style: TextStyle(
                                        color: Color.fromRGBO(64, 191, 255, 1),
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),

                              SizedBox(height: 15),
                            ],
                          ),

                          //product select size
                          Text(
                            "select size",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: 15),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                circularSelectSize("7", .5),
                                circularSelectSize("8", .5),
                                circularSelectSize("9.5", 3),
                                circularSelectSize("11", .5),
                                circularSelectSize("12", .5),
                                circularSelectSize("12.5", .5),
                                circularSelectSize("13", .5),
                                circularSelectSize("14", .5),
                                circularSelectSize("15", .5),
                                circularSelectSize("16", .5),
                              ],
                            ),
                          ),

                          SizedBox(height: 15),
                          //select Color
                          Text(
                            "Select Color",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: 12),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                circularSelectColor(false, Colors.red),
                                circularSelectColor(true, Colors.green),
                                circularSelectColor(false, Colors.yellow),
                                circularSelectColor(false, Colors.black),
                                circularSelectColor(false, Colors.blue),
                                circularSelectColor(false, Colors.brown),
                                circularSelectColor(false, Colors.amber),
                                circularSelectColor(false, Colors.blueGrey),
                              ],
                            ),
                          ),

                          SizedBox(height: 15),
                          //product Specification
                          Text(
                            "Specification",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: 10),
                          Container(
                            //color: Colors.amber.shade400,
                            //height: MediaQuery.of(context).size.height * .35,
                            width: MediaQuery.of(context).size.width * .95,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //Shown
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .10,
                                      child: Text("Shown:"),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .40,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .10,
                                      child: Text(
                                          'Laser Blue/Anthracite/Watermelon/White',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          textAlign: TextAlign.right),
                                    )
                                  ],
                                ),

                                //style
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Style :"),
                                    appTextTheme(text: "CD0113-400"),
                                  ],
                                ),

                                SizedBox(height: 10),
                                Text(
                                  productInfo.description,
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                          //Review Product
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * .95,
                            height: MediaQuery.of(context).size.height * .45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    headLineText("Review Product"),
                                    Text(
                                      "See More",
                                      style: TextStyle(
                                          color: buttoncolor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                SizedBox(height: 8),
                                //rating stars
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        size: 22,
                                        color: Color.fromRGBO(255, 200, 51, 1)),
                                    Icon(Icons.star,
                                        size: 22,
                                        color: Color.fromRGBO(255, 200, 51, 1)),
                                    Icon(Icons.star,
                                        size: 22,
                                        color: Color.fromRGBO(255, 200, 51, 1)),
                                    Icon(Icons.star,
                                        size: 22,
                                        color: Color.fromRGBO(255, 200, 51, 1)),
                                    Icon(Icons.star,
                                        size: 22, color: Colors.grey),
                                    SizedBox(width: 15),
                                    appTextTheme(text: "4.5 (5 Review)"),
                                  ],
                                ),
                                //review user pic and username and  stars
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/user1.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      children: [
                                        headLineText("Alisson Joca"),
                                        SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Icon(Icons.star,
                                                size: 22,
                                                color: Color.fromRGBO(
                                                    255, 200, 51, 1)),
                                            Icon(Icons.star,
                                                size: 22,
                                                color: Color.fromRGBO(
                                                    255, 200, 51, 1)),
                                            Icon(Icons.star,
                                                size: 22,
                                                color: Color.fromRGBO(
                                                    255, 200, 51, 1)),
                                            Icon(Icons.star,
                                                size: 22,
                                                color: Color.fromRGBO(
                                                    255, 200, 51, 1)),
                                            Icon(Icons.star,
                                                size: 22, color: Colors.grey),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),

                                //user Comment
                                SizedBox(height: 10),
                                Text(
                                  "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.black54),
                                ),

                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Image.asset("assets/images/sale2.jpg",
                                        width: 75, height: 75),
                                    SizedBox(width: 8),
                                    Image.asset("assets/images/sale7.png",
                                        width: 75, height: 75),
                                    SizedBox(width: 8),
                                    Image.asset("assets/images/sale6.jpg",
                                        width: 75, height: 75),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Text("December 10, 2023")
                              ],
                            ),
                          ),

                          //You Might Also Like
                          headLineText("headLineText"),
                          SizedBox(height: 10),
                          SectionFlashSale(flashsleData: flashsleData),

                          SizedBox(height: 15),
                          BlocBuilder<CartCubit, CartState>(
                            builder: (context, state) {
                              if (state is ItemAddedLoading) {
                                return Center(child: CircularProgressIndicator());
                              }
                              return ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<CartCubit>(context).addToCart(
                                      widget.id
                                    );
                                  }, child: Text("Add To Cart"));
                            },
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  );
                }
                return SizedBox();
              }),
        ),
      ),
    );
  }

/*  FutureBuilder<ProductInfoModel> SectionBanner() {
    return FutureBuilder(
        future: productItemInfo,
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
            final List  banndata = snapshot.data!.data.images;
            return Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: banndata.length,
                      itemBuilder: (context, index, realIndex) {
                        return OfferStackWidget(
                          image: banndata[index],

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
  }*/
}

//Custom Widget For  circularSelectSize Container
Container circularSelectSize(String sizetype, double bordarwidth) {
  return Container(
    height: 48,
    width: 48,

    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
        color: const Color.fromARGB(50, 234, 224, 224),
        border: Border.all(width: bordarwidth, color: buttoncolor),
        borderRadius: BorderRadius.circular(100)),
    child: Center(child: Text(sizetype)),
    //padding: EdgeInsets.all(20),
  );
}

//Custom Widget For  circularSelectColor Container
Container circularSelectColor(bool selected, Color color) {
  return Container(
    height: 48,
    width: 48,

    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
        color: color,
        border: Border.all(width: .1),
        borderRadius: BorderRadius.circular(100)),
    child: Center(
      child: selected == true
          ? Icon(Icons.circle, color: Colors.white, size: 18)
          : null,
    ),
    //padding: EdgeInsets.all(20),
  );
}
