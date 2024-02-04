import 'package:creative_cave/core/usecases/usecases.dart';
import 'package:creative_cave/core/utils/typedefs.dart';
import 'package:creative_cave/src/auth/domain/repos/auth_repo.dart';

class ForgotPassword extends FutureUsecaseWithParams<void, String> {
  const ForgotPassword(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(String params) => _repo.forgotPassword(params);
}
