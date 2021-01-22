import 'package:clean_architeture_tdd/core/error/failures.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTriviaRepository {
  //programação funcional, usa a falha e o sucesso na função com o pacote dartz
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
