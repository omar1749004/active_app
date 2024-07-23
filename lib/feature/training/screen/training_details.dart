import 'package:active_app/core/constant/image_asset.dart';
import 'package:flutter/material.dart';

class ExerciseDetailPage extends StatefulWidget {
 // final Exercise exercise;

  //ExerciseDetailPage({required this.exercise});

  @override
  _ExerciseDetailPageState createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  final _weightController = TextEditingController();
  final _repsController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  
  void _saveEntry() {
    // Save the entry (weight, reps, date) logic
    setState(() {
    //   widget.exercise.entries.add(ExerciseEntry(
    //     date: _selectedDate,
    //     weight: double.parse(_weightController.text),
    //     reps: int.parse(_repsController.text),
    //   ));
     });
    _weightController.clear();
    _repsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eliptical Bike"),
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Squats are a compound exercise that targets the quadriceps, hamstrings, and glutes."),
            SizedBox(height: 16),
            Image.network("https://example.com/squat_image.jpg"),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => ExerciseInputBottomSheet(),
                );
              },
              child: Text("Record Performance"),
            ),
            SizedBox(height: 16),
            Text(
              "Previous Entries",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            PreviousEntriesList(),
          ],
        ),
      ),
    )
    );
  }
}

class ExerciseDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Squats are a compound exercise that targets the quadriceps, hamstrings, and glutes."),
            SizedBox(height: 16),
            Image.network("https://example.com/squat_image.jpg"),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => ExerciseInputBottomSheet(),
                );
              },
              child: Text("Record Performance"),
            ),
            SizedBox(height: 16),
            Text(
              "Previous Entries",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            PreviousEntriesList(),
          ],
        ),
      ),
    );
  }
}

class ExerciseInputBottomSheet extends StatefulWidget {
  @override
  _ExerciseInputBottomSheetState createState() => _ExerciseInputBottomSheetState();
}

class _ExerciseInputBottomSheetState extends State<ExerciseInputBottomSheet> {
  int sets = 1;
  List<TextEditingController> weightControllers = [];
  List<TextEditingController> repsControllers = [];

  @override
  void initState() {
    super.initState();
    _initializeControllers(sets);
  }

  void _initializeControllers(int sets) {
    for (int i = 0; i < sets; i++) {
      weightControllers.add(TextEditingController());
      repsControllers.add(TextEditingController());
    }
  }

  void _addSet() {
    setState(() {
      sets += 1;
      weightControllers.add(TextEditingController());
      repsControllers.add(TextEditingController());
    });
  }

  void _removeSet() {
    if (sets > 1) {
      setState(() {
        sets -= 1;
        weightControllers.removeLast();
        repsControllers.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Record Performance",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            itemCount: sets,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: weightControllers[index],
                      decoration: InputDecoration(labelText: "Weight (kg/lbs)"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: repsControllers[index],
                      decoration: InputDecoration(labelText: "Reps"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: _removeSet,
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: _addSet,
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Save the data and close the bottom sheet
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}


class PreviousEntriesList extends StatelessWidget {
  final List<Map<String, dynamic>> previousEntries = [
    {"date": "2024-05-18", "weight": 80, "reps": 10},
    {"date": "2024-05-15", "weight": 75, "reps": 12},
    {"date": "2024-05-10", "weight": 70, "reps": 10},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: previousEntries.length,
      itemBuilder: (context, index) {
        final entry = previousEntries[index];
        return ListTile(
          title: Text("${entry['date']}"),
          subtitle: Text("Weight: ${entry['weight']} kg - Reps: ${entry['reps']}"),
        );
      },
    );
  }
}