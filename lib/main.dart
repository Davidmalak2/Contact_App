import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:contact_app/view/screens/home_screen.dart';
import 'package:contact_app/core/routes/app_routes.dart';
import 'package:contact_app/view/screens/new_user_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ContactApp());
}
class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoute.Home,
      routes: {
        AppRoute.Home: (context) => HomeScreen(),
        AppRoute.AddContact: (context) => const NewContactScreen(),
        
      },

      
    );
  }
}
