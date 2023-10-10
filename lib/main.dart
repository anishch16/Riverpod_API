import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice1/providers/providers.dart';
import 'package:riverpod_practice1/views/demo_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('en'), Locale('ne')],
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(),
      ),
      themeMode: themeMode,
      home: const DemoView(),
    );
  }
}
