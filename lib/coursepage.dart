import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';
import 'profilepage.dart'; // Ensure you import your ProfilePage

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8D8E8),
      appBar: AppBar(
        title: Text('Courses'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'),
              radius: 24,
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CourseTile(
            title: 'Flutter Development',
            progress: 0.7, // Example progress
          ),
          CourseTile(
            title: 'Python for Data Science',
            progress: 0.5, // Example progress
          ),
          CourseTile(
            title: 'Web Development Basics',
            progress: 0.3, // Example progress
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }
}

class CourseTile extends StatelessWidget {
  final String title;
  final double progress;

  CourseTile({required this.title, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'PixelifySans',
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
            ),
            SizedBox(height: 4),
            Text(
              '${(progress * 100).toInt()}% completed',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'PixelifySans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
