import 'package:flutter/material.dart';
import 'package:matrimonial_app/project/AddUser.dart';
import 'package:matrimonial_app/project/UserList.dart';
import 'package:matrimonial_app/project/aboutUs.dart';
import 'package:matrimonial_app/project/favourite.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> iconlist = [
      {
        'icon': Icons.person_add,
        'title': 'Add Profile',
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddUser()),
        ),
      },
      {
        'icon': Icons.list_alt,
        'title': 'Browse Profiles',
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserList()),
        ),
      },
      {
        'icon': Icons.favorite_border,
        'title': 'Favorites',
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Favourite()),
        ),
      },
      {
        'icon': Icons.info_outline,
        'title': 'About Us',
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutUs()),
        ),
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   centerTitle: true,
      //   title:Text(
      //     'SOUL SYNC',
      //     style: TextStyle(
      //       fontSize: 28,
      //       fontFamily: "Font1",
      //       letterSpacing: 5,
      //       fontWeight: FontWeight.w600,
      //       color: Colors.white,
      //     ),
      //   ),
      //
      //
      //   backgroundColor: Colors.pinkAccent.shade100,
      //
      //
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pinkAccent.shade100, Colors.white],
          ),
        ),
        child: Column(

          children: [

            SizedBox(height: 10),
            Image.asset('assets/images/lala.png',height: 150,),// Spacer for header alignment
            Text(
              "Welcome to SoulSync Matrimony",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Matching your vibes out here",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: iconlist.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: iconlist[index]['onTap'],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              iconlist[index]['icon'],
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            iconlist[index]['title'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
