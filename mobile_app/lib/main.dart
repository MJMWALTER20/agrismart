import 'package:flutter/material.dart';
import 'screens/otp_screen.dart';
import 'screens/create_listing_screen.dart';
import 'screens/listings_screen.dart';

void main() {
  runApp(const AgriSmartApp());
}
routes: {
  "/createListing": (_) => const CreateListingScreen(),
  "/listings": (_) => const ListingsScreen(),
},

class AgriSmartApp extends StatelessWidget {
  const AgriSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriSmart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const OtpScreen(),
    );
  }
}
