import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDb{

   late Database database;
    String category="category";
    String itemModel="itemModel";
    String itemsName="itemsName";
    String products="products";


  MyDb(){
    initDB();
  }

   Future initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'my_products.db');

    // print(path); //output /data/user/0/com.testapp.flutter.testapp/databases/demo.db
    //WidgetsFlutterBinding.ensureInitialized();
    database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db,int version) {
          // When creating the db, create the table
          return db.execute('''

                  CREATE TABLE IF NOT EXISTS $category( 
                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                        name TEXT NOT NULL,                        
                    );

                    //create more table here
                
                ''');
        });
  }
  // add a single note method
//
//   static Future<bool> addCategory(String name){
//     initDB();
//     Future<int> mgs= MyDb.database.rawInsert("INSERT INTO $_category (name) VALUES (?);",
//         [name]);
//     var result=mgs.then((value) {
//       if(value>0){return true;}else{return false;}
//     });
//     return result;
//   }
//
//   // Import notes form directory's
//   static Future<bool> importNote(String creationTime,String modifiedTime,String title, String description,){
//     initDB();
//     Future<int> mgs= MyDb.database.rawInsert("INSERT INTO $_category (title, description, creationTime, modifiedTime) VALUES (?, ? ,?, ?);",
//         [title, description, creationTime,modifiedTime]);
//     var result=mgs.then((value) {
//       if(value>0){return true;}else{return false;}
//     });
//     return result;
//   }
//   //get note information by id
//   static Future<Map<dynamic, dynamic>?> getNote(int uid) async {
//     initDB();
//     List<Map> maps = await database.query(_category,
//         where: 'id = ?',
//         whereArgs: [uid]);
//     if (maps.isNotEmpty) {
//       return maps.first;
//     }
//     return null;
//   }
//
//   static Future<List<Map<String,dynamic>>> searchNote(String searchText)  {
//     initDB();
//     return  database.rawQuery("SELECT * FROM $_category WHERE title LIKE (?);", ["%$searchText%"]);
//   }
//   // get all note method
//   static Future<List<Map<String,dynamic>>> getAllNote()  {
//     initDB();
//     return  database.query(_category);
//   }
//   // delete note by id method
//   static Future<bool> deleteNote(int id)  {
//     initDB();
//     Future<int> mgs=database.delete(_category,where: 'id = ?',whereArgs: [id]);
//     var result=mgs.then((value) {
//       if(value>0){return true;}else{return false;}
//     });
//     return result;
//   }
// //   update note info by id
//   static Future<bool> updateNote(String title,String description,String modifiedTime, int id) async{
//     initDB();
//     Future<int> mgs=database.update(_category,{'title':title,'description':description, 'modifiedTime': modifiedTime}, where: 'id = ?',whereArgs: [id]);
//     var result=mgs.then((value) {
//       if(value>0){return true;}else{return false;}
//     });
//     return result;
//
//   }

}