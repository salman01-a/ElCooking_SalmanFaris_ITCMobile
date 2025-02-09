import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final String ingredients;
  final String steps;

  const Detail({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.ingredients,
    required this.steps,
  });

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resep ${widget.title}"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.image,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(widget.image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.description,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            const Text(
              "Bahan-bahan:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.ingredients,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "Langkah-langkah:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.steps,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
