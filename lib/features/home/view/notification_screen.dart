import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> todayNotifications = [
    {
      "name": "Elsa Lilly",
      "message": "Sent you a message!",
      "time": "2 hours ago",
      "avatar": "assets/images/home/arslan.jpg",
      "hasUnreadIndicator": true,
    },
  ];

  final List<Map<String, dynamic>> yesterdayNotifications = [
    {
      "name": "John",
      "message": "Sent you a message!",
      "time": "5 hours ago",
      "avatar": "assets/images/home/arslan.jpg",
      "hasUnreadIndicator": true,
    },
  ];

  final List<Map<String, dynamic>> mondayNotifications = [
    {
      "name": "Jason",
      "message": "Sent you a message!",
      "time": "6 hours ago",
      "avatar": "assets/images/home/arslan.jpg",
      "hasUnreadIndicator": true,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0A0A0A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: const BoxDecoration(
                color: Colors.transparent,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[600],
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: "Unread"),
                Tab(text: "Read"),
                Tab(text: "Archived"),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNotificationList("Today", todayNotifications, "Yesterday", yesterdayNotifications, "Monday", mondayNotifications),
          _buildEmptyState("No read notifications"),
          _buildEmptyState("No archived notifications"),
        ],
      ),
    );
  }

  Widget _buildNotificationList(String section1, List<Map<String, dynamic>> notifications1,
      String section2, List<Map<String, dynamic>> notifications2,
      String section3, List<Map<String, dynamic>> notifications3) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Today Section
        _buildSectionHeader(section1),
        const SizedBox(height: 16),
        ...notifications1.map((item) => _buildNotificationCard(item)).toList(),

        const SizedBox(height: 32),

        // Yesterday Section
        _buildSectionHeader(section2),
        const SizedBox(height: 16),
        ...notifications2.map((item) => _buildNotificationCard(item)).toList(),

        const SizedBox(height: 32),

        // Monday Section
        _buildSectionHeader(section3),
        const SizedBox(height: 16),
        ...notifications3.map((item) => _buildNotificationCard(item)).toList(),

        const SizedBox(height: 40),
        Center(
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Mark All As Read",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Text(
          "See All",
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF466B00).withOpacity(0.1), // Transparent green background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF466B00), // Green border
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF466B00).withOpacity(0.01), // Almost invisible glow
            blurRadius: 0.2, // Minimal blur
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
          // Outer glow
          BoxShadow(
            color: const Color(0xFF466B00).withOpacity(0.005), // Barely there outer glow
            blurRadius: 1.5,
            spreadRadius: 0.5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          // Green indicator dot
          if (item["hasUnreadIndicator"] == true)
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(right: 12),
              decoration: const BoxDecoration(
                color: Color(0xFF466B00),
                shape: BoxShape.circle,
              ),
            ),

          // Avatar
          CircleAvatar(
            backgroundImage: AssetImage(item["avatar"]!),
            radius: 20,
          ),
          const SizedBox(width: 12),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["name"]!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item["message"]!,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item["time"]!,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}