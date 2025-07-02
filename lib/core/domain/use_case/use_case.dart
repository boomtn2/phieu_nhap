abstract class UseCase<Input, Result> {
  Future<Result> call(Input input);
}

abstract class NoParamsUseCase<Result> {
  Future<Result> call();
}
