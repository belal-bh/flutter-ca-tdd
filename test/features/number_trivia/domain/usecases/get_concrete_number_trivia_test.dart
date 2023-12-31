import 'package:dartz/dartz.dart';
import 'package:flutter_ca_tdd/core/error/failures.dart';
import 'package:flutter_ca_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_ca_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_ca_tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
// import "package:mockito/mockito.dart";

//! Bad Mock
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

//! Does not work with Mock Need to check later
// class MockNumberTriviaRepository extends Mock
//     implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late int tNumber;
  late NumberTrivia tNumberTrivia;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
    tNumber = 1;
    tNumberTrivia = const NumberTrivia(text: "test", number: 1);
  });

  test(
    "should get trivia for the number from repository",
    () async {
      // arrange
      //! Need when use mockito
      // when(mockNumberTriviaRepository.getConcreteNumberTrivia(1))
      //     .thenAnswer((realInvocation) async => Right(tNumberTrivia));
      // act
      final result = await usecase(Params(number: tNumber));
      // assert
      expect(result, Right(tNumberTrivia));
    },
  );
}
