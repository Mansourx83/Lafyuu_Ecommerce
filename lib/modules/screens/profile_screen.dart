import 'package:ecommerce_trining/my_import.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            //Profile Image and Name
            Row(
              children: [
                Container(
                  constraints:  BoxConstraints(
                    maxHeight: 72,
                    maxWidth: 197,
                  ),
                  child: Row(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 72,
                          maxWidth: 72,
                        ),
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                                image: NetworkImage(FirebaseAuth.instance.currentUser?.photoURL ??"assets/images/profile-image-vector.jpg"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          SizedBox(
                            height: 21,
                            width: 109,
                            child:Text(FirebaseAuth.instance.currentUser?.displayName??"User",overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 1,
                              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14,fontWeight: FontWeight.w700),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 21,
                            width: 109,
                            child:Text("@${FirebaseAuth.instance.currentUser?.email}"??"Email",overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 1,),
                          ),
                          Spacer(),

                        ]
                      ),
                    ]
                  ),
                ),


              ]
            ),
            SizedBox(height: 32,),
            ProfileInfoBotton(
              icon: Icons.female,
              title: "Gender",
              triling: "Male",
            ),
            ProfileInfoBotton(
              icon: Icons.date_range,
              title: "Birthday",
              triling: "15-8-1994",
            ),
            ProfileInfoBotton(
              icon: Icons.email,
              title: "Email",
              triling: FirebaseAuth.instance.currentUser?.email??"Email",
            ),
            ProfileInfoBotton(
              icon: Icons.phone,
              title: "Phone",
              triling: FirebaseAuth.instance.currentUser?.phoneNumber??"+201055605655",
            ),
            ProfileInfoBotton(
              icon: Icons.password,
              title: "Password",
              triling: "************",
            ),

          ]
        ),
      )
    );
  }
}
