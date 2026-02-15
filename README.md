Flutter Draggable & DragTarget Widget

A clean, interactive Flutter application demonstrating the implementation of drag-and-drop mechanics. This project showcases how to transfer data between widgets using the `Draggable` and `DragTarget` system.

Features

* **Real-time Interaction:** Visual feedback during the drag process (opacity changes).
* **Type-Safe Data Transfer:** Sending `Color` objects as data payloads.
* **Dynamic UI Updates:** The target box reacts when an item is hovering over it (glowing border and text change).
* **Modern Flutter Implementation:** Uses the latest `withValues` API for color manipulations.



Technical Deep Dive

### 1. The Draggable Widget

The "Source" of the interaction. It is configured with three distinct states:

* **`child`**: The default view (Orange, Teal, or Purple box).
* **`feedback`**: A semi-transparent version wrapped in a `Material` widget that follows the user's touch.
* **`childWhenDragging`**: A faded placeholder that stays in the original position to indicate the item is "gone."

### 2. The DragTarget Widget

The "Destination" of the interaction. It manages the logic for receiving data:

* **`onWillAcceptWithDetails`**: Returns `true` to indicate it is ready to receive the incoming color data.
* **`onAcceptWithDetails`**: Updates the app state with the new color and changes the status message.
* **`builder`**: Monitors `candidateData` to change the UI (border color and opacity) when an item is being hovered over the target.



Project Structure

* **`main.dart`**: Contains the complete application logic and UI.
* **`_buildDraggableItem`**: A helper method to ensure consistent behavior across all draggable colors.
* **`_box`**: A reusable UI component for the colored squares.



Getting Started

1. **Clone the repository:**
```bash
git clone https://github.com/Delucie-coder/flutter_draggable_widget.git

```


2. **Install dependencies:**
```bash
flutter pub get

```


3. **Run the application:**
```bash
flutter run

```

Author

**Delucie-coder** *Flutter Developer & UI Enthusiast*

