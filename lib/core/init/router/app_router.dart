// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
//
// ignore_for_file: unused_import

import 'package:agok_app/features/home/view/home_screen.dart';
import 'package:agok_app/features/login/view/login_screen.dart';
import 'package:agok_app/features/profile/view/profile_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, path: '/home', initial: true),
    AutoRoute(page: ProfileScreen, path: '/profile'),
    AutoRoute(page: LoginScreen, path: '/login'),
  ],
)
class AppRouter extends _$AppRouter {}
