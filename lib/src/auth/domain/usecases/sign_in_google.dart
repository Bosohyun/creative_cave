import 'package:creative_cave/core/usecases/usecases.dart';
import 'package:creative_cave/core/utils/typedefs.dart';
import 'package:creative_cave/src/auth/domain/entities/user.dart';
import 'package:creative_cave/src/auth/domain/repos/auth_repo.dart';

class SignInGoogle extends FutureUsecaseWithoutParams<LocalUser> {
  const SignInGoogle(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<LocalUser> call() => _repo.signInWithGoogle();
}
