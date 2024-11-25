import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId:1)
class UserModel extends HiveObject {
  @HiveField(0)
  final String? firstName;

  @HiveField(1)
  final String? password;

  @HiveField(2)
  final String? email; // Optional, used only for signup
 

    @HiveField(3)
  final String? lastName;

  UserModel({ 
     
    this.firstName,
    this.password,
    
    this.email,
    this.lastName
      });
}
