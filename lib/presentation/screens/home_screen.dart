import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocka/logic/bloc/login_bloc.dart';
import 'package:mocka/presentation/screens/cafes_screen.dart';
import 'package:mocka/presentation/screens/login_screen.dart';
import 'package:mocka/presentation/screens/profile_screen.dart';

import '../widgets/coffee_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> coffeeList = const [
    {
      'name': 'Americano',
      'price': 'sh.120',
      'image': 'assets/images/coffee_1.jpg',
    },
    {
      'name': 'Macchiato',
      'price': 'sh.160',
      'image': 'assets/images/coffee_2.jpg',
    },
    {
      'name': 'Flat White',
      'price': 'sh.180',
      'image': 'assets/images/coffee_3.jpg',
    },
    {
      'name': 'Affogato',
      'price': 'sh.250',
      'image': 'assets/images/coffee_4.jpg',
    },
    {
      'name': 'Cold Brew',
      'price': 'sh.220',
      'image': 'assets/images/coffee_5.jpg',
    },
    {
      'name': 'Irish Coffee',
      'price': 'sh.300',
      'image': 'assets/images/coffe_6.jpg',
    },
    {
      'name': 'Cortado',
      'price': 'sh.140',
      'image': 'assets/images/coffee_7.jpg',
    },
    {
      'name': 'Caramel Frappe',
      'price': 'sh.280',
      'image': 'assets/images/coffee_8.jpg',
    },
    {
      'name': 'Turkish Coffee',
      'price': 'sh.130',
      'image': 'assets/images/coffee_9.jpg',
    },
    {
      'name': 'Vietnamese Coffee',
      'price': 'sh.190',
      'image': 'assets/images/coffee_10.jpg',
    },
    {
      'name': 'Red Eye',
      'price': 'sh.170',
      'image': 'assets/images/coffee_11.jpg',
    },
    {
      'name': 'Mocha Latte',
      'price': 'sh.210',
      'image': 'assets/images/coffee_12.jpg',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mocka Menu'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Color(0xFF6F4E37)),
            onPressed: () {
              context.read<LoginBloc>().add(LogOutRequired());
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF8E0D0),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: coffeeList.length,
              itemBuilder: (context, index) {
                final coffee = coffeeList[index];
                return CoffeeCard(
                  name: coffee['name']!,
                  price: coffee['price']!,
                  imagePath: coffee['image']!,
                );
              },
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.coffee, size: 64, color: Color(0xFF6F4E37)),
                SizedBox(height: 16),
                Text(
                  'Brew Screen',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6F4E37),
                  ),
                ),
                Text('Coming Soon!'),
              ],
            ),
          ),
          const CafesScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF6F4E37),
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.coffee), label: 'Brew'),
          BottomNavigationBarItem(icon: Icon(Icons.local_cafe), label: 'Cafes'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
