import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footzone/providers/current_location.dart';
import 'package:footzone/providers/fields.dart';
import 'package:footzone/providers/markers.dart';
import 'package:footzone/screens/field/field_screen.dart';
import 'package:footzone/screens/map/map_screen.dart';
import 'package:google_fonts/google_fonts.dart';
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
        ChangeNotifierProvider<CurrentLocation>(
          create: ((context) => CurrentLocation()),
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
      Provider.of<CurrentLocation>(context, listen: false).getCurrentLocaton();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      title: 'FootZone',
      home: FieldPage(
        index: 0,
        distance: 3.5,
      ),
      routes: {
        // '/': ((context) => const HomePage()),
        MapPage.id: (context) => MapPage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        FieldPage.id: (context) => FieldPage(
              index: 0,
              distance: 3.5,
            ),
      },
    );
  }
}
