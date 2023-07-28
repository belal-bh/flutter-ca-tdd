import 'package:dartz/dartz.dart';
import 'package:flutter_ca_tdd/core/error/failures.dart';
import 'package:flutter_ca_tdd/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
