import 'package:flutter_ca_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_ca_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: "Test Text");

  test(
    "should be a subclass of NumberTrivia entity",
    () async {
      // arrange

      // act

      // assert
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );
}
