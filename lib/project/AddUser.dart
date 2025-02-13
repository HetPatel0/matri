import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:matrimonial_app/database/databaseHelper.dart';
import 'package:matrimonial_app/database/model.dart';

import 'package:matrimonial_app/project/homepage.dart';



class AddUser extends StatefulWidget {
   UserListData? user;

 AddUser({
    Key? key,
     this.user
}):super (key:key);

  @override
  State<AddUser> createState() => _AdduserState();
}

class _AdduserState extends State<AddUser> {
  var first_name = TextEditingController();
  var last_name = TextEditingController();
  var address = TextEditingController();
  var email = TextEditingController();
  var mobile = TextEditingController();
  var password = TextEditingController();
  var confirm_password = TextEditingController();
  List<String> selectedHobbies = [];

  String? selectedCity;
  String? selectedgender;
  int age = 0;
  String dob = 'Select DOB';

  DateTime? date = DateTime.now();

  final _kaka = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    DateTime today= DateTime.now();
    date=DateTime(today.year-18,today.month,today.day);
      first_name.text = widget.user?.firstName ??"";
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Add a User',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.indigo.shade700,
        elevation: 5,
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _kaka,
            child: ListView(
              children: [
                _buildFormRow(
                  label: "First Name:",
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      if (!RegExp(r"^[a-zA-Z\s\-']{3,50}$")
                          .hasMatch(value)) {
                        return 'Enter a valid FirstName';
                      }
                      return null;
                    },
                    controller: first_name,

                    decoration: _inputDecoration('Enter first name'),

                  ),
                ),

