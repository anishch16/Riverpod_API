import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice1/api_service.dart';

import 'model/demo_model_user.dart';

// final greetingProvider = Provider<String>((ref) => 'Hello');
// final counterProvider = StateProvider<int>((ref) => 0);
// final countProvider =
//     StateNotifierProvider<CountDemo, int>((ref) => CountDemo());
final apiProvider = Provider<ApiService>((ref) => ApiService());
final userDataProvider = FutureProvider<List<UserModel>>(
  (ref) {
    return ref.read(apiProvider).getUser();
  },
);

void main() {
  runApp(
    const ProviderScope(
      child: DemoView(),
    ),
  );
}

class DemoView extends ConsumerWidget {
  const DemoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    // final count = ref.watch(counterProvider);
    // final value = ref.watch(greetingProvider);
    // final counter = ref.watch(countProvider);

    // ref.listen(counterProvider, ((previous, next) {
    //   if (next == 10) {
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(SnackBar(content: Text('The value is $next')));
    //   }
    // }));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('User Data')),
        body: userData.when(
            data: (data) {
              return ListView.builder(
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(
                        "${data[index].firstname} ${data[index].lastname}"),
                    subtitle: Text(data[index].email),
                    leading: CircleAvatar(
                      child: Image.network(data[index].avatar),
                    ),
                  );
                }),
                itemCount: data.length,
              );
            },
            error: ((error, stackTree) => Text(error.toString())),
            loading: (() {
              return const Center(child: CircularProgressIndicator());
            })),
      ),
    );
  }
}

// class Main extends ConsumerStatefulWidget {
//   const Main({Key? key}) : super(key: key);
//
//   @override
//   _MainState createState() => _MainState();
// }

// class _MainState extends ConsumerState<Main> {
//   @override
//   void initState() {
//     super.initState();
//     final greeting = ref.read(greetingProvider);
//     log(greeting);
//   }

// @override
// Widget build(BuildContext context) {
//   final greeting = ref.watch(greetingProvider);
//   return MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Scaffold(
//         appBar: AppBar(title: const Text('Stateful Widget')),
//         body: Center(child: Text(greeting))),
//   );
// }
// }
