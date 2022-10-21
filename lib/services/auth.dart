import 'package:hive_flutter/adapters.dart';

import '../Models/user.dart';

class AuthServices {
  late Box<UserModel> users;
  Future<void> init() async {
    Hive.registerAdapter(UserModelAdapter());
    users = await Hive.openBox<UserModel>("usersBox");
  }

  Future<String?> authUser({required String username, password}) async {
    var success = users.values.any(
      (element) => element.userName == username && element.password == password,
    );
    if (success) {
      return username;
    } else {
      return null;
    }
  }
}
