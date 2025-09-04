import 'package:flutter/material.dart';
import 'messages_detail_screen.dart'; // Import the ChatDetailScreen

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int selectedTab = 0;
  final List<String> tabs = ["Unread", "Read", "Archived"];
  final Map<String, List<Map<String, dynamic>>> tabData = {
    "Unread": List.generate(
      8,
          (index) => {
        "name": "Contact ${index + 1}",
        "message": "New message received!",
        "time": "${index + 1}h ago",
        "unread": index % 3 + 1,
        "avatar": "assets/images/avatar${index % 4}.png",
      },
    ),
    "Read": List.generate(
      5,
          (index) => {
        "name": "Friend ${index + 1}",
        "message": "Thanks for the update!",
        "time": "${index + 2}d ago",
        "unread": 0,
        "avatar": "assets/images/avatar${index % 4}.png",
      },
    ),
    "Archived": List.generate(
      3,
          (index) => {
        "name": "Archived ${index + 1}",
        "message": "Old conversation archived",
        "time": "${index + 1}w ago",
        "unread": 0,
        "avatar": "assets/images/avatar${index % 4}.png",
      },
    ),
  };

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> currentChats = tabData[tabs[selectedTab]] ?? [];
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        title: const Text(
          "Chats",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Color(0xFFCCCCCC),
          ),
        ),
        backgroundColor: const Color(0xFF0A0A0A),
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0, // Prevent elevation change on scroll
        surfaceTintColor: Colors.transparent, // Avoid tinting
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFF61181D), // Tab bar color
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: List.generate(tabs.length, (index) {
                bool isSelected = selectedTab == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF0B1209) : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: currentChats.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    tabs[selectedTab] == "Unread"
                        ? Icons.mark_email_unread_outlined
                        : tabs[selectedTab] == "Read"
                        ? Icons.mark_email_read_outlined
                        : Icons.archive_outlined,
                    color: Colors.white30,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "No ${tabs[selectedTab].toLowerCase()} messages",
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
                : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: currentChats.length,
              separatorBuilder: (_, __) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  color: Colors.white.withOpacity(0.08),
                  height: 1,
                ),
              ),
              itemBuilder: (context, index) {
                final chat = currentChats[index];
                return Container(
                  color: Colors.transparent,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFF2A2A2A),
                        radius: 26,
                        child: Text(
                          chat["name"].toString().substring(0, 2).toUpperCase(),
                          style: const TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      chat["name"],
                      style: const TextStyle(
                        color: Color(0xFFCCCCCC),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        chat["message"],
                        style: TextStyle(
                          color: Color(0xFFCCCCCC).withOpacity(0.7),
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          chat["time"],
                          style: TextStyle(
                            color: Color(0xFFCCCCCC).withOpacity(0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (chat["unread"] > 0)
                          Container(
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4A7C24),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "${chat["unread"]}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MessageDetailScreen(
                            name: chat["name"],
                            avatar: chat["avatar"],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}