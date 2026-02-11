import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mocka/data/data_providers/secure_storage.dart';
import 'package:mocka/data/repositories/auth_repository.dart';
import 'package:mocka/logic/bloc/login_bloc.dart';
import 'package:mocka/presentation/screens/login_screen.dart';

void main() {
  runApp(const MockaApp());
}

class MockaApp extends StatelessWidget {
  const MockaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(secureStorage: SecureStorage()),
      child: BlocProvider(
        create: (context) =>
            LoginBloc(authRepository: context.read<AuthRepository>()),
        child: MaterialApp(
          title: 'Mocka GDG Workshop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade600),
            secondaryHeaderColor: Colors.brown.shade600,
            scaffoldBackgroundColor: const Color(0xFFF8E0D0),
            cardColor: Colors.brown.withOpacity(0.15),
            unselectedWidgetColor: Colors.grey[400],

            bottomAppBarTheme: BottomAppBarThemeData(
              color: Colors.white.withOpacity(0.15),
            ),

            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
