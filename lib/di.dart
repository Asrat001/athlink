import 'package:athlink/routes/app_route.dart';
import 'package:athlink/shared/handlers/dio_client.dart';
import 'package:athlink/shared/services/internet_connection_service.dart';
import 'package:athlink/shared/services/local_storage_service.dart';
import 'package:athlink/shared/services/token_refreshe_service.dart';
import 'package:athlink/shared/utils/image_palette_util.dart';
import 'package:get_it/get_it.dart';
import 'features/auth/data/datasource/authentication_remote_data_source.dart';
import 'features/auth/data/repository/authentication_repository_impl.dart';
import 'features/auth/domain/repository/authentication_repository.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({String prefixBox = ''}) async {

  //helper class
  sl.registerSingleton<ImagePalette>(ImagePalette());
  sl.registerSingleton<DioHttpClient>(DioHttpClient());
  final localStorageService= LocalStorageService();
  sl.registerLazySingleton<LocalStorageService>(() => localStorageService);
  sl.registerSingleton<AppRouter>(AppRouter(localStorageService.getIsDoneOnboarding()));
  sl.registerSingleton<AppConnectivity>(AppConnectivity());
  sl.registerSingleton<TokenRefreshService>(TokenRefreshService());


  //data sources
  sl.registerSingleton<AuthenticationRemoteDataSource>(AuthenticationRemoteDataSource(sl<DioHttpClient>()));

  //repositories
  sl.registerSingleton<IAuthenticationRepository>(AuthenticationRepositoryImpl(remoteDataSource: sl<AuthenticationRemoteDataSource>()));



}