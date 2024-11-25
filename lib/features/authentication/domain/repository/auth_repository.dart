 

import '../entity/user_entity.dart';

abstract class AuthRepository {
  Future<bool> login(User user);
    Future<bool>register(User user);
  Future<User?> getUser();
  Future<void> logout();
}
