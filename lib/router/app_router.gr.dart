// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    ThoughtsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ThoughtsPage(),
      );
    },
    ZenModeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ZenModePage(),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ThoughtsPage]
class ThoughtsRoute extends PageRouteInfo<void> {
  const ThoughtsRoute({List<PageRouteInfo>? children})
      : super(
          ThoughtsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThoughtsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ZenModePage]
class ZenModeRoute extends PageRouteInfo<void> {
  const ZenModeRoute({List<PageRouteInfo>? children})
      : super(
          ZenModeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ZenModeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
