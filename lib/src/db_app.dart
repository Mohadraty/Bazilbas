// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// class AppDB {
//   static Database? database;

//   static Future createDatabase() async {
//     await openDatabase(
//       'bazilbas.db',
//       version: 1,
//       onCreate: (database, version) async {
//         print('database created');

//         await database
//             .execute(
//                 'CREATE TABLE products(product_id TEXT , product_code TEXT, product_title TEXT, product_subtitle TEXT, product_images TEXT, product_price TEXT, product_quota TEXT,  product_isHot TEXT, product_category TEXT,  product_dateCreated TEXT,  product_dateModified TEXT,  product_dateDeleted TEXT)')
//             .then((value) {
//           print('table created');
//         }).catchError((error) {
//           print('Error Table ${error.toString()}');
//         });
//       },
//     ).then((value) async {
//       database = value;
//     });
//   }

//   // void getDatabase(database) {
//   //   database.rawQuery('SELECT * FROM data').then((value) {
//   //     data = value;
//   //     print(data);
//   //     emit(AppGetDatabaseState());
//   //   });
//   // }

//   // void updateDatabase(
//   //     {required String name,
//   //     required amount,
//   //     required String code,
//   //     required String price,
//   //     required int id}) {
//   //   database?.rawUpdate(
//   //       'UPDATE data SET name = ?, amount = ?, code = ?, price = ? WHERE id = ?',
//   //       [name, amount, code, price, id]).then((value) {
//   //     getDatabase(database);
//   //     emit(AppUpdateDatabase());
//   //   }).catchError((onError) {
//   //     print(onError.toString());
//   //   });
//   // }

//   // void deleteDatabase({required int id}) async {
//   //   database?.rawDelete('DELETE FROM data WHERE id = ?', [id]).then((value) {
//   //     getDatabase(database);
//   //     emit(AppDeleteDatabase());
//   //   });
//   // }

//   // Future<Map?> getItemByCode(String code) async {
//   //   List<Map> result =
//   //       await database?.rawQuery('SELECT * FROM data WHERE code = ?', [code]) ??
//   //           [];
//   //   if (result.isNotEmpty) {
//   //     return result.first;
//   //   }
//   //   return null;
//   // }

//   // void updateQuantity(String code, int amount, String discount) {
//   //   var date = DateFormat('yyyy-MM-dd').format(DateTime.now());
//   //   database?.rawUpdate(
//   //     'UPDATE data SET amount = amount - ?, date = ?, discount = ? WHERE code = ?',
//   //     [amount, date, discount, code],
//   //   ).then((value) {
//   //     getDatabase(database);
//   //     emit(AppUpdateDatabase());
//   //   }).catchError((onError) {
//   //     print(onError.toString());
//   //   });
//   // }

//   // Future<List<Map>> getSalesByDate(String date) async {
//   //   return await database
//   //           ?.rawQuery('SELECT * FROM data WHERE date = ?', [date]) ??
//   //       [];
//   // }
// }
