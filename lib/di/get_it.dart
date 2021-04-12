import 'package:akilah/data/core/api_client.dart';
import 'package:akilah/data/datasources/user_remote_data_source.dart';
import 'package:akilah/data/repositories/user_repository_impl.dart';
import 'package:akilah/domain/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init(){
  getItInstance.registerLazySingleton<APIClient>(() => APIClient());
  getItInstance.registerLazySingleton<UserRemoteDataSource>(
          () => UserRemoteDataSourceImpl(client: getItInstance()));
  getItInstance.registerLazySingleton<UserRepository>(
          () => UserRepositoryImpl(dataSource: getItInstance()));
}