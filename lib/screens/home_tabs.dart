import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  final Function(int) onTabChange; // Callback to change tabs

   HomeTab({Key? key, required this.onTabChange}) : super(key: key);

  // Remove static and const, just make them final
  final List<Map<String, dynamic>> programs = [
    {
      'title': 'Flutter Development',
      'instructor': 'John Doe',
      'progress': 0.6,
      'duration': '12 hours',
      'image': Icons.code,
      'color': Colors.purple,
    },
    {
      'title': 'UI/UX Design',
      'instructor': 'Jane Smith',
      'progress': 0.3,
      'duration': '8 hours',
      'image': Icons.design_services,
      'color': Colors.pink,
    },
    {
      'title': 'Data Science',
      'instructor': 'Mike Johnson',
      'progress': 0.0,
      'duration': '15 hours',
      'image': Icons.analytics,
      'color': Colors.deepPurple,
    },
    {
      'title': 'Digital Marketing',
      'instructor': 'Sarah Wilson',
      'progress': 0.8,
      'duration': '10 hours',
      'image': Icons.trending_up,
      'color': Colors.blue,
    },
  ];

  final List<Map<String, dynamic>> featuredPrograms = [
    {
      'title': 'Advanced Flutter',
      'description': 'Master advanced Flutter concepts',
      'rating': 4.9,
      'students': 2341,
      'icon': Icons.code,
    },
    {
      'title': 'AI & Machine Learning',
      'description': 'Learn cutting-edge AI technologies',
      'rating': 4.8,
      'students': 1895,
      'icon': Icons.psychology,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar with Profile Avatar and Notification
            _buildTopAppBar(context),
            SizedBox(height: 20),
            
            // Welcome Message
            _buildWelcomeSection(),
            SizedBox(height: 24),
            
            // Sliding Cards - All Programs
            _buildProgramsCarousel(),
            SizedBox(height: 32),
            
            // Featured Program Section
            _buildFeaturedPrograms(),
            SizedBox(height: 32),
            
            // Quick Access Section
            _buildQuickAccess(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.purple, Colors.pink],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          // Profile Avatar
          GestureDetector(
            onTap: () {
              // Navigate to profile tab (index 2)
              onTabChange(2);
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.purple,
                  size: 24,
                ),
              ),
            ),
          ),
          Spacer(),
          // Notification Icon
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Show Notifications')),
              );
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
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

  Widget _buildWelcomeSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Continue your learning journey',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgramsCarousel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Programs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to Programs Tab (index 1)
                  onTabChange(1);
                },
                child: Text(
                  'View All',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: programs.length,
            itemBuilder: (context, index) {
              return _buildProgramCard(programs[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProgramCard(Map<String, dynamic> program) {
    return Container(
      width: 280,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: (program['color'] as Color).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    program['image'] as IconData,
                    color: program['color'] as Color,
                    size: 28,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        program['title'] as String,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        program['instructor'] as String,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            LinearProgressIndicator(
              value: program['progress'] as double,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(program['color'] as Color),
              borderRadius: BorderRadius.circular(10),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${((program['progress'] as double) * 100).toInt()}% Complete',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  program['duration'] as String,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: program['color'] as Color,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Continue Learning'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedPrograms() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Program',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.pink],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.3),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    featuredPrograms[0]['icon'] as IconData,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        featuredPrograms[0]['title'] as String,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        featuredPrograms[0]['description'] as String,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text(
                            (featuredPrograms[0]['rating'] as double).toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 16),
                          Icon(Icons.people, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            '${featuredPrograms[0]['students']} students',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {
                    // Navigate to Programs Tab
                    onTabChange(1);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccess(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Access',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildQuickAccessCard(
                  'Browse Programs',
                  Icons.explore_outlined,
                  Colors.purple,
                  () {
                    // Navigate to Programs Tab (index 1)
                    onTabChange(1);
                  },
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildQuickAccessCard(
                  'Submit Feedback',
                  Icons.feedback_outlined,
                  Colors.pink,
                  () {
                    // Show feedback dialog or navigate to feedback screen
                    _showFeedbackDialog(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildQuickAccessCard(
                  'My Progress',
                  Icons.analytics_outlined,
                  Colors.blue,
                  () {
                    // Navigate to progress section
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Progress Section')),
                    );
                  },
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildQuickAccessCard(
                  'Achievements',
                  Icons.emoji_events_outlined,
                  Colors.orange,
                  () {
                    // Navigate to achievements
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Achievements Section')),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Submit Feedback'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('How was your learning experience?'),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [1, 2, 3, 4, 5].map((star) {
                  return IconButton(
                    icon: Icon(Icons.star, color: Colors.amber),
                    onPressed: () {},
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Tell us about your experience...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Feedback submitted successfully!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}