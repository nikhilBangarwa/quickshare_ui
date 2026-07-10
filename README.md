# Quick Share

A polished, production-ready Flutter application implementing the **Quick Share** feature for the Oriflame Community. Built using Material 3, clean widget decomposition, and responsive design layouts.

---

## 🚀 Getting Started

Follow these instructions to set up and run the project locally.

### Prerequisites

* **Flutter SDK**: `^3.11.4` (Compatible with modern versions like `3.22+` / `3.41+`)
* **Dart SDK**: `^3.0.0`

### Installation & Run

1. Clone this repository to your local machine:
   ```bash
   git clone <https://github.com/nikhilBangarwa/quickshare_ui>
   cd quickshare_ui
   ```

2. Download all package dependencies:
   ```bash
   flutter pub get
   ```

3. Run the static code analyzer:
   ```bash
   flutter analyze
   ```

4. Run the automated widget and integration tests:
   ```bash
   flutter test
   ```

5. Launch the application in debug mode on a connected device/emulator:
   ```bash
   flutter run
   ```

---

## 🎨 Key Features & Interaction Details

The app translates the Figma design into a highly interactive, responsive layout using **hardcoded mock values** as requested in the brief:

1. **Branded Splash Screen**:
   * Centered minimalist branding logo.
   * Elegant fade-in animation (`Curves.easeIn`) over `1000ms`.
   * Automatic transition (`Future.delayed`) to the main page after 2 seconds.
2. **Interactive Multi-Step Caption Editor**:
   * Clicking the caption or the "Edit Caption" button opens a custom bottom sheet.
   * Displays in **read-only preview mode** first (tapping it shifts focus to an editable TextField and opens the soft keyboard).
   * **Stateful Save Button**: The button remains disabled until text changes from the original content are detected.
3. **Simulated Share Progress Overlay**:
   * Tapping any social media platform starts an animated dialog showing progress steps (e.g. generating links, copy to clipboard, saving post).
   * Renders a dynamic handoff card containing the exact brand color/gradient, metadata subtitle, and platform icon for Instagram, Facebook, Messenger, WhatsApp, and Pinterest before dismissing automatically.
4. **Smart Post Loading Feed**:
   * When first loaded, a step-by-step checklist prepares the feed before revealing the actual interactive swipeable cards.
5. **Adaptive UI Layout**:
   * Clean portrait rendering that automatically scales.
   * Standard width clamping (`435` maximum width) on tablets/web/desktops to prevent visual stretching.

---

## 🛠️ Technical Implementation Details

* **Folder Structure**: Separates layers and components cleanly:
  * `lib/core/theme/`: Shared styling, fonts, and dark/light color schemes.
  * `lib/core/constants/`: Spacing scales, border-radii, and layout breakpoints.
  * `lib/data/`: Data models and static dummy list configurations.
  * `lib/screens/`: High-level routes and screens (`SplashScreen`, `QuickShareScreen`).
  * `lib/widgets/`: Highly decomposed reusable UI components.
* **Launcher Icons**: Configured via `flutter_launcher_icons` using the solid flat primary green green theme color and minimalist branding nodes.
* **Linting & Code Integrity**: Follows recommended `package:flutter_lints` rules, maintaining clean formatting, zero warnings, and zero deprecated API calls.
