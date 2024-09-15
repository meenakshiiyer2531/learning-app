import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart'; // Assume you have a custom BottomNavBar widget
import 'profilepage.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6CADD), // Light purple background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, // Remove back arrow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "CHATS",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'PixelifySans', // Custom retro font
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to Profile Page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                radius: 24,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                ChatTile(
                  name: "ALLVENA",
                  message: "Hey, How are you?",
                  time: "9:30pm",
                  avatarPath: "assets/avatar1.png",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatMessagePage()));
                  },
                ),
                ChatTile(
                  name: "JOSEPH",
                  message: "I’ve a doubt",
                  avatarPath: "assets/avatar2.png",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatMessagePage()));
                  },
                ),
                ChatTile(
                  name: "JOHN",
                  message: "How are you??",
                  avatarPath: "assets/avatar3.png",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatMessagePage()));
                  },
                ),
                ChatTile(
                  name: "ANA",
                  message: "Are you doing greattt, so why I am here",
                  avatarPath: "assets/avatar4.png",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatMessagePage()));
                  },
                ),
                // Add more ChatTile widgets as needed
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NewChatButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatMessagePage()));
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 3),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String avatarPath;
  final VoidCallback onTap; // Callback for when the tile is tapped

  ChatTile({
    required this.name,
    required this.message,
    this.time = "",
    required this.avatarPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GestureDetector(
        onTap: onTap, // When tapped, trigger the onTap callback
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFB8D9AA), // Light green background for chat
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: Color(0xFF000000),
                width: 2), // Black border for retro effect
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundImage: AssetImage(avatarPath),
              radius: 24,
            ),
            title: Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'PixelifySans',
              ),
            ),
            subtitle: Text(
              message,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'PixelifySans',
              ),
            ),
            trailing: time.isNotEmpty
                ? Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontFamily: 'PixelifySans',
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

class NewChatButton extends StatelessWidget {
  final VoidCallback onTap; // Callback for the button tap

  NewChatButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFB8D9AA), // Light green background
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: Color(0xFF000000), width: 2), // Black retro border
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Text(
          "NEW CHAT",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'PixelifySans',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class ChatMessagePage extends StatefulWidget {
  @override
  _ChatMessagePageState createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage> {
  final TextEditingController _controller = TextEditingController();

  List<String> messages = [];

  void sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6CADD), // Light purple background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          "Messaging",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'PixelifySans',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      messages[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'PixelifySans',
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Enter message",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.green),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
