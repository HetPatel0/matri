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
        'title': 'Add User',
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddUser()),
        ),
      },
      {
        'icon': Icons.list_alt,
        'title': 'User List',
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserList()),
        ),
      },
      {
        'icon': Icons.favorite_border,
        'title': 'Favourite',
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
      appBar: AppBar(
        title: Text('Matrimonial App',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade700,
        elevation: 5,
      ),
      body: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.1,
          ),
          itemCount: iconlist.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: iconlist[index]['onTap'],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(iconlist[index]['icon'],
                          size: 34, color: Colors.indigo.shade800),
                    ),
                    SizedBox(height: 15),
                    Text(
                      iconlist[index]['title'],
                      style: TextStyle(
                        fontSize: 18,
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
    );
  }
}
