import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice1/providers/providers.dart';

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(localeProvider);
    return TextButton(
      onPressed: () {
        // ref.read(localeProvider.notifier).state = language == const Locale('en')
        //     ? const Locale('ne')
        //     : const Locale('en');
        if (context.locale.languageCode == 'en') {
          context.setLocale(const Locale('ne'));
        } else {
          context.setLocale(const Locale('en'));
        }
      },
      child: language == const Locale('en')
          ? const Text('Nepali')
          : const Text('अंग्रेजी'),
    );
  }
}
