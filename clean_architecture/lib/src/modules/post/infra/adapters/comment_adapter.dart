import 'package:clean_architecture/src/modules/post/domain/entities/comment.dart';

class CommentAdapter {
  CommentAdapter._();

  static Comment fromJson(dynamic data) {
    return Comment(id: data['id'], text: data['text']);
  }
}
