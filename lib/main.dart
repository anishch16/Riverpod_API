import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_practice1/providers/providers.dart';
import 'package:riverpod_practice1/views/profile_view.dart';

import 'views/demo_view.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(),
      ),
      themeMode: themeMode,
    );
  }

  final GoRouter _router = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => const DemoView()),
    GoRoute(path: "/profile", builder: (context, state) => const ProfileView()),
  ]);
}
