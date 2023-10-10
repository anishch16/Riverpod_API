import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/demo_model_user.dart';
import '../services/api_service.dart';

final greetingProvider = Provider<String>((ref) => 'Hello');
final counterProvider = StateProvider<int>((ref) => 0);

final apiProvider = Provider<ApiService>((ref) => ApiService());

final userDataProvider = FutureProvider<List<UserModel>>(
  (ref) {
    return ref.read(apiProvider).getUser();
  },
);
final themeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.dark;
});
