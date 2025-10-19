import 'package:flutter/material.dart';

class ProgramsTab extends StatelessWidget {
  final List<Map<String, dynamic>> allPrograms = [
    {
      'title': 'Mobile Development',
      'category': 'Technology',
      'duration': '12 weeks',
      'level': 'Intermediate',
      'icon': Icons.phone_android,
    },
    {
      'title': 'Digital Marketing',
      'category': 'Business',
      'duration': '8 weeks',
      'level': 'Beginner',
      'icon': Icons.trending_up,
    },
    {
      'title': 'Graphic Design',
      'category': 'Design',
      'duration': '10 weeks',
      'level': 'All Levels',
      'icon': Icons.graphic_eq,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All Programs',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Browse all available learning programs',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 24),
          ...allPrograms.map((program) => _buildProgramCard(program)),
        ],
      ),
    );
  }

  Widget _buildProgramCard(Map<String, dynamic> program) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.pink],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(program['icon'], color: Colors.white),
        ),
        title: Text(
          program['title'],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(program['category']),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.timer, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text(program['duration']),
                SizedBox(width: 16),
                Icon(Icons.school, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text(program['level']),
              ],
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Navigate to program details
        },
      ),
    );
  }
}