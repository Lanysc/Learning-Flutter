import 'package:clean_architecture/src/modules/post/domain/entities/post.dart';
import 'package:clean_architecture/src/modules/post/domain/errors/errors.dart';
import 'package:clean_architecture/src/modules/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class IGetPosts {
  Future<Either<IPostException, List<Post>>> call();
}

class GetPosts implements IGetPosts {
  final IPostRepository repository;

  GetPosts(this.repository);

  @override
  Future<Either<IPostException, List<Post>>> call() async {
    return await repository.getPosts();
  }
}
