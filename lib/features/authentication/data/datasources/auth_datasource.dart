import 'package:hive/hive.dart';
import 'package:todo_bloc_clean_app/features/authentication/data/models/task_model.dart';
import '../models/user_model.dart';

class AuthDataSource {
  static const String _boxName = 'authBox';

  Future<Box<UserModel>> _openBox() async {
    return await Hive.openBox<UserModel>(_boxName);
  }

  Future<void> storeUser(UserModel user) async {
    final box = await _openBox();
    await box.put('user', user); 
  }

  Future<UserModel?> getUser() async {
    final box = await _openBox();

    return box.get('user');  
  }
   Future<void> logOutUser() async {
// await clearUser();
 final taskBox = await Hive.openBox<TaskModel>("task");
  await taskBox.clear();
  }


  Future<void> clearUser() async {
    final box = await _openBox();
    await box.delete('user');  
  }
}

