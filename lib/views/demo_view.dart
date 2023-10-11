import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice1/views/profile_view.dart';

import '../providers/providers.dart';
import '../widgets/language_button.dart';
import '../widgets/theme_button.dart';

@RoutePage()
class DemoView extends ConsumerWidget {
  const DemoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    final designer = ref.watch(nameProvider);
    final counter = ref.watch(counterNotifierProvider);

    return Scaffold(
      appBar: AppBar(
          title: Text(
            tr('All Users Profile'),
          ),
          actions: const [
            Row(
              children: [
                LanguageButton(),
                ThemeButton(),
              ],
            ),
          ]),
      body: userData.when(
        data: (data) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
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
                            '${tr("First name : ")}${data[index].firstname}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            '${tr("Last name : ")}${data[index].lastname}',
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProfileView(user: data[index])),
                                );
                              },
                              child: Text(
                                tr('See More'),
                                style: const TextStyle(color: Colors.blue),
                              ))
                        ],
                      ),
                    );
                  },
                  itemCount: data.length,
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Text(counter.toString()),
                    TextButton(
                        onPressed: () {
                          ref
                              .read(counterNotifierProvider.notifier)
                              .increment();
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(fontSize: 20),
                        )),
                    TextButton(
                        onPressed: () {
                          ref
                              .read(counterNotifierProvider.notifier)
                              .decrement();
                        },
                        child: const Text(
                          '-',
                          style: TextStyle(fontSize: 20),
                        )),
                    Text(designer),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
            ],
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
