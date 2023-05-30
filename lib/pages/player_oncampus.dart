import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Player_OnCampus extends StatefulWidget {
  const Player_OnCampus({Key? key}) : super(key: key);

  @override
  State<Player_OnCampus> createState() => _Player_OnCampusState();
}

class _Player_OnCampusState extends State<Player_OnCampus> {
  String selectedOption = '';
  int rating = 0;
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('On Campus'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Container(
              height: 60, // Adjust the height to make the dropdown box bigger
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: DropdownButton<String>(
                  value: selectedOption.isEmpty ? null : selectedOption,
                  hint: Text('Did you attend practice today?'),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOption = newValue ?? '';
                    });
                  },
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: 'Yes',
                      child: Text('Yes'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'No',
                      child: Text('No'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Rate Today\'s Practice',
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
              controller: commentController,
              decoration: InputDecoration(
                labelText: 'Leave a comment',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle submit logic here
                        submitFeedback();
                      },
                      child: Text('Submit'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle clear logic here
                        clearFeedback();
                      },
                      child: Text('Clear'),
                    ),
                  ],
                ),
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

  void submitFeedback() {
    String comment = commentController.text;
    // Handle the submission of the feedback, including the selected option, rating, and comment
    print('Selected Option: $selectedOption');
    print('Rating: $rating');
    print('Comment: $comment');
  }

  void clearFeedback() {
    setState(() {
      selectedOption = '';
      rating = 0;
      commentController.clear();
    });
  }
}


/*
@override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("On Campus Page"),
      ),
    );
  }
 */