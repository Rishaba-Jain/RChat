import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'ui/message_list.dart';
import '../data/message_dao.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // TODO: Add ChangeNotifierProvider<UserDao> here
        Provider<MessageDao>(
          lazy: false,
          create: (_) => MessageDao(),
        ),
      ],
      child: MaterialApp(
        title: 'RChat',
        theme: ThemeData(primaryColor: const Color(0xFF3D814A)),
        // TODO: Add Consumer<UserDao> here
        home: const MessageList(),
      ),
    );
  }
}
