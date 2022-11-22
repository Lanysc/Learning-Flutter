import 'package:clean_architecture/src/modules/post/domain/entities/comment.dart';
import 'package:clean_architecture/src/modules/post/domain/entities/post.dart';
import 'package:fpdart/fpdart.dart';

import '../errors/errors.dart';

abstract class IPostRepository {
  Future<Either<IPostException, List<Post>>> getPosts();
  Future<Either<IPostException, List<Comment>>> getPostComments(
    String postId,
  );
}
