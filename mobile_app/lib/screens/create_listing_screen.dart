import 'package:flutter/material.dart';
import '../services/listing_service.dart';

class CreateListingScreen extends StatefulWidget {
  const CreateListingScreen({super.key});

  @override
  State<CreateListingScreen> createState() => _CreateListingScreenState();
}

class _CreateListingScreenState extends State<CreateListingScreen> {
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();

  String category = "general";

  bool isLoading = false;

  void submit() async {
    setState(() => isLoading = true);

    final ok = await ListingService.createListing(
      phone: phoneCtrl.text.trim(),
      title: titleCtrl.text.trim(),
      description: descCtrl.text.trim(),
      price: double.tryParse(priceCtrl.text.trim()) ?? 0,
      category: category,
    );

    setState(() => isLoading = false);

    if (ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Annonce créée avec succès !"))
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erreur lors de la création"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Créer une annonce")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: phoneCtrl,
              decoration: const InputDecoration(labelText: "Votre numéro"),
            ),
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: "Titre"),
            ),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(labelText: "Description"),
              maxLines: 3,
            ),
            TextField(
              controller: priceCtrl,
              decoration: const InputDecoration(labelText: "Prix"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: category,
              onChanged: (v) => setState(() => category = v!),
              items: const [
                DropdownMenuItem(value: "general", child: Text("Général")),
                DropdownMenuItem(value: "cereale", child: Text("Céréale")),
                DropdownMenuItem(value: "engrais", child: Text("Engrais")),
                DropdownMenuItem(value: "materiel", child: Text("Matériel agricole")),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : submit,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Publier"),
            )
          ],
        ),
      ),
    );
  }
}
