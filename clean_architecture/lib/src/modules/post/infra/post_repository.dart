// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture/src/modules/post/infra/adapters/comment_adapter.dart';
import 'package:fpdart/src/either.dart';

import 'package:clean_architecture/src/modules/post/domain/entities/comment.dart';
import 'package:clean_architecture/src/modules/post/domain/entities/post.dart';
import 'package:clean_architecture/src/modules/post/domain/errors/errors.dart';
import 'package:clean_architecture/src/modules/post/domain/repositories/post_repository.dart';
import 'package:clean_architecture/src/modules/post/infra/datasources/comment_datasource.dart';
import 'package:clean_architecture/src/modules/post/infra/datasources/post_datasource.dart';
import 'package:clean_architecture/src/modules/post/infra/datasources/user_datasource.dart';

class PostRepository extends IPostRepository {
  final UserDatasource userDatasource;
  final PostDatasource postDatasource;
  final CommentDatasource commentDatasource;

  PostRepository({
    required this.userDatasource,
    required this.postDatasource,
    required this.commentDatasource,
  });

  @override
  Future<Either<IPostException, List<Comment>>> getPostComments(
      String postId) async {
    try {
      final list = await commentDatasource.getComments();

      final comment = list
          .where(
            (element) => element['postId'] == postId,
          )
          .map(CommentAdapter.fromJson)
          .toList();
      return right(comment);
    } on IPostException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<IPostException, List<Post>>> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }
}
