# ☕ Coffee Ordering Machine

A simple Flutter app I built while learning Dart and Flutter. Instead of just following tutorials, I wanted to practice the concepts on something small and fun of my own — so this is a little app for picking your coffee preferences and "ordering" a virtual coffee.

## About this project

This was my first real attempt at putting together a working Flutter app from scratch — widgets, state, navigation between screens, and a bit of Dart's async side (Futures and Streams). Nothing fancy, just me working through the fundamentals hands-on.

## What it does

- Set your coffee **strength**, **sugar**, and **milk** level using simple "+" buttons, with live icon feedback.
- Based on what you picked, it guesses a "drink type" (Espresso, Latte, Cappuccino, etc.) — a fun little rule I wrote myself, not an actual barista formula!
- Tap **View Order Summary** to go to a screen showing your choices.
- Tap **Place Order** to simulate sending the order off (a short loading delay).
- Once it's confirmed, a live countdown counts down the "brewing," and then you can head back to the home screen.

## Screenshots

<p float="left">
<img width="250" alt="Screenshot 2026-09-10 214252" src="https://github.com/user-attachments/assets/3795fbf9-06e3-4a52-8c46-f94f017d8340" />
<img width="250" alt="Screenshot 2026-09-10 214317" src="https://github.com/user-attachments/assets/d7df4d3b-248b-451c-b0d2-304e349a6236" />
</p>

## Demo Video

[Watch the demo](https://drive.google.com/file/d/18dZNLuEN_LUkYaXmJwo2CDQ7RQIQ2eo9/view?usp=sharing) <!-- replace with your actual video link -->

## Things I practiced / learned building this

- **Stateless widgets** — the `Home` screen, since it never needs to change on its own.
- **Stateful widgets** — `Coffee_prefs` and `OrderSummary`, where I needed to track values that change over time (like the strength counter).
- **Basic navigation** — moving between screens with `Navigator.push` and back with `Navigator.pop`.
- **Futures** — simulating a "server call" when placing an order, and learning how `async`/`await` actually pauses just one function, not the whole app.
- **Streams** — building a live brewing countdown with `async*`/`yield` and displaying it with a `StreamBuilder`.

## Project structure

```
lib/
├── main.dart          # App entry point
├── Home.dart          # Stateless root screen (AppBar + layout)
├── Coffee_prefs.dart  # Stateful widget: strength/sugar/milk counters + order button
└── OrderSummary.dart  # Stateful widget: order confirmation + brewing countdown
assets/
└── img/
    ├── coffee_bean.png
    ├── sugar_cube.png
    └── coffee_bg.jpg
```

## Setup & Usage

If you want to try it out yourself:

1. Clone the repo:
   ```
   git clone https://github.com/<your-username>/<your-repo>.git
   cd <your-repo>
   ```
2. Install dependencies:
   ```
   flutter pub get
   ```
3. Run it on an emulator or connected device:
   ```
   flutter run
   ```
4. Play around with the strength/sugar/milk buttons, tap **View Order Summary**, then **Place Order**, and watch the countdown finish.

## Download

The built APK is available in the [Releases](../../releases) section of this repository.

## Built with

- [Flutter](https://flutter.dev)
- Dart
