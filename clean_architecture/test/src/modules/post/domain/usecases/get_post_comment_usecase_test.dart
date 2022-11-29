import 'package:clean_architecture/src/modules/post/domain/entities/comment.dart';
import 'package:clean_architecture/src/modules/post/domain/errors/errors.dart';
import 'package:clean_architecture/src/modules/post/domain/repositories/post_repository.dart';
import 'package:clean_architecture/src/modules/post/domain/usecases/get_post_comment_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class PostRepositoryMock extends Mock implements IPostRepository {}

void main() {
  final repository = PostRepositoryMock();
  final usecase = GetPostComment(repository);

  test('Deve retornar uma lista de comentarios', () async {
    when(() => repository.getPostComments('1'))
        .thenAnswer((_) async => right([]));
    final result = await usecase('1');

    expect(result.fold(id, id), isA<List<Comment>>());
  });

  test('Deve retornar um ArgumentsException se o parâmetro for vazio',
      () async {
    final result = await usecase('');

    expect(result.fold(id, id), isA<ArgumentsException>());
  });
}
