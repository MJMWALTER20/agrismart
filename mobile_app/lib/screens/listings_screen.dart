import 'package:flutter/material.dart';
import '../services/listing_service.dart';

class ListingsScreen extends StatefulWidget {
  const ListingsScreen({super.key});

  @override
  State<ListingsScreen> createState() => _ListingsScreenState();
}

class _ListingsScreenState extends State<ListingsScreen> {
  List<dynamic> listings = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadListings();
  }

  void loadListings() async {
    final data = await ListingService.getListings();
    setState(() {
      listings = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Annonces")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: listings.length,
              itemBuilder: (context, i) {
                final item = listings[i];

                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(item["title"] ?? "Sans titre"),
                    subtitle: Text(item["description"] ?? ""),
                    trailing: Text("${item["price"]} FCFA"),
                  ),
                );
              },
            ),
    );
  }
}
