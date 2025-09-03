import 'package:flutter/material.dart';
import 'success.dart'; // Import the SuccessScreen

class StartTaskScreen extends StatefulWidget {
  const StartTaskScreen({super.key});

  @override
  State<StartTaskScreen> createState() => _StartTaskScreenState();
}

class _StartTaskScreenState extends State<StartTaskScreen> {
  final List<Map<String, dynamic>> tasks = [
    {
      "title": "Check HVAC System",
      "subtitle": "Verify Heating And Cooling Systems Are Functioning Properly",
      "required": true,
      "completed": false,
      "notes": "",
    },
    {
      "title": "Inspect Plumbing",
      "subtitle": "Check For Leaks, Water Pressure, And Drainage",
      "required": true,
      "completed": false,
      "notes": "",
    },
    {
      "title": "Test Electrical System",
      "subtitle": "Ensure all electrical systems are safe and working",
      "required": false,
      "completed": false,
      "notes": "",
    },
  ];

  // Controllers for each notes field
  late List<TextEditingController> notesControllers;

  @override
  void initState() {
    super.initState();
    // Initialize controllers for each task's notes
    notesControllers = List.generate(
      tasks.length,
          (index) => TextEditingController(text: tasks[index]["notes"]),
    );
  }

  @override
  void dispose() {
    // Dispose all controllers to prevent memory leaks
    for (var controller in notesControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  int get requiredCount =>
      tasks.where((t) => t["required"] == true).length;

  int get completedRequiredCount =>
      tasks.where((t) => t["required"] == true && t["completed"] == true).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent keyboard from resizing content
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(""),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Text(
              "Tasks In Process",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Apartment details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Oakwood Apartments",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "$completedRequiredCount Of ${tasks.length} Tasks",
                          style: const TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Icon(Icons.location_on, color: Colors.white54, size: 16),
                        SizedBox(width: 4),
                        Text(
                          "123 Oak Street, Unit 4B",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    /// Warning Banner
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.info_outline, color: Colors.red, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Complete All Required Tasks ($completedRequiredCount/$requiredCount) To Submit Your Visit.",
                              style: const TextStyle(color: Colors.red, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// Task List
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: buildTaskItem(
                            index: index,
                            title: tasks[index]["title"],
                            subtitle: tasks[index]["subtitle"],
                            required: tasks[index]["required"],
                            completed: tasks[index]["completed"],
                          ),
                        );
                      },
                    ),
                    // Extra space to ensure content is not hidden under the button
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            // Fixed button at the bottom
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.white.withOpacity(0.7); // Lighter text color when disabled
                      }
                      return Colors.white; // Text color when enabled
                    }),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return const Color(0xFF9B3F45); // Lighter red when disabled
                      }
                      return const Color(0xFF61181D); // Dark red when enabled
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: completedRequiredCount == requiredCount
                      ? () {
                    // Navigate to SuccessScreen when all required tasks are completed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessScreen(),
                      ),
                    );
                    // Optional: Print notes for debugging
                    for (int i = 0; i < tasks.length; i++) {
                      print("Task ${i + 1} notes: ${tasks[i]["notes"]}");
                    }
                  }
                      : null,
                  child: Text(
                    "Complete Required Tasks ($completedRequiredCount/$requiredCount)",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Task Item Widget
  Widget buildTaskItem({
    required int index,
    required String title,
    required String subtitle,
    required bool required,
    required bool completed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  tasks[index]["completed"] = !tasks[index]["completed"];
                });
              },
              child: Icon(
                tasks[index]["completed"]
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: const Color(0xFF466B00), // ✅ green for tasks
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: tasks[index]["completed"]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2.0,
                ),
              ),
            ),
            if (required)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF466B00)), // ✅ green border
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "Required",
                  style: TextStyle(
                    color: Color(0xFF466B00), // ✅ green text
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 8),
        // Media buttons positioned above the notes field - centered
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildMediaButton(Icons.photo_camera, "Add Photo"),
            const SizedBox(width: 40),
            buildMediaButton(Icons.videocam, "Add Video"),
          ],
        ),
        const SizedBox(height: 20),
        // Compact notes text field with smaller height
        SizedBox(
          height: 80, // Fixed height to match the image
          child: TextField(
            controller: notesControllers[index],
            onChanged: (value) {
              // Update the task notes in real-time
              tasks[index]["notes"] = value;
            },
            maxLines: 3, // Limit to 3 lines to keep it compact
            minLines: 1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
            decoration: InputDecoration(
              hintText: "Add notes about this task...",
              hintStyle: const TextStyle(
                color: Colors.white38,
                fontSize: 13,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF466B00), width: 1), // Green border
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF466B00), width: 1.5), // Green border when focused
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              fillColor: Colors.black, // Black background
              filled: true,
              isDense: true, // Makes the field more compact
            ),
          ),
        ),
      ],
    );
  }

  Widget buildMediaButton(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: StartTaskScreen(),
  ));
}