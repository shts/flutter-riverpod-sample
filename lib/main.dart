import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodsample/api_service.dart';

import 'user.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'RiverPod Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulHookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

/// ユーザーを作成する
final userCreateProvider =
    FutureProvider.autoDispose.family<void, String>((ref, name) async {
  print("fetch userCreateProvider");
  await ref.watch(apiServiceProvider).createUser(User(name, 0));
});

/// ユーザーを作成した後にユーザーリストを更新する
final userCreateAndFetchProvider =
    Provider.autoDispose.family<void, String>((ref, name) {
  print("fetch userCreateAndFetchProvider");
  ref
      .watch(userCreateProvider(name))
      .whenData((value) => {ref.refresh(usersProvider)});
});

/// ユーザーリストを取得する
final usersProvider = FutureProvider<List<User>>((ref) async {
  print("fetch usersProvider");
  return await ref.watch(apiServiceProvider).getUsers();
});

/// ユーザーリストの数を取得する
final usersLengthProvider = Provider((ref) {
  print("fetch usersLengthProvider");
  return ref.watch(usersProvider).value?.length ?? 0;
});

class _MyHomePageState extends ConsumerState<MyHomePage> {
  // name のcontrollerをStateProviderで定義する
  final _nameControllerStateProvider = StateProvider.autoDispose((ref) {
    return TextEditingController(text: '');
  });

  onTapButton(String name) {
    print("onTapButton: ${name}");
    if (name.isEmpty) {
      print("but is empty");
      return;
    }
    print("exec");
    ref.watch(userCreateAndFetchProvider(name));
  }

  Widget _buildBody() {
    final length = ref.watch(usersLengthProvider);
    if (length == 0) {
      return const Text("読み込み中");
    } else {
      return Text("Users.length:: ${ref.watch(usersLengthProvider)}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailController = ref.watch(_nameControllerStateProvider);

    print("build()");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBody(),
            TextFormField(controller: emailController),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onTapButton(emailController.text);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
