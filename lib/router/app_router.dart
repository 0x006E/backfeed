import 'package:auto_route/auto_route.dart';
import 'package:backfeed/features/thoughts/thoughts_page.dart';
import 'package:backfeed/features/zen/zenmode_page.dart';
import 'package:backfeed/homepage.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          path: "/",
          page: HomeRoute.page,
          initial: true,
          children: [
            CustomRoute(
                path: "thoughts",
                page: ThoughtsRoute.page,
                transitionsBuilder: TransitionsBuilders.fadeIn,
                initial: true),
            CustomRoute(
              path: "zen",
              page: ZenModeRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
          ],
        )
      ];
}
