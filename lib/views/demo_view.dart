import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_practice1/main.dart';

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

class DemoView extends ConsumerWidget {
  const DemoView({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greet = ref.watch(greetingProvider);
    final userData = ref.watch(userDataProvider);
    final theme = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Center(
                child: Text(
              'All Users Profile',
              style: TextStyle(color: Colors.black),
            )),
            actions: [
              IconButton(
                  onPressed: () {
                    ref.read(themeProvider.notifier).state =
                        theme == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                  },
                  icon: Icon(theme == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode)),
            ]),
        body: userData.when(
          data: (data) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(
                    right: 70,
                    left: 70,
                    top: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.network(
                          data[index].avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        data[index].firstname,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        'First name : ${data[index].firstname}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        'Last name : ${data[index].lastname}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        data[index].email,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {
                            GoRouter.of(context).go("/profile");
                          },
                          child: const Text(
                            'See More',
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                );
              },
              itemCount: data.length,
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
