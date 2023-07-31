import 'package:dartz/dartz.dart';
import 'package:flutter_ca_tdd/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
