import 'package:flutter/material.dart';

class MessageDetailScreen extends StatefulWidget {
  final String name;
  final String avatar;

  const MessageDetailScreen({
    super.key,
    required this.name,
    required this.avatar,
  });

  @override
  _MessageDetailScreenState createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {"isMe": false, "text": "Hey, how are you?"},
    {"isMe": true, "text": "I’m good, how about you?"},
    {"isMe": false, "text": "All good, thanks!"},
    {"isMe": true, "text": "Perfect 👌"},
    {"isMe": false, "text": "Let’s catch up later."},
    {"isMe": true, "text": "Sure thing!"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        titleSpacing: 0,
        leadingWidth: 40,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.avatar),
            ),
            const SizedBox(width: 8),
            Text(
              widget.name,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 8),
        ],
      ),

      /// ✅ Chat List + Input Field
      body: Column(
        children: [
          /// Messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length + 1, // +1 for "Today" separator
              itemBuilder: (context, index) {
                if (index == 3) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Today",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                  );
                }

                final msg = messages[index > 3 ? index - 1 : index];
                bool isMe = msg["isMe"];

                return Align(
                  alignment:
                  isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: isMe
                          ? const Color(0xFF466B00)
                          : Colors.grey[800],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(12),
                        topRight: const Radius.circular(12),
                        bottomLeft:
                        isMe ? const Radius.circular(12) : Radius.zero,
                        bottomRight:
                        isMe ? Radius.zero : const Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      msg["text"],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),

          /// Input Field
          SafeArea(
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: const BoxDecoration(
                color: Colors.black,
                border: Border(
                  top: BorderSide(color: Colors.white12),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Message",
                        hintStyle: const TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: Colors.grey[900],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  IconButton(
                    icon: const Icon(Icons.mic, color: Colors.white70),
                    onPressed: () {},
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF466B00),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        if (_controller.text.trim().isNotEmpty) {
                          setState(() {
                            messages.add({
                              "isMe": true,
                              "text": _controller.text.trim()
                            });
                          });
                          _controller.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}