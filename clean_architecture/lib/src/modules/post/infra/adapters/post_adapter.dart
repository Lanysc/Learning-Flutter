import 'package:clean_architecture/src/modules/post/domain/entities/post.dart';
import 'package:clean_architecture/src/modules/post/infra/adapters/user_adapter.dart';

class PostAdapter {
  PostAdapter._();

  static Post fromJson(dynamic data) {
    return Post(
      id: data['id'],
      text: data['text'],
      totalComents: data['totalComents'],
      user: UserAdapter.fromJson(data['user']),
    );
  }
}
