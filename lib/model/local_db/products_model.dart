import 'package:inventoryapp/model/local_db/local_db.dart';

class ProductsModel {
  //late Database database;
  MyDb db = MyDb();

  // add data into table
  Future<bool> add(String name) async {
    await db.initDB();
    int result = await db.database
        .rawInsert("INSERT INTO ${db.category} (name) VALUES (?);", [name]);

    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }

  //retrieve all data from table
  Future<List<Map<String, dynamic>>> fetch() async {
    await db.initDB();
    return await db.database.query(db.category);
  }

  // delete data from table
  Future<bool> delete(int id) async {
    await db.initDB();
    int result =
    await db.database.delete(db.category, where: 'id = ?', whereArgs: [id]);
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }
  //update data from table
  Future<bool> rename(String name, int id) async {
    await db.initDB();
    int result = await db.database.update(db.category, {"name": name},
        where: 'id = ?', whereArgs: [id]);
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }
}
