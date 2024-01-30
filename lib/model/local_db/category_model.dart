import 'package:inventoryapp/model/local_db/local_db.dart';
import 'package:sqflite/sqflite.dart';

class CategoryModel {
  late Database database;
  MyDb db = MyDb();

  // add category
  Future<bool> add(String name) async {
    database = await db.initDB();
    int result = await database
        .rawInsert("INSERT INTO ${db.category} (name) VALUES (?);", [name]);

    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }

  //retrieve all category
  Future<List<Map<String, dynamic>>> fetch() async {
    await db.initDB();
    return await database.query(db.category);
  }

  Future<bool> delete(int id) async {
    await db.initDB();
    int result =
        await database.delete(db.category, where: 'id = ?', whereArgs: [id]);
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }
}
