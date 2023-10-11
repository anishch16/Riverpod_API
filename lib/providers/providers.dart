import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/demo_model_user.dart';
import '../services/api_service.dart';

part 'providers.g.dart';

final greetingProvider = Provider<String>((ref) => 'Hello');
final counterProvider = StateProvider<int>((ref) => 0);

final apiProvider = Provider<ApiService>((ref) => ApiService());

final userDataProvider = FutureProvider<List<UserModel>>(
  (ref) {
    return ref.read(apiProvider).getUser();
  },
);
// final nameProvider = Provider<String>((ref) => 'Designed by: Anish');

final themeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.dark;
});

final localeProvider = StateProvider<Locale>((ref) {
  return const Locale('en');
});

@riverpod
String name(NameRef ref) {
  return tr('Designed by: Anish');
}
