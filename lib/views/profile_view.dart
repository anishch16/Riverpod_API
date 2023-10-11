import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice1/model/demo_model_user.dart';
import 'package:riverpod_practice1/views/demo_view.dart';

import '../providers/providers.dart';

@RoutePage()
class ProfileView extends ConsumerWidget {
  const ProfileView({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('Profile View'),
        ),
      ),
      body: userData.when(
        data: (data) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  user.avatar,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Text(
                  tr('Your Profile Seems Good'),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => const DemoView()),
                    );
                  },
                  child: Text(
                    tr('Go back to main page'),
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
