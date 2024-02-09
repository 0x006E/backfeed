import 'package:backfeed/router/app_router.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;
void setupLocator() {
  locator.registerSingleton<AppRouter>(AppRouter());
}
