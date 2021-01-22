import 'package:clean_architeture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architeture_tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

//executa o teste
void main() {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test('should get trivia for the number from the repository', () async {
    //arrange - testa o número do tipo any do lado direito que é o resultado ao lado do Failure da função getConcreteNumber
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));

    //act - numero de teste
    final result = await usecase.execute(number: tNumber);

    //assert - resultado é o número da 'direita'? checa se é igual o número do teste e o da classe getConcreteNumberTrivia
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
