import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return IconButton(
        onPressed: () {
          ref.read(themeProvider.notifier).state =
              theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
        },
        icon:
            Icon(theme == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode));
  }
}
