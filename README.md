Markdown

# Mocka: Coffee Selection App UI & Logn Bloc Implementation (Final Solution)

I have completed the full implementation of the Mocka app. This branch serves as your reference point for the completed architecture, including the finalized BLoC logic and the polished Glassmorphism UI. Use this code to compare against your own work or to catch up if you missed a section of the workshop.

---

## What I Have Implemented

### 1. The Authentication Logic
I have fully integrated the `LoginBloc` with the `AuthRepository`. The system now handles:
* **Artificial Latency**: A 5-second delay to simulate real-world processing and demonstrate the loading state.
* **Local Persistence**: Securely saving and verifying passwords using `flutter_secure_storage`.
* **State Management**: Clean transitions between initial, loading, success, and failure states.



### 2. The Glassmorphism UI
I designed the Home Screen to showcase modern Flutter styling techniques.
* **The Menu Grid**: A responsive 2-column layout using `GridView.builder`.
* **The Coffee Cards**: I used the new `.withValues(alpha: 0.3)` method to achieve a high-fidelity frosted glass effect.
* **Depth & Layers**: I implemented custom `BoxShadow` and circular containers to create a 3D visual hierarchy.



---

## How I Organized the Final Codebase

I followed the Clean Architecture layers to ensure the code remains decoupled and easy to test:

1. **Data Layer (`/data`)**
    * **`SecureStorage`**: The hardware interface for encrypted storage.
    * **`AuthRepository`**: The single source of truth for our authentication data logic.

2. **Logic Layer (`/logic`)**
    * **`LoginBloc`**: The central "brain" that receives UI events and emits state changes back to the interface.

3. **Presentation Layer (`/presentation`)**
    * **`Screens`**: The `LoginScreen` (handling listeners) and `HomeScreen` (rendering the grid).
    * **`Widgets`**: Reusable components, specifically the `CoffeeCard` and input fields.



---

## Key Snippets to Review

### The UI Logic
Note how I used the `BlocListener` to handle navigation and the `BlocBuilder` to handle UI updates simultaneously:

```dart
// I use a Listener for one-time actions like navigation or showing SnackBars
BlocListener<LoginBloc, LoginState>(
  listener: (context, state) {
    if (state is LoginSuccess) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  },
  child: // ...
)

The Glassmorphism Effect

Look closely at my BoxDecoration in coffee_card.dart to see how I achieved the glass effect:
Dart

decoration: BoxDecoration(
  color: Colors.white.withValues(alpha: 0.2), // Frosted glass look
  borderRadius: BorderRadius.circular(24),
  border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
),

Running the Finished App

To see the final result on your device, ensure you are on this branch and run:
Bash

flutter pub get
flutter run