import 'package:exclelerate_learning_hub/screens/program_listing_screen.dart';
import 'package:flutter/material.dart';


class ProgramsTab extends StatelessWidget {
  final List<Map<String, dynamic>> allPrograms = [
    {
      'title': 'Mobile Development',
      'category': 'Technology',
      'duration': '12 weeks',
      'level': 'Intermediate',
      'icon': Icons.phone_android,
      'color': Colors.purple,
      'instructor': 'John Doe',
      'rating': 4.8,
      'students': 1247,
      'price': '\$79.99',
      'lessons': 12,
    },
    {
      'title': 'Digital Marketing',
      'category': 'Business',
      'duration': '8 weeks',
      'level': 'Beginner',
      'icon': Icons.trending_up,
      'color': Colors.pink,
      'instructor': 'Jane Smith',
      'rating': 4.6,
      'students': 892,
      'price': '\$69.99',
      'lessons': 8,
    },
    {
      'title': 'Graphic Design',
      'category': 'Design',
      'duration': '10 weeks',
      'level': 'All Levels',
      'icon': Icons.graphic_eq,
      'color': Colors.deepPurple,
      'instructor': 'Mike Johnson',
      'rating': 4.9,
      'students': 1563,
      'price': '\$89.99',
      'lessons': 10,
    },
    {
      'title': 'Data Science',
      'category': 'Technology',
      'duration': '15 weeks',
      'level': 'Advanced',
      'icon': Icons.analytics,
      'color': Colors.blue,
      'instructor': 'Sarah Wilson',
      'rating': 4.7,
      'students': 2034,
      'price': '\$99.99',
      'lessons': 15,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Programs',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: allPrograms.length,
        itemBuilder: (context, index) {
          return _buildProgramCard(allPrograms[index], context);
        },
      ),
    );
  }

  Widget _buildProgramCard(Map<String, dynamic> program, BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: program['color'].withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(program['icon'], color: program['color']),
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProgramDetailsScreen(
                program: program,
              ),
            ),
          );
        },
      ),
    );
  }
}