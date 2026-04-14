import 'package:fpdart/fpdart.dart';

sealed class Failure {
  const Failure(this.message);
  final String message;
}

final class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}

typedef Result<T> = Either<Failure, T>;

extension ResultX<L, R> on Either<L, R> {
  R? getOrNull() => fold((_) => null, (r) => r);
  Either<L, B> mapRight<B>(B Function(R r) f) => map(f);
}

TaskEither<Failure, T> taskEitherFromFuture<T>(Future<T> Function() f) =>
    TaskEither.tryCatch(f, (err, _) => UnexpectedFailure(err.toString()));

Option<T> tryGetOption<T>(T Function() f) {
  try {
    return Some(f());
  } catch (_) {
    return const None();
  }
}
