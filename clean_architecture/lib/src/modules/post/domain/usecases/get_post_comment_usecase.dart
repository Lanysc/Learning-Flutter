import 'package:clean_architecture/src/modules/post/domain/entities/comment.dart';
import 'package:clean_architecture/src/modules/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../errors/errors.dart';

abstract class IGetPostComment {
  Future<Either<IPostException, List<Comment>>> call(String PostId);
}

class GetPostComment implements IGetPostComment {
  final IPostRepository repository;

  GetPostComment(
    this.repository,
  );
  @override
  Future<Either<IPostException, List<Comment>>> call(String postId) async {
    if (postId.isEmpty) {
      return left(const ArgumentsException('postId is empty'));
    }

    return await repository.getPostComments(postId);
  }
}
