import 'package:clean_architecture/src/modules/post/domain/entities/comment.dart';
import 'package:clean_architecture/src/modules/post/domain/entities/user.dart';

class UserAdapter {
  UserAdapter._();

  static User fromJson(dynamic data) {
    return User(
      id: data['id'],
      name: data['name'],
      photo: data['photo'],
    );
  }
}
