import 'package:dartz/dartz.dart';
import 'package:flutter_ca_tdd/core/error/failures.dart';
import 'package:flutter_ca_tdd/core/error/usecases/usecase.dart';
import 'package:flutter_ca_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_ca_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_ca_tdd/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository implements NumberTriviaRepository {
  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    return Future.delayed(const Duration(seconds: 1),
        () => const Right(NumberTrivia(text: "test", number: 1)));
  }

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    return await Future.delayed(const Duration(seconds: 1),
        () => Right(NumberTrivia(text: "test", number: number)));
  }
}

void main() {
  late GetRandomNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late NumberTrivia tNumberTrivia;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
    tNumberTrivia = const NumberTrivia(text: "test", number: 1);
  });

  test(
    "should get trivia from repository",
    () async {
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(tNumberTrivia));
    },
  );
}
