import 'package:flutter/material.dart';

import '../../modules/login/loginhome.dart';


//هعمل ديفولت بوتن للاب كله وهمرر الخواص عن طريق الكونستراكتور
class DefaultButton extends StatelessWidget {
  //الديفولت للعرض هو دابل انفنتي لو مدخلتش ليه ويدث عند الاستدعاء
  double width = double.infinity;
//اللون الديفولت للبوتن لو مدخلتش لون
  Color background = const Color.fromRGBO(64, 191, 255, 1);
  //فانكشن همرره مكان الفانكشن اون بريسد
  dynamic function;
  String? text;
  double radius=100;
  bool isUpperCase = true;

  DefaultButton({
    this.width = double.infinity,
    this.background = const Color.fromRGBO(64, 191, 255, 1),
    required this.function,
    @required this.text,
    this.radius=10,
    this.isUpperCase = true,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      minWidth: width,
      color: background,
      elevation: 10,
      height: 60,
      onPressed: function,
      child: Text( isUpperCase ?
      text!.toUpperCase():text!,
        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );;
  }
}

//Create class Card contain image and title and 2 icon and price and 2 icon buttom
class cardOfProduct extends StatefulWidget {
  final String imagetext;
  final String title;
  final String price;

  const cardOfProduct({
    Key? key,
    required this.imagetext,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  State<cardOfProduct> createState() => _cardOfProductState();
}
int counter = 1;
class _cardOfProductState extends State<cardOfProduct> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white38,
      padding: EdgeInsets.all(5),
      height: 150,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            //image in card
            Image.asset(widget.imagetext),
            SizedBox(width: 5),
            // ثاني جزي في الكارد وهو عبارة عن كولوم فيه العنوان والسعر اسفل منه
            SizedBox(
              width: MediaQuery.of(context).size.width * .35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title),
                  Text(
                    widget.price,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: buttoncolor),
                  ),
                ],
              ),
            ),
            Spacer(),
            //ثالث جزء من الكارد عبارة عن 2 ايقون بوتن ف الاعلي وفي الاسفل 2بوتن وكونتينر لزيادة عدد
            //العنصر المشتري او تقليله
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //الجزء الخاص باليقونات
                  Row(
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Icon(Icons.favorite, color: Colors.red)),
                      SizedBox(width: 10),
                      InkWell(onTap: () {}, child: Icon(Icons.delete)),
                    ],
                  ),
                  //الجزء الخاص بعدد القطع والتحكم فيها بزيادة او نقص
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white, border: Border.all(width: .2)),
                        height: 25,
                        width: 25,
                        child: InkWell(
                          child: Icon(Icons.remove),
                          onTap: () {
                            setState(() {
                              if (counter <= 1) {
                                counter == 1;
                              } else {
                                counter--;
                              }
                            });
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(width: .2)),
                        child: Center(child: Text("$counter")),
                        width: 25,
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white, border: Border.all(width: .2)),
                        height: 25,
                        width: 25,
                        child: InkWell(
                          child: Icon(Icons.add),
                          onTap: () {
                            setState(() {
                              counter++;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




//defaultTextFormFiled
Widget defaultTextFormFiled ({
  required TextEditingController controller,
  required TextInputType keyboardtype,
  Function? onSubmit,
  Function? onChanged,
  //لو حصل مشكلة في نوع الفانكشن عند الكتابة اقف بالماوس علي الفانكشن اللي انت عايزها واطبع نوعها بالظبط في البراميتر
  required String? Function(String?)? validate,
  void Function(String?)? onSaved,
  required String label,
  required String hint,
  required IconData prefix,
  Widget? suffixicon,
  bool isPassword = false,
  int? maxLength,



})=>TextFormField(
  //controller لحفظ القيمة او الداتا داخل المتغير واقدر اكنترول عليها او استخدمها
  controller: controller,
  keyboardType: keyboardtype,
  //علشان استدعي الفانشكن من البراميتر لازم ااكده انه بيرجع داتا من نفس النوع
  onFieldSubmitted: onSubmit as void Function(String)?,
  onChanged: onChanged as void Function(String)?,
  onSaved: onSaved,
  //validator بيخزن التكست او الداتا اليي بيدخلها المستخدم في المتغير فاليو اللي هو المتغير الخاص بالفانكشن بتاعته
  //ليه مزايا كتير منها انه لو المستخدم مدخلش داتا في البورد يقدر يظهرله رسالة ان الحقل فارغ
  //او مثلا حددتله نوع داتا ودخل عكسها او عدد حروف اكبر هنا الفاليديتور بيظهر رسالة للمستخدم بالخطأ اللي بيعمله
  //تابع الكود علشان تعرف الاستخدام
  validator: validate,
  obscureText: isPassword,

  maxLength: maxLength,
  decoration:  InputDecoration(
    alignLabelWithHint: true,
      border: OutlineInputBorder(),
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(prefix),
    //  suffix: suffix,
      suffixIcon: suffixicon,
  ),


);








