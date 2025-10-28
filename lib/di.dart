import 'package:athlink/features/home_feed/data/datasource/feed_remote_datasource.dart';
import 'package:athlink/features/home_feed/data/repository/feed_repository_impl.dart';
import 'package:athlink/features/home_feed/domain/repository/feed_repository.dart';
import 'package:athlink/features/profile/data/datasource/job_post_remote_datasource.dart';
import 'package:athlink/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:athlink/features/profile/data/repository/job_post_repository_impl.dart';
import 'package:athlink/features/profile/data/repository/profile_repository_impl.dart';
import 'package:athlink/features/profile/domain/repository/job_post_repository.dart';
import 'package:athlink/features/profile/domain/repository/profile_repository.dart';
import 'package:athlink/features/sports/data/datasource/sports_remote_data_source.dart';
import 'package:athlink/features/sports/domain/repository/sports_repository.dart';
import 'package:athlink/features/watchlist/data/datasource/watchlist_remote_datasource.dart';
import 'package:athlink/features/watchlist/data/repository/watchlist_repository_impl.dart';
import 'package:athlink/features/watchlist/domain/repository/watchlist_repository.dart';
import 'package:athlink/routes/app_route.dart';
import 'package:athlink/shared/handlers/dio_client.dart';
import 'package:athlink/shared/services/google_sign_in_service.dart';
import 'package:athlink/shared/services/internet_connection_service.dart';
import 'package:athlink/shared/services/local_storage_service.dart';
import 'package:athlink/shared/services/token_refreshe_service.dart';
import 'package:athlink/shared/utils/image_palette_util.dart';
import 'package:get_it/get_it.dart';
import 'features/auth/data/datasource/authentication_remote_data_source.dart';
import 'features/auth/data/repository/authentication_repository_impl.dart';
import 'features/auth/domain/repository/authentication_repository.dart';
import 'features/sports/data/respository/sports_repository_impl.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({String prefixBox = ''}) async {
  //helper class
  sl.registerSingleton<ImagePalette>(ImagePalette());
  sl.registerSingleton<DioHttpClient>(DioHttpClient());
  final localStorageService = LocalStorageService();
  sl.registerLazySingleton<LocalStorageService>(() => localStorageService);
  sl.registerSingleton<AppRouter>(
    AppRouter(localStorageService.getIsDoneOnboarding()),
  );
  sl.registerSingleton<AppConnectivity>(AppConnectivity());
  sl.registerSingleton<TokenRefreshService>(TokenRefreshService());
  sl.registerSingleton<GoogleAuthService>(GoogleAuthService());

  //data sources
  sl.registerSingleton<AuthenticationRemoteDataSource>(
    AuthenticationRemoteDataSource(sl<DioHttpClient>()),
  );
  sl.registerSingleton<SportsRemoteDataSource>(
    SportsRemoteDataSource(sl<DioHttpClient>()),
  );
  sl.registerSingleton<ProfileRemoteDataSource>(
    ProfileRemoteDataSource(sl<DioHttpClient>()),
  );
  sl.registerSingleton<JobPostRemoteDataSource>(
    JobPostRemoteDataSource(sl<DioHttpClient>()),
  );
  sl.registerSingleton<FeedRemoteDataSource>(
    FeedRemoteDataSource(sl<DioHttpClient>()),
  );
  sl.registerSingleton<WatchlistRemoteDataSource>(
    WatchlistRemoteDataSource(sl<DioHttpClient>()),
  );

  //repositories
  sl.registerSingleton<IAuthenticationRepository>(
    AuthenticationRepositoryImpl(
      remoteDataSource: sl<AuthenticationRemoteDataSource>(),
      googleAuthService: sl<GoogleAuthService>(),
    ),
  );
  sl.registerSingleton<ISportsRepository>(
    SportsRepositoryImpl(remoteDataSource: sl<SportsRemoteDataSource>()),
  );
  sl.registerSingleton<ProfileRepository>(
    ProfileRepositoryImpl(sl<ProfileRemoteDataSource>()),
  );
  sl.registerSingleton<JobPostRepository>(
    JobPostRepositoryImpl(sl<JobPostRemoteDataSource>()),
  );
  sl.registerSingleton<FeedRepository>(
    FeedRepositoryImpl(sl<FeedRemoteDataSource>()),
  );
  sl.registerSingleton<WatchlistRepository>(
    WatchlistRepositoryImpl(sl<WatchlistRemoteDataSource>()),
  );
}
