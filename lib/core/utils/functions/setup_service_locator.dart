import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/data/repositories/home_repository_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  // getIt.registerSingleton<ApiService>(
  //   ApiService(
  //     Dio(),
  //   ),
  // );
  getIt.registerSingleton<HomeRepositoryImpl>(
    HomeRepositoryImpl(
      homeLocalDataSource: HomeLocalDataSourceImp(),
      homeRemoteDataSource: HomeRemoteDataSourceImp(
          // getIt.get<ApiService>(),
          ),
    ),
  );
}
