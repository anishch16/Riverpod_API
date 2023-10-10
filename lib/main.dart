import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_practice1/providers/providers.dart';
import 'package:riverpod_practice1/views/profile_view.dart';

import 'views/demo_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(ProviderScope(
      child: EasyLocalization(
          path: 'assets/translations',
          supportedLocales: const [Locale('en'), Locale('ne')],
          fallbackLocale: const Locale('en', 'US'),
          child: MyApp())));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      routerConfig: _router,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(),
      ),
      themeMode: themeMode,
    );
  }

  final GoRouter _router = GoRouter(routes: [
    GoRoute(path: "/main", builder: (context, state) => MyApp()),
    GoRoute(path: "/", builder: (context, state) => const DemoView()),
    GoRoute(path: "/profile", builder: (context, state) => const ProfileView()),
  ]);
}
