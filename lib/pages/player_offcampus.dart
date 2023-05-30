import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Player_OffCampus extends StatefulWidget {
  const Player_OffCampus({Key? key}) : super(key: key);

  @override
  State<Player_OffCampus> createState() => _Player_OffCampusState();
}

class _Player_OffCampusState extends State<Player_OffCampus> {
  int rating = 0;
  TextEditingController durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Off Campus'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Workout Plan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text(
              'A Full workout will be displayed here ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            Text(
              'Rate this Workout',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildStar(1),
                  buildStar(2),
                  buildStar(3),
                  buildStar(4),
                  buildStar(5),
                ],
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'How long did it take you to complete this workout? (in hours)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  submitRating();
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStar(int starCount) {
    return GestureDetector(
      onTap: () {
        setState(() {
          rating = starCount;
        });
      },
      child: Icon(
        starCount <= rating ? Icons.star : Icons.star_border,
        size: 40,
        color: Colors.yellow,
      ),
    );
  }

  void submitRating() {
    String duration = durationController.text;
    // Handle the submission of the rating and duration
    print('Rating: $rating');
    print('Duration: $duration');
  }
}