                _buildFormRow(
                  label: "Last Name:",
                  child: TextFormField(

                    controller: last_name,
                    decoration: _inputDecoration('Enter last name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      if (!RegExp(r"^[a-zA-Z\s\-']{3,50}$")
                          .hasMatch(value)) {
                        return 'Enter a valid FirstName';                          }
                      return null;
                    },
                  ),

                ),

                _buildFormRow(
                  label: "Email:",
                  child: TextFormField(
                    controller: email,
                    decoration: _inputDecoration('Enter email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                          .hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                _buildFormRow(
                  label: "Mobile no:",
                  child: TextFormField(
                    controller: mobile,
                    decoration: _inputDecoration('Enter mobile number'),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
                        return 'Enter a valid mobile number';
                      }
                      return null;
                    },

                  ),
                ),
                _buildFormRow(
                  label: "Gender:",
                  child: DropdownButtonFormField<String>(
                    decoration: _inputDecoration('Select Gender'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Select a Gender';
                      }

                      return null;
                    },
                    items: ['Male', 'Female', 'Others']
                        .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    ))
                        .toList(),
                    onChanged: (value) => selectedgender = value,
                  ),
                ),
                _buildFormRow(
                  label: "City:",
                  child: DropdownButtonFormField<String>(
                    decoration: _inputDecoration('Select City'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your city';
                      }

                      return null;
                    },
                    items: ['Rajkot', 'Ahemdabad', 'Vadodara', 'Surat']
                        .map((city) => DropdownMenuItem(
                      value: city,
                      child: Text(city),
                    ))
                        .toList(),
                    onChanged: (value) => selectedCity = value,
                  ),
                ),
                _buildFormRow(
                  label: "DOB:",
                  child: InkWell(
                    onTap: _selectDate,
                    child: InputDecorator(
                      decoration: _inputDecoration('Select Date of Birth'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(dob),
                          Icon(Icons.calendar_today,
                              color: Colors.indigo.shade700),
                        ],
                      ),
                    ),
                  ),
                ),
                _buildFormRow(
                  label: "Age:",
                  child: InputDecorator(
                    decoration: _inputDecoration('Age'),
                    child: Text(age.toString(),
                        style: TextStyle(color: Colors.grey.shade800)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Hobbies(
                    onHobbiesChanged: (hobbies) =>
                        setState(() => selectedHobbies = hobbies),
                  ),
                ),
                _buildFormRow(
                  label: "Password:",
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: _inputDecoration('Enter password'),
                  ),
                ),
                _buildFormRow(
                  label: "Confirm Password:",
                  child: TextFormField(
                    controller: confirm_password,
                    obscureText: true,
                    decoration: _inputDecoration('Confirm password'),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(

                  onPressed: addOrUpdateUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade700,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('SUBMIT',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormRow({required String label, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(label,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
          Expanded(flex: 5, child: child),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.indigo.shade700, width: 2),
      ),
      errorStyle: TextStyle(color: Colors.red),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    );
  }

  void _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,

      initialDate: date ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        dob = DateFormat('dd-MM-yyyy').format(date!);
        age = DateTime.now().year - date!.year;
        if (DateTime.now().isBefore(
            DateTime(date!.year, date!.month, date!.day).add(Duration(days: 1)))) {
          age--;
        }
      });
    }
  }



  // void _submitForm() {
  //
  //   if (!_kaka.currentState!.validate()) {
  //     // Show an error message or feedback if the form is invalid
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Please correct the errors in the form')),
  //     );
  //     return; // Prevent submission
  //   }
  //
  //   // Proceed only if the form is valid
  //   if (password.text != confirm_password.text) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Passwords do not match')),
  //     );
  //     return;
  //   }
  //
  //   UserListData updatedUser = UserListData(
  //     firstName: first_name.text,
  //     lastName: last_name.text,
  //
  //     email: email.text,
  //     mobile: mobile.text,
  //     gender: selectedgender,
  //     city: selectedCity,
  //     dob: dob,
  //     age: age,
  //     hobbies: selectedHobbies,
  //   );
  //
  //   Navigator.pop(context, updatedUser);
  // }
  void addOrUpdateUser() async {
    final isValid = _kaka.currentState!.validate();
    if (!isValid) {
      print("Validation failed.");
    }

    if (isValid) {
      final isUpdating = widget.user != null;

      if (isUpdating) {
        await updateUser();
      } else {
        await addUser();
      }

      Navigator.pop(context);
    }
  }
  Future updateUser() async {

  }

  Future addUser() async {
    try {
      String hobbies = selectedHobbies.join(',');
      final newuser = UserListData(
        firstName: first_name.text,
        lastName: last_name.text,
        isFav: false,
        email: email.text,
        mobile: mobile.text,
        gender: selectedgender,
        city: selectedCity,
        dob: dob,
        age: age,
        hobbies: hobbies,
        pass: password.text,
      );

      print("Attempting to add user: ${newuser.toMap()}");
      final createdUser = await UserDatabase.instance.create(newuser);
      print('User added successfully with ID: ${createdUser.id}');
    } catch (e) {
      print('Error adding user: $e');
    }
  }


}

// Keep your existing Hobbies widget class with updated styling
class Hobbies extends StatefulWidget {
  final Function(List<String>) onHobbiesChanged;

  const Hobbies({super.key, required this.onHobbiesChanged});

  @override
  State<Hobbies> createState() => _HobbiesState();
}

class _HobbiesState extends State<Hobbies> {
  final List<String> _selectedHobbies = [];

  void _handleHobbyChange(String hobby, bool selected) {
    setState(() {
      selected ? _selectedHobbies.add(hobby) : _selectedHobbies.remove(hobby);
    });
    widget.onHobbiesChanged(_selectedHobbies);
  }

  @override
  Widget build(BuildContext context) {
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hobbies",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            'Reading', 'Dancing', 'Singing',
            'Swimming', 'Gaming', 'Drawing'
          ].map((hobby) => FilterChip(
            label: Text(hobby),
            selected: _selectedHobbies.contains(hobby),
            onSelected: (selected) => _handleHobbyChange(hobby, selected),
            selectedColor: Colors.indigo.shade100,
            checkmarkColor: Colors.indigo.shade700,
            labelStyle: TextStyle(
              color: _selectedHobbies.contains(hobby)
                  ? Colors.indigo.shade700
                  : Colors.grey.shade800,
            ),
          )).toList(),
        ),
      ],
    );
  }
}