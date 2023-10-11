import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../views/demo_view.dart';

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final language = ref.watch(localeProvider);
    void changeLanguage() {
      if (context.locale.languageCode == 'en') {
        context.setLocale(const Locale('ne'));
      } else {
        context.setLocale(const Locale('en'));
      }
      Navigator.pop(
        context,
        MaterialPageRoute(builder: (context) => DemoView()),
      );
    }

    return TextButton(
      onPressed: changeLanguage,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Text(
          tr('Language'),
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
