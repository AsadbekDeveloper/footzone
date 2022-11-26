import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footzone/providers/fields.dart';
import 'package:footzone/providers/markers.dart';
import 'package:footzone/screens/map/map_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/register/login_screen.dart';
import 'screens/register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Fields>(
          create: ((context) => Fields()),
        ),
        ChangeNotifierProvider<Markers>(
          create: ((context) => Markers()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Fields>(context, listen: false).initialFire();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FootZone',
              routes: {
          '/': ((context) => const HomePage()),
          MapPage.id: (context) => MapPage(),
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
        },

    );
  }
}
