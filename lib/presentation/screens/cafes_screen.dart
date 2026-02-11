import 'package:flutter/material.dart';

class CafesScreen extends StatelessWidget {
  const CafesScreen({super.key});

  final List<Map<String, dynamic>> cafeList = const [
    {
      'name': 'The Daily Grind',
      'location': 'Westlands, Nairobi',
      'rating': 4.5,
      'image': 'assets/images/coffee_1.jpg',
    },
    {
      'name': 'Aroma Mocha',
      'location': 'Nyali, Mombasa',
      'rating': 4.8,
      'image': 'assets/images/coffee_2.jpg',
    },
    {
      'name': 'Sip & Serenity',
      'location': 'Milimani, Kisumu',
      'rating': 4.2,
      'image': 'assets/images/coffee_3.jpg',
    },
    {
      'name': 'The Busy Bean',
      'location': 'Karen, Nairobi',
      'rating': 4.6,
      'image': 'assets/images/coffee_4.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a Cafe'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF8E0D0),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: cafeList.length,
        itemBuilder: (context, index) {
          final cafe = cafeList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    cafe['image'],
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 150,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.local_cafe,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cafe['name'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6F4E37),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        cafe['location'],
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            cafe['rating'].toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
