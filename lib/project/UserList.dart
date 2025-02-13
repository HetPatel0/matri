import 'package:flutter/material.dart';
import 'package:matrimonial_app/database/databaseHelper.dart';
import 'package:matrimonial_app/database/model.dart';
import 'package:matrimonial_app/project/AddUser.dart';
import 'package:matrimonial_app/project/homepage.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  TextEditingController searchController = TextEditingController();
  List<UserListData> _filteredUsers = [];

  late List<UserListData> users = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    UserDatabase.instance.close();

    super.dispose();
  }
  void _updateFilteredUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredUsers = users;
      } else {
        _filteredUsers = users.where((user) {
          return user.firstName.toLowerCase().contains(query.toLowerCase()) ||
              user.city.toString().toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  Future refreshNotes() async {
    final data = await UserDatabase.instance.readAllUser();
    setState(() {
      users = data;
      _filteredUsers = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details List',
            style: TextStyle(fontFamily: "Font1")),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: users.isEmpty
            ? const Text(
                'No Users',
                style: TextStyle(color: Colors.black, fontSize: 24),
              )
            : buildUsers(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddUser()),
          );

          refreshNotes();
        },
      ),
    );
  }

  Widget buildUsers() {
    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search here',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                ),
              ),
            ),
            Container(
              width: 100,
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  _updateFilteredUsers(searchController.text);
                },
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount:  _filteredUsers.length,
            itemBuilder: (context, index) {
              UserListData user = _filteredUsers[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text("${user.firstName} ${user.lastName}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text("City: ${user.city}, Mobile: ${user.mobile}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite, color: Colors.blue),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // showDeleteConfirmationDialog(context,user);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
