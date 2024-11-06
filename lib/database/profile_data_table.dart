import 'package:mulai_flutter_2/helper/database_helper.dart';
import 'package:mulai_flutter_2/views/profile/model/profile_model.dart';

class ProfileDataTable {
  Future<bool> create(ProfileModel profileModel) async {
    var dbClient = await DatabaseHelper.instance.database;
    var result = await dbClient.insert(
      'profile',
      profileModel.toJson(),
    );

    return result == 1 ? true : false;
  }

  Future<ProfileModel> read() async {
    var dbClient = await DatabaseHelper.instance.database;
    var result = await dbClient.rawQuery(
      'SELECT * FROM profile',
    );
    if (result.isNotEmpty) {
      return ProfileModel.fromJson(result.first);
    } else {
      return ProfileModel();
    }
  }

  Future<bool> update(ProfileModel profileModel) async {
    var dbClient = await DatabaseHelper.instance.database;
    var result = await dbClient.update(
      'profile',
      where: 'username = ?',
      whereArgs: [profileModel.username],
      profileModel.toJson(),
    );

    return result == 1 ? true : false;
  }

  Future<bool> delete(ProfileModel profileModel) async {
    var dbClient = await DatabaseHelper.instance.database;
    var result = await dbClient.delete(
      'profile',
      where: 'username = ?',
      whereArgs: [profileModel.username],
    );

    return result == 1 ? true : false;
  }
}
