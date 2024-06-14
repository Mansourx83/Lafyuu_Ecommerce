//ليست للداتا داخل الكاتيجوري
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

List CategoryInfo = [
  {
    "icon": "assets/images/manshirt.png",
    "title": "Man Shirt",
  },
  {
    "icon": "assets/images/dress.png",
    "title": "Dress",
  },
  {
    "icon": "assets/images/eqbag.png",
    "title": "Man Work Equipment",
  },
  {
    "icon": "assets/images/wobag.png",
    "title": "Woman Bag",
  },
  {
    "icon": "assets/images/manshoes.png",
    "title": "Man Shoes",
  },
  {
    "icon": "assets/images/highheel.png",
    "title": "High Heels",
  },
];

class customCircularCategory extends StatelessWidget {
  String ImageLink;
  String title;
   customCircularCategory({Key? key,required this.title,required this.ImageLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       Container(
         height: 70,
         width: 70,
         margin: EdgeInsets.only(right: 10),
         decoration: BoxDecoration(
             image: DecorationImage(
               image: NetworkImage(ImageLink),
               fit: BoxFit.cover
             ),
             border: Border.all(width: 0.8),
             color: const Color.fromARGB(50, 234, 224, 224),
             borderRadius: BorderRadius.circular(100)),

         padding: EdgeInsets.all(15),
       ),
       SizedBox(height: 6),
       SizedBox(
         width: 90,
         child: Text(
           title,
           maxLines: 2,overflow: TextOverflow.ellipsis,
           textAlign: TextAlign.center,
           softWrap: true,
           style: TextStyle(
             fontSize: 12,
             fontWeight: FontWeight.bold,
             color: Colors.grey.shade700,
           ),
         ),
       ),
     ],
   );
  }

}

//custom circular Category
/*Widget customCircularCategory(String ImageLink, String title) {
  return Column(
    children: [
      Container(
        height: 70,
        width: 70,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(ImageLink),
          ),
            border: Border.all(width: 0.8),
            color: const Color.fromARGB(50, 234, 224, 224),
            borderRadius: BorderRadius.circular(100)),

        padding: EdgeInsets.all(15),
      ),
      SizedBox(height: 6),
      SizedBox(
        width: 90,
        child: Text(
          title,
          maxLines: 2,overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700,
          ),
        ),
      ),
    ],
  );
}*/

