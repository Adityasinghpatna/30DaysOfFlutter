import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
   final imageUrl = "https://ih1.redbubble.net/image.3027215861.2144/pp,840x830-pad,1000x1000,f8f8f8.jpg";
    return Drawer(
    child: Container(
      color: Colors.deepPurple,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
               accountName: Text("Aditya Singh"),
              accountEmail: Text("adisinghnbt@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
      ),
             const ListTile(
              leading: Icon(CupertinoIcons.home,
              color: Colors.white,
              ),
                title: Text(
               "Home",
               textScaleFactor: 1.2,
               style: TextStyle(
                color: Colors.white
               ),   
                ),
             ),
             const ListTile(
              leading: Icon(CupertinoIcons.profile_circled,
              color: Colors.white,
              ),
                title: Text(
               "Profile",
               textScaleFactor: 1.2,
               style: TextStyle(
                color: Colors.white
               ),   
                ),
             ),
              const ListTile(
              leading: Icon(CupertinoIcons.mail,
              color: Colors.white,
              ),
                title: Text(
               "Email me",
               textScaleFactor: 1.2,
               style: TextStyle(
                color: Colors.white
               ),   
      
      ),
    )
        ]
    ),
    ),
    );
  
}
}