import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDb{
  static late Database database;
  static const String _tableName="product";

  MyDb(){
    open();
  }

  static Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notes.db');

    // print(path); //output /data/user/0/com.testapp.flutter.testapp/databases/demo.db
    //WidgetsFlutterBinding.ensureInitialized();
    database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db,int version) {
          // When creating the db, create the table
          return db.execute('''

                  CREATE TABLE IF NOT EXISTS $_tableName( 
                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                        title TEXT NOT NULL,
                        description TEXT,
                        creationTime TEXT,
                        modifiedTime TEXT
                        
                    );

                    //create more table here
                
                ''');
        });
  }
  // add a single note method
  static Future<bool> addNote(String title, String description, String creationTime){
    open();
    Future<int> mgs= MyDb.database.rawInsert("INSERT INTO $_tableName (title, description, creationTime, modifiedTime) VALUES (?, ? ,?, ?);",
        [title, description, creationTime,"None"]);
    var result=mgs.then((value) {
      if(value>0){return true;}else{return false;}
    });
    return result;
  }

  // Import notes form directory's
  static Future<bool> importNote(String creationTime,String modifiedTime,String title, String description,){
    open();
    Future<int> mgs= MyDb.database.rawInsert("INSERT INTO $_tableName (title, description, creationTime, modifiedTime) VALUES (?, ? ,?, ?);",
        [title, description, creationTime,modifiedTime]);
    var result=mgs.then((value) {
      if(value>0){return true;}else{return false;}
    });
    return result;
  }
  //get note information by id
  static Future<Map<dynamic, dynamic>?> getNote(int uid) async {
    open();
    List<Map> maps = await database.query(_tableName,
        where: 'id = ?',
        whereArgs: [uid]);
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  static Future<List<Map<String,dynamic>>> searchNote(String searchText)  {
    open();
    return  database.rawQuery("SELECT * FROM $_tableName WHERE title LIKE (?);", ["%$searchText%"]);
  }
  // get all note method
  static Future<List<Map<String,dynamic>>> getAllNote()  {
    open();
    return  database.query(_tableName);
  }
  // delete note by id method
  static Future<bool> deleteNote(int id)  {
    open();
    Future<int> mgs=database.delete(_tableName,where: 'id = ?',whereArgs: [id]);
    var result=mgs.then((value) {
      if(value>0){return true;}else{return false;}
    });
    return result;
  }
//   update note info by id
  static Future<bool> updateNote(String title,String description,String modifiedTime, int id) async{
    open();
    Future<int> mgs=database.update(_tableName,{'title':title,'description':description, 'modifiedTime': modifiedTime}, where: 'id = ?',whereArgs: [id]);
    var result=mgs.then((value) {
      if(value>0){return true;}else{return false;}
    });
    return result;

  }

}