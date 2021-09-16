import './../services/services.dart';
import './../viewmodels/viewmodels.dart';
import './config.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

const bool USE_FAKE_IMPLEMENTATION = AppEnv.fakeData;

void setupLocator() {
  // Register services
  locator.registerLazySingleton<ApplicationApi>(() => USE_FAKE_IMPLEMENTATION ? FakeApplicationServices() : ApplicationService());
  locator.registerLazySingleton<PostApi>(() => USE_FAKE_IMPLEMENTATION ? FakePostServices() : PostService());
  locator.registerLazySingleton<AdviceApi>(() => USE_FAKE_IMPLEMENTATION ? FakeAdviceServices() : AdviceService());
  locator.registerLazySingleton<EventApi>(() => USE_FAKE_IMPLEMENTATION ? FakeEventServices() : EventService());
  locator.registerLazySingleton<CareerApi>(() => USE_FAKE_IMPLEMENTATION ? FakeCareerServices() : CareerService());
  locator.registerLazySingleton<RoleApi>(() => USE_FAKE_IMPLEMENTATION ? FakeRoleServices() : RoleService());
  locator.registerLazySingleton<FranchiseApi>(() => USE_FAKE_IMPLEMENTATION ? FakeFranchiseServices() : FranchiseService());
  locator.registerLazySingleton<ContactFormApi>(() => USE_FAKE_IMPLEMENTATION ? FakeContactFormServices() : ContactFormService());
  locator.registerLazySingleton<FeedApi>(() => USE_FAKE_IMPLEMENTATION ? FakeFeedServices() : FeedService());
  locator.registerLazySingleton<VideoApi>(() => USE_FAKE_IMPLEMENTATION ? FakeVideoServices() : VideoService());
  locator.registerLazySingleton<UserApi>(() => USE_FAKE_IMPLEMENTATION ? FakeUserServices() : UserService());
  locator.registerLazySingleton<JobApi>(() => USE_FAKE_IMPLEMENTATION ? FakeJobServices() : JobService());
  locator.registerLazySingleton<CommunityApi>(() => USE_FAKE_IMPLEMENTATION ? FakeCommunityServices() : CommunityService());

  // Register view models
  locator.registerFactory<IntroViewModel>(() => IntroViewModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<CommunityViewModel>(() => CommunityViewModel());
}
