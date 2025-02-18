// Favourite.dart
import 'package:flutter/material.dart';
import 'package:matrimonial_app/database/databaseHelper.dart';
import 'package:matrimonial_app/database/model.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<UserListData> favouriteUsers = [];

  @override
  void initState() {
    super.initState();
    fetchFavouriteUsers();
  }

  Future<void> fetchFavouriteUsers() async {
    // Fetch all users from the database and filter for favourites
    final data = await UserDatabase.instance.readAllUser();
    setState(() {
      favouriteUsers = data.where((user) => user.isFav == true).toList();
    });
  }

  Future<void> _unfavoriteUser(UserListData user, int index) async {
    // Set the user's favourite flag to false and update the DB
    user.isFav = false;
    await UserDatabase.instance.update(user);
    // Remove the user from the favourite list to update the UI immediately
    setState(() {
      favouriteUsers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Users',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,fontFamily: "Font1",color: Colors.white),),
        backgroundColor: Colors.pinkAccent,
      ),
      body: favouriteUsers.isEmpty
          ? const Center(
              child: Text(
                'No favourite users found.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.pinkAccent.shade100, Colors.white],
                ),
              ),
              child: ListView.builder(
                itemCount: favouriteUsers.length,
                itemBuilder: (context, index) {
                  final user = favouriteUsers[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pinkAccent.shade100,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    title: Text("${user.firstName} ${user.lastName}"),
                    subtitle: Text(user.email ?? ''),
                    trailing: IconButton(onPressed: () {
                      showUnfavouriteConfirmationDialog(context,user,index);

                    },tooltip: "Unfavorite", icon: const Icon(Icons.favorite,color: Colors.red,),),

                    // You can add more details here if needed
                  );
                },
              ),
            ),
    );
  }

  void showUnfavouriteConfirmationDialog(BuildContext context,UserListData user,int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure to unfavourite'),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {

                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async{
                await _unfavoriteUser(user, index);
                Navigator.of(context).pop();
              },
              child: Text('Unfavourite', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
