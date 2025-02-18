import 'package:flutter/material.dart';
import 'package:matrimonial_app/database/databaseHelper.dart';
import 'package:matrimonial_app/database/model.dart';
import 'package:matrimonial_app/project/AddUser.dart';
import 'package:matrimonial_app/project/homepage.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

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
    refreshUsers();
  }
  void showDeleteConfirmationDialog(BuildContext context,UserListData user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
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
                await UserDatabase.instance.delete(user.id!);
                setState(() {

                  users.remove(user);
                  _filteredUsers.remove(user);

                });
                Navigator.of(context).pop(); // Close dialog
                // Call the delete function
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _updateFilteredUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredUsers = users;
      } else {
        _filteredUsers = users.where((user) {
          return user.firstName.toLowerCase().contains(query.toLowerCase()) ;
        }).toList();
      }
    });
  }

  Future refreshUsers() async {
    final data = await UserDatabase.instance.readAllUser();
    setState(() {
      users = data;
      _filteredUsers = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'All Users',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,fontFamily: "Font1",color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
      ),

      // Body
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pinkAccent.shade100, Colors.white],
          ),
        ),
        child: Column(
          children: [
            // Extra top spacing to ensure the body doesn't hide under AppBar
            const SizedBox(height: 80),

            // Search Bar
            _buildSearchBar(),

            // User List
            Expanded(
              child: users.isEmpty
                  ? const Center(
                child: Text(
                  'No Users',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              )
                  : _buildUserListView(),
            ),
          ],
        ),
      ),

      // FloatingActionButton
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent.shade100,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddUser()),
          );
          refreshUsers();
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: searchController,
              onFieldSubmitted: _updateFilteredUsers,
              decoration: InputDecoration(
                hintText: 'Search people & places',
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(
                    color: Colors.pinkAccent,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(
                    color: Colors.pinkAccent,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              _updateFilteredUsers(searchController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            child: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
    );
  }


  Widget _buildUserListView() {
    return ListView.builder(
      itemCount: _filteredUsers.length,
      itemBuilder: (context, index) {
        UserListData user = _filteredUsers[index];
        return _buildUserCard(user);
      },
    );
  }


  Widget _buildUserCard(UserListData user) {
    // Example age (if your model doesn't store it, use a placeholder)
    String age = user.age?.toString() ?? "24"; // or compute from DOB if needed

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // ────────────── TOP ROW: Avatar, Name+Age, Heart, 3-dot ──────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 10),

                // Name & Age
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${user.firstName} ${user.lastName}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "$age years",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),

                // Heart icon
                IconButton(
                  icon: Icon( user.isFav?Icons.favorite : Icons.favorite_border),
                  color: Colors.pinkAccent,
                  onPressed: () async{
                    setState(() {
                      user.isFav = !user.isFav;
                    });
                    await UserDatabase.instance.update(user);

                  },
                ),

                // 3-dot menu icon
                PopupMenuButton<String>(
                  onSelected: (value) {
                    // Handle menu actions
                  },
                  itemBuilder: (context) => [
                     PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                        onTap: () async {

                          await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddUser(user: user),
                          ));

                          refreshUsers();


                        }
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                      onTap: () => showDeleteConfirmationDialog(context, user),
                    ),
                  ],
                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // ────────────── BOTTOM ROW: Location, Phone, Email ──────────────
            Row(
              children: [
                // Location
                const Icon(Icons.location_on, color: Colors.orange, size: 18),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    user.city!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                // Phone
                const Icon(Icons.phone, color: Colors.green, size: 18),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    user.mobile,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                // Email
                const Icon(Icons.email, color: Colors.blue, size: 18),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    user.email ?? "johndoe@example.com",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
