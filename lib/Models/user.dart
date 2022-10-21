import 'package:hive_flutter/hive_flutter.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  final String userName;
  @HiveField(1)
  final String password;
  UserModel(this.password, this.userName);
}
