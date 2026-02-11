This is the starter template for the GDG workshop on **Flutter BLoC and Local Persistence**. This branch contains the project structure, dependencies, and asset configurations required to begin the implementation.

---

## Workshop Objectives

1. **Local Data Persistence**: Implement secure storage for user credentials using `flutter_secure_storage`.
2. **Business Logic**: Build a `LoginBloc` to handle authentication states and artificial processing delays.
3. **UI Development**: Create a responsive 2-column coffee menu grid using advanced styling and Glassmorphism.

---

## Project Structure

The repository is organized following Clean Architecture principles:

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

Ensure your environment meets the following requirements:

    Flutter SDK: 3.27.0 or higher

    Dart SDK: 3.6.0 or higher

2. Installation

Run the following command in your terminal to fetch the necessary packages:
Bash

flutter pub get

3. Assets

The assets/ folder contains the coffee images and icons required for the UI. These are already registered in the pubspec.yaml file.
Todo List for the Workshop
Phase 1: Data Layer

    [ ] Complete the AuthRepository to interface with SecureStorage.

    [ ] Implement password persistence and validation logic.

Phase 2: Logic Layer

    [ ] Define LoginEvent for login and logout actions.

    [ ] Define LoginState for initial, loading, success, and failure states.

    [ ] Implement the on<LogInRequired> handler in LoginBloc.

Phase 3: Presentation Layer

    [ ] Connect the UI to the BLoC using BlocProvider and BlocBuilder.

    [ ] Build the CoffeeCard widget using BoxDecoration and withValues().

    [ ] Implement the GridView.builder on the Home Screen.

Helpful Commands

    Run the app: flutter run

    Clean the build: flutter clean

    Generate code (if needed): flutter pub run build_runner build