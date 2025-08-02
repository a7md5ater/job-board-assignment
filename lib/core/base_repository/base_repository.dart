import 'package:dartz/dartz.dart';
import '../failures/failures.dart';
import '../network/network_info.dart';

mixin BaseRepositoryMixin {
  NetworkInfo get networkInfo;

  Future<Either<Failure, T>> handleApiCall<T>({
    required Future<T> Function() apiCall,
  }) async {
    if (await networkInfo.connected()) {
      try {
        final result = await apiCall();
        return Right(result);
      } on CacheFailure catch (error) {
        print("CACHE ERROR ============> ${error.toString()}");
        return Left(error);
      } catch (error) {
        print("ERROR ============> ${error.toString()}");
        return Left(ServerFailure(error: error));
      }
    } else {
      return Left(ServerFailure(error: NoInternetConnection()));
    }
  }
}
