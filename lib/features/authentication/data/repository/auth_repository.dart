import 'package:kinzy_todo_app/features/authentication/data/datasources/auth_datasource.dart';
import 'package:kinzy_todo_app/features/authentication/data/models/user_model.dart';
import 'package:kinzy_todo_app/features/authentication/domain/entity/user_entity.dart';
import 'package:kinzy_todo_app/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<bool> register(User user) async {
    try {
      final userModel = UserModel(email: user.email, password: user.password,firstName: user.firstName,lastName: user.lastName);
      await authDataSource.storeUser(userModel);  // Save the user for registration
      
      return true;
    } catch (e) { 
      rethrow;   
    }
  }

  @override
  Future<bool> login(User user) async {
    try {
       
      final userModel = await authDataSource.getUser(); 
     
      if (userModel != null && userModel.email == user.email && userModel.password == user.password) {
      return true;
      } else { 
        return false;
      }
    } catch (e) { 
      rethrow;   
    }
  }

  @override
  Future<void> logout() async {
    try {
      await authDataSource.logOutUser();   
    } catch (e) { 
      rethrow;  
    }
  }

  @override
  Future<User?> getUser() async {
    try {
      final userModel = await authDataSource.getUser();
      if (userModel != null) {
        return User(email: userModel.firstName, password: userModel.password);
      }
      return null;
    } catch (e) { 
      return null;
    }
  }
}