//list flash Sale data
List flashsale = [
  {
    "image": "assets/images/sale1.jpg",
    "title": "FS - Nike Air Max 270 React...",
    "price": "\$280",
    "oldprice": "\$555.63",
    "offer": "25% off",
    "info":
        "Shim Store offers its customers the latest types of fashion in men's shoes. It offers men's lace-up shoes - light sole for the foot - easy to wear - modern.",
    "size": [7,8,95,11,12,14,15] , 
  },
  {
    "image": "assets/images/sale2.jpg",
    "title": "Canon -camera 4k max...",
    "price": "\$190",
    "oldprice": "\$360.70",
    "offer": "20% off",
    "info":
        "BrandCanonModel NameEOS 250DWeight in Grams449 gramsDimensions(W x H x D) 122.4 x 92.6 x 69.8mmDigital Camera TypeDSLRMemory Card SlotYesMaximum Resolution (in Megapixel)24.1 MegapixelsLCD Monitor Size in Inch3.0 INCHShortest Shutter Speed in s1/4000 - 30 secZoom capability1.5x - 10xBattery TypeRechargeable Li-ion Battery LP-E17Auto FocusYesMagnificationApprox. 0.87xWiFi ConnectivityYesWireless LANNo",
  },
  {
    "image": "assets/images/sale7.png",
    "title": "Sauvage by dior for men - edp 100 ml ",
    "price": "\$170",
    "oldprice": "\$320.47",
    "offer": "22% off",
    "info":
        "Sauvage elixir by dior is a aromatic fragrance for men. This is a new fragrance. The nose behind this fragrance is francois demachy. Top notes are cinnamon, nutmeg, cardamom and grapefruit; middle note is lavender; base notes are licorice, sandalwood, amber, patchouli and haitian vetiver",
  },
  {
    "image": "assets/images/sale3.jpg",
    "title": "HandBag queende25 nice wear...",
    "price": "\$170",
    "oldprice": "\$320.47",
    "offer": "22% off",
    "info":
        "Bags and shoes made of high quality materials, meticulous design and skillful craftsmanship. Adds creative flair and artistic flair In each collection the inspiration is revealed in the fascinating diversity of cultures, art, nature, fashion trends and upcoming colours.",
  },
  {
    "image": "assets/images/sale4.jpg",
    "title": "Brand: Generic Sabo Shoes For Women",
    "price": "\$170",
    "oldprice": "\$320.47",
    "offer": "22% off",
    "info":
        "Bags and shoes made of high quality materials, meticulous design and skillful craftsmanship. Adds creative flair and artistic flair In each collection the inspiration is revealed in the fascinating diversity of cultures, art, nature, fashion trends and upcoming colours.",
  },
  {
    "image": "assets/images/sale6.jpg",
    "title": "Hero Basic Mens V-Neck T-shirt",
    "price": "\$170",
    "oldprice": "\$320.47",
    "offer": "22% off",
    "info":
        "Since 1977, American Eagle has offered an assortment of specialty apparel and accessories for men and women that enables self-expression and empowers our customers to celebrate their individuality. The brand has broadened its leadership in jeans by producing innovative fabric with options for all styles and fits for all at a value. We aren’t just passionate about making great clothing, we’re passionate about making real connections with the people who wear them.",
  },
];

//ليست بالمنتجات المراد عرضها في البانر العلوي الخاص بالخصومات والعروض
List offers = [
  {
    "image": "assets/images/shoes.jpg",
    "title": "Super Flash Sale 50% Off",
    "timer": Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            child: Text(
              "08",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
          ),
        ),
        Text(
          ":",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            child: Text(
              "34",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
          ),
        ),
        Text(
          ":",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            child: Text(
              "52",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  },
  {
    "image": "assets/images/sunglass.jpg",
    "title": "Super Flash Sale 50% Off",
    "timer": Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            child: Text(
              "08",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
          ),
        ),
        Text(
          ":",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            child: Text(
              "34",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
          ),
        ),
        Text(
          ":",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            child: Text(
              "52",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  },
  {
    "image": "assets/images/sale2.jpg",
    "title": "Super Flash Sale 50% Off",
    "timer": Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            child: Text(
              "08",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
          ),
        ),
        Text(
          ":",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            child: Text(
              "34",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
          ),
        ),
        Text(
          ":",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            child: Text(
              "52",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  },
  {
    "image": "assets/images/laroche.jpg",
    "title": "Super Flash Sale 70% Off",
    "timer": Text(
      "Best women Fashion",
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          backgroundColor: Colors.white10,
          fontWeight: FontWeight.bold),
    ),
  }
];




class OfferStackWidget extends StatelessWidget {
  const OfferStackWidget({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.fill, //fit : التصورات ينبغي أن تكون 100
      //fit: BoxFit.fill,
    );
  }
}

//الثيم الخاص بالخلفية
BoxDecoration BackTheme() {
  return BoxDecoration(
    gradient: LinearGradient(
        colors: [
          Colors.purple.shade50,
          Colors.purple.shade100,
          Colors.purple.shade200,
          Colors.blue.shade800,
        ],
        end: Alignment.topLeft,
        tileMode: TileMode.clamp,
        begin: Alignment.center,
        transform: const GradientRotation(120),
        stops: [0.1, 0.3, 0.5, 1]),
  );
}

//headline text
Text headLineText(String text) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        letterSpacing: 1,
        color: Color.fromRGBO(34, 50, 99, 1)),
  );
}

//App Text Theme
Text appTextTheme({required String text, TextAlign? textAlign, Color? color}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(color: color ?? Colors.black54),
  );
}

