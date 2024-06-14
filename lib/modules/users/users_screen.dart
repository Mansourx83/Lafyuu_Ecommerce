


import 'package:flutter/material.dart';

import '../../models/user/users_model.dart';

class UsersScreen extends StatelessWidget {

  //هعمل ليست يكون نوعها اوبجيكت من الكلاس اللي عملته
  List<UserModel> users = [
    UserModel(id: 1, name: 'Hisham Atef', phone: '01258555654'),
    UserModel(id: 2, name: 'Mohamed Ali', phone: '01442592256'),
    UserModel(id: 3, name: 'Saeed nor', phone: '01576856558'),
    UserModel(id: 4, name: 'Mary yossef', phone: '01265585548'),
    UserModel(id: 5, name: 'Eslam Atef', phone: '01892858585'),
    UserModel(id: 6, name: 'Dina Emam', phone: '01218295848'),
    UserModel(id: 7, name: 'Zina moner', phone: '025955858485'),
    UserModel(id: 8, name: 'alla Reda', phone: '032484884584'),
    UserModel(id: 9, name: 'Gege Goda', phone: '098451821554'),
    UserModel(id: 10, name: 'Lolo kareem', phone: '0548584584'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: Divider(color: Colors.grey[300],indent: 1),
        ),
        itemCount: users.length,
      ),
    );
  }



  //1-build item
//2- build list
//3- build item to list

//Custom Widget For User item
  //همرر للميثود من خلال البراميتر متغير بياخد اوبجيكت من اليوزر موديل علشان اكسس علي الداتا اللي جواه
  //وامررها في المكان اللي محتاجه
  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25,
          child: Text(
            //هعمل اكسس علي الاي دي من خلال الاوبجيكت اللي اخدته من الكلاس الاساسي
            '${user.id}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('${user.phone}',
                style: TextStyle(fontSize: 15, color: Colors.grey))
          ],
        )
      ],
    ),
  );




}

