import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocka/logic/bloc/login_bloc.dart';
import 'package:mocka/presentation/screens/login_screen.dart';
import 'package:mocka/presentation/widgets/profile_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8E0D0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFB3774E), width: 2),
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(''),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Jolly Roger',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6F4E37),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'jollyroger@sea.com',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileStatColumn(label: 'Orders', value: '12'),
                ProfileStatColumn(label: 'Points', value: '350'),
                ProfileStatColumn(label: 'Vouchers', value: '2'),
              ],
            ),
            const SizedBox(height: 32),
            const ProfileSettingsItem(
              icon: Icons.person_outline,
              title: 'Edit Profile',
            ),
            const ProfileSettingsItem(
              icon: Icons.location_on_outlined,
              title: 'Saved Addresses',
            ),
            const ProfileSettingsItem(
              icon: Icons.payment_outlined,
              title: 'Payment Methods',
            ),
            const ProfileSettingsItem(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
            ),
            const ProfileSettingsItem(
              icon: Icons.help_outline,
              title: 'Help & Support',
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(LogOutRequired());
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
