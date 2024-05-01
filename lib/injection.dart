import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> loadInjection() async {
  sl.registerLazySingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );

  await sl.isReady<SharedPreferences>();
}
