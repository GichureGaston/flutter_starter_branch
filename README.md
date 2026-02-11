Markdown

# Mocka: Coffee Selection App (Starter Branch)

Welcome to the Mocka workshop. I have designed this starter template to give us a solid foundation. You will find the project structure, dependencies, and asset configurations already in place so we can focus entirely on implementation.

---

## My Objectives for You

1. **Secure Local Persistence**: I want you to implement secure storage for user credentials using `flutter_secure_storage`.
2. **Business Logic**: We will build a `LoginBloc` together to handle authentication states and manage artificial processing delays.
3. **UI Development**: I will guide you through creating a responsive 2-column coffee menu grid using modern Glassmorphism techniques.

---

## How I've Structured the Project

I have organized the repository following Clean Architecture principles. Please stick to these folders as we build:

```text
lib/
├── data/
│   ├── data_providers/   # Low-level storage logic (SecureStorage)
│   └── repositories/     # Data abstraction (AuthRepository)
├── logic/
│   └── bloc/             # BLoC implementation (Events, States, Bloc)
└── presentation/
    ├── screens/          # Main UI pages
    └── widgets/          # Reusable UI components

Getting Started
1. Environment Check

Before we start, ensure your environment matches mine:

    Flutter SDK: 3.27.0 or higher

    Dart SDK: 3.6.0 or higher

2. Installation

First, I need you to run this command in your terminal to fetch our packages:
Bash

flutter pub get

3. Assets

I have already added the coffee images and icons in the assets/ folder and registered them in the pubspec.yaml file for you.
Your Todo List for Today
Phase 1: The Data Layer

    [ ] Complete the AuthRepository so it can talk to SecureStorage.

    [ ] Implement the logic I've outlined for password persistence and validation.

Phase 2: The Logic Layer (The Brain)

    [ ] Define the LoginEvent classes for login and logout actions.

    [ ] Set up your LoginState to handle initial, loading, success, and failure scenarios.

    [ ] Implement the on<LogInRequired> handler inside your LoginBloc.

Phase 3: The Presentation Layer

    [ ] Connect your UI to the BLoC using a BlocProvider and BlocBuilder.

    [ ] Build the CoffeeCard widget using BoxDecoration and the new withValues() method.

    [ ] Implement the GridView.builder on our Home Screen.

Commands You'll Need

    To run the app: flutter run

    To clean the build: flutter clean