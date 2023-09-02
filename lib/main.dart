import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:picasso_diary/firebase_options.dart';
import './view/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picasso Diary',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(useMaterial3: true),

      theme: ThemeData(
        fontFamily: 'Noto_Serif_KR',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,

      // home: const CreateDiary(title: 'Picasso Diary'),
      home: const Navigation(),
    );
  }
}
