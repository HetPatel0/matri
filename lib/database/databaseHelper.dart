
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'model.dart';


class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();
  static Database? _database;

  UserDatabase._init();

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    print('Creating database...');
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    print('Database Path: $path');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        print('Database created!');
        _createDB(db, version);
      },
    );
  }

 Future _createDB(Database db , int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType ='BOOLEAN NOT NULL';
    final integerType ='INTEGER NOT NULL';



    await db.execute('''
    CREATE TABLE $tableUsers (
      ${UserFields.id} $idType,
      ${UserFields.firstName} $textType,
      ${UserFields.lastName} $textType,
      ${UserFields.isFav} $boolType,
      ${UserFields.email} $textType,
      ${UserFields.age} $integerType,
      ${UserFields.dob} $textType,
      ${UserFields.city} $textType,
      ${UserFields.hobbies} $textType,
      ${UserFields.gender} $textType,
      ${UserFields.mobile} $textType,
      ${UserFields.pass} $textType
      

    )
    ''');

  }

  Future<UserListData> create(UserListData user) async {
    final db = await instance.database;
    print('Inserting user into the database...');
    try {
      final id = await db.insert(tableUsers, user.toMap());
      print('Inserted user with ID: $id');
      return user.copy(id: id);
    } catch (e) {
      print('Error inserting user: $e');
      rethrow;
    }
  }


  Future<UserListData> readUser(int id) async {
    final db = await instance.database;
    final maps= await db.query(tableUsers,columns: UserFields.values,where: '${UserFields.id}=?',whereArgs: [id]);
    if (maps.isNotEmpty) {
      return UserListData.fromJson(maps.first);

    }
    else{
      throw Exception('Id $id is not found');
    }
  }
  Future<List<UserListData>>  readAllUser() async {
    final db = await instance.database;
   final result = await db.query(tableUsers);
   return result.map((json)=> UserListData.fromJson(json)).toList();
  }


  Future<int> update(UserListData user) async {
    final db = await instance.database;
    return db.update(tableUsers, user.toMap(),where: '${UserFields.id}=?',whereArgs: [user.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(tableUsers,where: '${UserFields.id}=?',whereArgs: [id]);
  }


  Future close ()  async{
    final db = await instance.database;
    db.close();
  }
}
