import 'package:creative_cave/core/errors/exceptions.dart';
import 'package:creative_cave/core/errors/failures.dart';
import 'package:creative_cave/core/utils/typedefs.dart';
import 'package:creative_cave/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:creative_cave/src/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:dartz/dartz.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  const OnBoardingRepoImpl(this._localDataSource);
  final OnBoardingLocalDataSource _localDataSource;

  @override
  ResultFuture<void> cacheFirstTimer() async {
    try {
      await _localDataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(
        CacheFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() async {
    try {
      final result = await _localDataSource.checkIfUserIsFirstTimer();
      return Right(result);
    } on CacheException catch (e) {
      return Left(
        CacheFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}