//Banner image contaner
Container bannarImage(BuildContext context,String imageText) {
  return Container(
    height: MediaQuery.of(context).size.height * .30,
    width: MediaQuery.of(context).size.width * .98,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: NetworkImage(
          imageText,
        ),
        fit: BoxFit.fill,
      ),
    ),
  );
}


//هعمل كلاس للسيرش ديلجيت علشان امرره في السيرش بوكس
class CustomSearch extends SearchDelegate {


  @override
  List<Widget>? buildActions(BuildContext context) {
    //buildActions دي ليست بتحتوي علي ويدجيت ودا نفس الاكشن الموجود في الاب بار
    //فدا الاكشن او الجزئ الايمن من البوكس الخاص بالسيرش لما افتحه او اضغط عليه
    return [Icon(Icons.close)];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //buildLeading دا نفس الليدنج اللي موجود بالاب بار بس هنا هيكون للبوكس الخاص بالسيرش واللي بيكون من نوع ويدجيت
    return IconButton(
        onPressed: () {
          //close فانكشن بيلد ان جاهز داخل السيرش ديليجيت ومهمته انه يقفل السيرش او يخرج منه
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    //buildResults الخاصة بنتيجة البحث
    return Text("Prodact");
  }

  //buildSuggestions الاقتراحات اللي بتكون مكتوبة تحت البوكس سيرش علشان تقترح علي اليوزر كلمات معينة تقدر تساعده في السيرش
  //زي ما بتعمل سيرش في الفيس او تويتر او يوتيوب او غيره
  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Lottie.asset("assets/animations/Animation - 1701258782468.json"),
      ),
    );
  }
}

//List Of Fashion Category  Man And Woman In list Of Map
List Fashion = [
  {
    "man": [
      {
        "icon": "assets/images/manshirt.png",
        "title": "Man Shirt",
      },
      {
        "icon": "assets/images/eqbag.png",
        "title": "Man Work Equipment",
      },
      {
        "icon": "assets/images/manshoes.png",
        "title": "Man Shoes",
      },
      {
        "icon": "assets/images/tshirt.png",
        "title": "Man T-Shirt",
      },
      {
        "icon": "assets/images/manshoes.png",
        "title": "Man Shoes",
      },
      {
        "icon": "assets/images/manander.png",
        "title": "Man UnderWear",
      },
      {
        "icon": "assets/images/manpants.png",
        "title": "Man Pants",
      },
    ],
    "woman": [
      {
        "icon": "assets/images/dress.png",
        "title": "dress",
      },
      {
        "icon": "assets/images/womantshirt.png",
        "title": "Woman T-shirt",
      },
      {
        "icon": "assets/images/womanpants.png",
        "title": "Woman Pants",
      },
      {
        "icon": "assets/images/womanskirt.png",
        "title": "Skirt",
      },
      {
        "icon": "assets/images/wobag.png",
        "title": "Woman Bag",
      },
      {
        "icon": "assets/images/highheel.png",
        "title": "High Heels",
      },
      {
        "icon": "assets/images/bikini.png",
        "title": "Bikini",
      },
    ],
  },
];

//هعمل كلاس اخزن فيه الداتا الخاصة بالمستخدم
class UserData {
  String? name;
  String? email;
  int? age;
  String? password;

  //هخزن الاسم في الذاكرة داخل كاي اسمه يوزرنيم
  setName() async {
    SharedPreferences setname = await SharedPreferences.getInstance();
    setname.setString('username', this.name!);
  }

  setEmail() async {
    SharedPreferences setname = await SharedPreferences.getInstance();
    setname.setString('username', this.name!);
  }

  setnAge() async {
    SharedPreferences setname = await SharedPreferences.getInstance();
    setname.setString('username', this.name!);
  }

  setnPassword() async {
    SharedPreferences setname = await SharedPreferences.getInstance();
    setname.setString('username', this.name!);
  }
}
