final String tableUsers = 'users';

class UserFields {
  static final List<String> values =[ id, firstName, lastName, email, mobile, gender, city, dob, age, hobbies, isFav,pass];
  static final String id ='_id';
  static final String firstName ='firstName';
  static final String lastName ='lastName';
  static final String email ='email';
  static final String gender ='gender';
  static final String city ='city';
  static final String dob ='dob';
  static final String age ='age';
  static final String hobbies ='hobbies';
  static final String isFav ='isFav';
  static final String mobile = "mobile";
  static final String pass = "pass";

}

class UserListData{



  int? id;
  String firstName;
  String lastName;

  String email;
  String mobile;
  String? gender;
  String? city;
  String dob;
  int age;
  String hobbies;
  bool isFav;
  String pass;

  UserListData({
    this.id,
    required this.firstName,
    required this.lastName,

    required this.email,
    required this.mobile,
    required this.gender,
    required this.city,
    required this.dob,
    required this.age,
    required this.hobbies,
    required this.isFav,
    required this.pass,

  });

  UserListData copy ({int? id,
    String? firstName,
    String? lastName,
    String?email,

    String? mobile,
    String? gender,
    String? city,
    String? dob,
    int? age,
    String? hobbies,
    bool? isFav,
    String? pass
  })=> UserListData(
    id: id ?? this.id,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    mobile: mobile ?? this.mobile,
    gender: gender ?? this.gender,
    city: city ?? this.city,
    dob: dob ?? this.dob,
    age: age ?? this.age,
    hobbies: hobbies ?? this.hobbies,
    isFav : isFav ?? this.isFav,
    pass: pass?? this.pass,




  );
  static UserListData fromJson(Map<String,dynamic>json) => UserListData(
    id: json[UserFields.id] as int?,
    firstName: json[UserFields.firstName] as String,
    lastName: json[UserFields.lastName] as String,
    email: json[UserFields.email] as String,
    mobile: json[UserFields.mobile] as String,
    gender: json[UserFields.gender] as String,
    city: json[UserFields.city] as String,
    dob: json[UserFields.dob] as String,
    age: json[UserFields.age] as int,
    hobbies: json[UserFields.hobbies] as String,
    isFav: json[UserFields.isFav] ==  1 ,
    pass: json[UserFields.pass] as String,






  );

  Map<String, dynamic> toMap() => {

    UserFields.id : id,
    UserFields.firstName:firstName,
    UserFields.lastName:lastName,
    UserFields.email:email,
    UserFields.isFav:isFav ? 1:0,
    UserFields.mobile:mobile,
    UserFields.gender:gender,
    UserFields.city:city,
    UserFields.dob:dob,
    UserFields.age:age,
    UserFields.hobbies:hobbies,
    UserFields.pass:pass
  };


}