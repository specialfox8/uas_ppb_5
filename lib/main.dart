import 'package:uas_ppb_5/providers/auth_provider.dart' as auth;
import 'package:uas_ppb_5/providers/product_provider.dart';
import 'package:uas_ppb_5/screens/cart_screen.dart';
import 'package:uas_ppb_5/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_ppb_5/screens/menu_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<auth.AuthProvider>(
          create: (_) => auth.AuthProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MenuScreen(),
    );
  }
}
