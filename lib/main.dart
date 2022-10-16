import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sara_flutter/auth_gate.dart';
import 'package:sara_flutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sara_flutter/home_screen.dart';
import 'package:sara_flutter/pages/playlist_screen.dart';

import 'package:sara_flutter/pages/songs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Sara Flutter App',
        debugShowCheckedModeBanner: false,
        home: const AuthGate(),
        getPages: [
          GetPage(name: '/', page: () => const HomeScreen()),
          GetPage(name: '/song', page: () => const MySongs()),
          GetPage(name: '/myplaylist', page: () => const MyPlaylist()),
        ]);
  }
}
