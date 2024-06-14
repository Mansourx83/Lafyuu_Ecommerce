import 'package:ecommerce_trining/my_import.dart';

class ProfileInfoBotton extends StatelessWidget {
  ProfileInfoBotton({
    super.key,
    required this.icon,
    required this.title,
    required this.triling,
  });

  IconData icon ;
  String title ;
  String triling ;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 54,
        width: double.infinity,
        child: Row(
            children: [
              Icon(icon,size: 28,color:Theme.of(context).primaryColor,),
              SizedBox(width: 16,),
              Text(title,style: Theme.of(context).textTheme.headlineMedium,),
              Spacer(),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 150,
                ),
                child: Text(triling,overflow:TextOverflow.ellipsis,maxLines: 1,softWrap: true ,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey
                ),),
              ),
              SizedBox(width: 16,),
              Icon(Icons.arrow_forward_ios),
            ]
        )
    );
  }
}
