// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture/src/modules/post/domain/entities/user.dart';

class Post {
  final String id;
  final User user;
  final String text;
  final int totalComents;

  Post({
    required this.id,
    required this.user,
    required this.text,
    required this.totalComents,
  });
}
