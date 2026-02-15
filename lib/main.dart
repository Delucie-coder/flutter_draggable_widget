import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the red debug banner
      home: DraggableDemo(),
    ),
  );
}

class DraggableDemo extends StatefulWidget {
  const DraggableDemo({super.key});

  @override
  State<DraggableDemo> createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  // This variable stores the color that has been "dropped" into the target
  Color acceptedColor = Colors.grey;
  String statusMessage = "Drop a color here!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Drag & Drop Demo'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Step 1: Drag an item below",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // --- THE DRAGGABLE ITEMS ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDraggableItem(Colors.orange, "Orange"),
                _buildDraggableItem(Colors.teal, "Teal"),
                _buildDraggableItem(Colors.purple, "Purple"),
              ],
            ),

            const Divider(indent: 40, endIndent: 40, thickness: 2),

            const Text(
              "Step 2: Drop it into the target box",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // --- THE DRAG TARGET ---
            DragTarget<Color>(
              // Logic: Decide if the target should accept the data
              onWillAcceptWithDetails: (details) => true,

              // Logic: What happens when the user lets go?
              onAcceptWithDetails: (details) {
                setState(() {
                  acceptedColor = details.data;
                  statusMessage = "Target Captured!";
                });
              },

              // Logic: Rebuilds the UI based on what's hovering over it
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    color: candidateData.isNotEmpty
                        ? acceptedColor.withValues(alpha: 0.5)
                        : acceptedColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: candidateData.isNotEmpty
                          ? Colors.blue
                          : Colors.black,
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      candidateData.isNotEmpty ? "Release now!" : statusMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // A helper method to keep the code clean
  Widget _buildDraggableItem(Color color, String name) {
    return Draggable<Color>(
      data: color,
      // What you see following your finger
      feedback: Material(
        color: Colors.transparent,
        child: _box(color.withValues(alpha: 0.7), "Moving..."),
      ),
      // What stays behind while you are dragging
      childWhenDragging: _box(color.withValues(alpha: 0.2), "Gone!"),
      // What you see on screen normally
      child: _box(color, name),
    );
  }

  Widget _box(Color color, String text) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
