import 'package:athlink/core/services/socket_service.dart';
import 'package:athlink/features/athlete/home_screen/data/datasource/feed_remote_datasource.dart';
import 'package:athlink/features/athlete/home_screen/data/repository/feed_repository_impl.dart';
import 'package:athlink/features/athlete/home_screen/domain/repository/feed_repository.dart';
import 'package:athlink/features/sponsor/home_feed/data/datasource/feed_remote_datasource.dart';
import 'package:athlink/features/sponsor/home_feed/data/repository/feed_repository_impl.dart';
import 'package:athlink/features/sponsor/home_feed/domain/repository/feed_repository.dart';
import 'package:athlink/features/sponsor/manage/data/datasource/job_list_remote_datasource.dart';
import 'package:athlink/features/sponsor/manage/data/datasource/milestone_remote_datasource.dart';
import 'package:athlink/features/sponsor/manage/data/repository/job_list_repository_impl.dart';
import 'package:athlink/features/sponsor/manage/data/repository/milestone_repository_impl.dart';
import 'package:athlink/features/sponsor/manage/domain/repository/job_list_repository.dart';
import 'package:athlink/features/sponsor/manage/domain/repository/milestone_repository.dart';
import 'package:athlink/features/message/data/datasource/chat_remote_datasource.dart';
import 'package:athlink/features/message/data/repository/chat_repository_impl.dart';
import 'package:athlink/features/message/domain/repository/chat_repository.dart';
import 'package:athlink/features/sponsor/profile/data/datasource/job_post_remote_datasource.dart';
import 'package:athlink/features/sponsor/profile/data/datasource/profile_remote_datasource.dart';
import 'package:athlink/features/sponsor/profile/data/repository/job_post_repository_impl.dart';
import 'package:athlink/features/sponsor/profile/data/repository/profile_repository_impl.dart';
import 'package:athlink/features/sponsor/profile/domain/repository/job_post_repository.dart';
import 'package:athlink/features/sponsor/profile/domain/repository/profile_repository.dart';
import 'package:athlink/features/athlete/profile/data/datasource/athlete_profile_remote_data_source.dart';
import 'package:athlink/features/athlete/profile/data/repository/athlete_profile_repository_impl.dart';
import 'package:athlink/features/athlete/profile/domain/repository/athlet_profile_repository.dart';
import 'package:athlink/features/athlete/campaign/data/datasource/campaign_remote_data_source.dart';
import 'package:athlink/features/athlete/campaign/data/repository/campaign_repository_impl.dart';
import 'package:athlink/features/athlete/campaign/domain/repository/campaign_repository.dart';
import 'package:athlink/features/sports/data/datasource/sports_remote_data_source.dart';
import 'package:athlink/features/sports/domain/repository/sports_repository.dart';
import 'package:athlink/features/sponsor/watchlist/data/datasource/watchlist_remote_datasource.dart';
import 'package:athlink/features/sponsor/watchlist/data/repository/watchlist_repository_impl.dart';
import 'package:athlink/features/sponsor/watchlist/domain/repository/watchlist_repository.dart';
import 'package:athlink/routes/app_route.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/services/google_sign_in_service.dart';
import 'package:athlink/core/services/apple_sign_in_service.dart';
import 'package:athlink/core/services/internet_connection_service.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/core/services/token_refreshe_service.dart';
import 'package:athlink/shared/utils/image_palette_util.dart';
import 'package:get_it/get_it.dart';
import 'features/auth/data/datasource/authentication_remote_data_source.dart';
import 'features/auth/data/repository/authentication_repository_impl.dart';
import 'features/auth/domain/repository/authentication_repository.dart';
import 'features/sports/data/respository/sports_repository_impl.dart';
import 'features/notifications/data/datasource/notification_remote_datasource.dart';
import 'features/notifications/data/repository/notification_repository_impl.dart';
import 'features/notifications/domain/repository/notification_repository.dart';

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
  sl.registerSingleton<GoogleAuthService>(
    GoogleAuthService(sl<AppConnectivity>()),
  );
  sl.registerSingleton<AppleAuthService>(
    AppleAuthService(sl<AppConnectivity>()),
  );
  sl.registerSingleton<SocketIoService>(SocketIoService());

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
  sl.registerSingleton<AthleteFeedRemoteDataSource>(
    AthleteFeedRemoteDataSource(sl<DioHttpClient>()),
  );
  sl.registerSingleton<WatchlistRemoteDataSource>(
    WatchlistRemoteDataSource(sl<DioHttpClient>()),
  );
  sl.registerSingleton<JobListRemoteDataSource>(
    JobListRemoteDataSource(sl<DioHttpClient>()),
  );
  sl.registerSingleton<MilestoneRemoteDataSource>(
    MilestoneRemoteDataSource(sl<DioHttpClient>()),
  );
  sl.registerSingleton<ChatRemoteDataSource>(
    ChatRemoteDataSource(sl<DioHttpClient>()),
  );
  sl.registerSingleton<AthleteProfileRemoteDataSource>(
    AthleteProfileRemoteDataSource(sl<DioHttpClient>()),
  );
  sl.registerSingleton<CampaignRemoteDataSource>(
    CampaignRemoteDataSource(sl<DioHttpClient>()),
  );
  sl.registerSingleton<NotificationRemoteDataSource>(
    NotificationRemoteDataSource(sl<DioHttpClient>()),
  );

  //repositories
  sl.registerSingleton<IAuthenticationRepository>(
    AuthenticationRepositoryImpl(
      remoteDataSource: sl<AuthenticationRemoteDataSource>(),
      googleAuthService: sl<GoogleAuthService>(),
      appleAuthService: sl<AppleAuthService>(),
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
  sl.registerSingleton<AthleteFeedRepository>(
    AthleteFeedRepositoryImpl(sl<AthleteFeedRemoteDataSource>()),
  );
  sl.registerSingleton<WatchlistRepository>(
    WatchlistRepositoryImpl(sl<WatchlistRemoteDataSource>()),
  );
  sl.registerSingleton<JobListRepository>(
    JobListRepositoryImpl(sl<JobListRemoteDataSource>()),
  );
  sl.registerSingleton<MilestoneRepository>(
    MilestoneRepositoryImpl(sl<MilestoneRemoteDataSource>()),
  );
  sl.registerSingleton<ChatRepository>(
    ChatRepositoryImpl(sl<ChatRemoteDataSource>()),
  );
  sl.registerSingleton<AthletProfileRepository>(
    AthleteProfileRepositoryImpl(sl<AthleteProfileRemoteDataSource>()),
  );
  sl.registerSingleton<CampaignRepository>(
    CampaignRepositoryImpl(sl<CampaignRemoteDataSource>()),
  );
  sl.registerSingleton<NotificationRepository>(
    NotificationRepositoryImpl(sl<NotificationRemoteDataSource>()),
  );
}
