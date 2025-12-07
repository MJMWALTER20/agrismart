import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'home_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  bool otpSent = false;
  String infoMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AgriSmart - OTP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Numéro de téléphone",
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                hintText: "+228 90 00 00 00",
              ),
            ),

            const SizedBox(height: 25),

            if (otpSent) ...[
              const Text(
                "Entrez le code OTP",
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: otpController,
                decoration: const InputDecoration(
                  hintText: "1234",
                ),
              ),
            ],

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                if (!otpSent) {
                  String msg = await ApiService.sendOtp(phoneController.text);
                  setState(() {
                    infoMessage = msg;
                    otpSent = true;
                  });
                } else {
                  String msg = await ApiService.verifyOtp(
                      phoneController.text, otpController.text);

                  if (msg.contains("USER_ID")) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomeScreen(phone: phoneController.text),
                      ),
                    );
                  } else {
                    setState(() => infoMessage = msg);
                  }
                }
              },
              child: Text(otpSent ? "Vérifier OTP" : "Envoyer OTP"),
            ),

            const SizedBox(height: 20),

            Text(
              infoMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
