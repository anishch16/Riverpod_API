import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        if (context.locale.languageCode == 'en') {
          GoRouter.of(context).go("/main");
          context.setLocale(const Locale('ne'));
        } else {
          GoRouter.of(context).go("/main");
          context.setLocale(const Locale('en'));
        }
      },
      child: context.locale.languageCode == 'en'
          ? const Text('Nepali')
          : const Text('English'),
    );
  }
}
