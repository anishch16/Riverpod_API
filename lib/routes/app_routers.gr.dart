// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:riverpod_practice1/model/demo_model_user.dart' as _i5;
import 'package:riverpod_practice1/views/demo_view.dart' as _i1;
import 'package:riverpod_practice1/views/profile_view.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DemoView.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DemoView(),
      );
    },
    ProfileView.name: (routeData) {
      final args = routeData.argsAs<ProfileViewArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ProfileView(
          key: args.key,
          user: args.user,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.DemoView]
class DemoView extends _i3.PageRouteInfo<void> {
  const DemoView({List<_i3.PageRouteInfo>? children})
      : super(
          DemoView.name,
          initialChildren: children,
        );

  static const String name = 'DemoView';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ProfileView]
class ProfileView extends _i3.PageRouteInfo<ProfileViewArgs> {
  ProfileView({
    _i4.Key? key,
    required _i5.UserModel user,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ProfileView.name,
          args: ProfileViewArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileView';

  static const _i3.PageInfo<ProfileViewArgs> page =
      _i3.PageInfo<ProfileViewArgs>(name);
}

class ProfileViewArgs {
  const ProfileViewArgs({
    this.key,
    required this.user,
  });

  final _i4.Key? key;

  final _i5.UserModel user;

  @override
  String toString() {
    return 'ProfileViewArgs{key: $key, user: $user}';
  }
}
