
import 'package:flutter/material.dart';
import 'package:exclelerate_learning_hub/services/api_service.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> program;

  const ProgramDetailsScreen({Key? key, required this.program}) : super(key: key);

  IconData get _programIcon {
    try {
      if (program.containsKey('icon')) {
        final dynamic iconValue = program['icon'];
        if (iconValue is String) {
          return ApiService.getIconFromString(iconValue);
        }
      }
    } catch (e) {
      debugPrint('Error getting icon: $e');
    }
    return Icons.school; // Default fallback
  }

  Color get _programColor {
    try {
      if (program.containsKey('color')) {
        final dynamic colorValue = program['color'];
        if (colorValue is String) {
          return ApiService.getColorFromString(colorValue);
        }
      }
    } catch (e) {
      debugPrint('Error getting color: $e');
    }
    return Colors.purple; // Default fallback
  }

  String get _title {
    try {
      if (program.containsKey('title')) {
        return program['title'].toString();
      }
    } catch (e) {
      debugPrint('Error getting title: $e');
    }
    return 'Program Title';
  }

  String get _instructor {
    try {
      if (program.containsKey('instructor')) {
        return program['instructor'].toString();
      }
    } catch (e) {
      debugPrint('Error getting instructor: $e');
    }
    return 'Instructor Name';
  }

  String get _duration {
    try {
      if (program.containsKey('duration')) {
        return program['duration'].toString();
      }
    } catch (e) {
      debugPrint('Error getting duration: $e');
    }
    return 'Duration not specified';
  }

  String get _level {
    try {
      if (program.containsKey('level')) {
        return program['level'].toString();
      }
    } catch (e) {
      debugPrint('Error getting level: $e');
    }
    return 'All Levels';
  }

  String get _category {
    try {
      if (program.containsKey('category')) {
        return program['category'].toString();
      }
    } catch (e) {
      debugPrint('Error getting category: $e');
    }
    return 'General';
  }

  String get _price {
    try {
      if (program.containsKey('price')) {
        return program['price'].toString();
      }
    } catch (e) {
      debugPrint('Error getting price: $e');
    }
    return '\$0.00';
  }

  String get _description {
    try {
      if (program.containsKey('description')) {
        return program['description'].toString();
      }
    } catch (e) {
      debugPrint('Error getting description: $e');
    }
    return 'No description available.';
  }

  List<String> get _objectives {
    try {
      if (program.containsKey('objectives') && program['objectives'] is List) {
        return List<String>.from(program['objectives'].map((e) => e.toString()));
      }
    } catch (e) {
      debugPrint('Error getting objectives: $e');
    }
    return ['Learn valuable skills', 'Complete hands-on projects', 'Achieve certification'];
  }

  double get _rating {
    try {
      if (program.containsKey('rating')) {
        final dynamic rating = program['rating'];
        if (rating is double) return rating;
        if (rating is int) return rating.toDouble();
        if (rating is String) return double.tryParse(rating) ?? 4.5;
      }
    } catch (e) {
      debugPrint('Error parsing rating: $e');
    }
    return 4.5;
  }

  int get _students {
    try {
      if (program.containsKey('students')) {
        final dynamic students = program['students'];
        if (students is int) return students;
        if (students is String) return int.tryParse(students) ?? 0;
      }
    } catch (e) {
      debugPrint('Error parsing students: $e');
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program Details'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Program Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [_programColor, _getSecondaryColor(_programColor)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _programIcon,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    _title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'by $_instructor',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Program Info
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildInfoRow('Duration', _duration),
                    _buildInfoRow('Level', _level),
                    _buildInfoRow('Category', _category),
                    _buildInfoRow('Rating', '$_rating ⭐'),
                    _buildInfoRow('Students', '$_students students'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),

            // Description Section
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About this Program',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),

            // Learning Objectives
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What You\'ll Learn',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 12),
                    Column(
                      children: _objectives.map((objective) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.check_circle, color: Colors.green, size: 20),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  objective,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),

            // Price and Enroll Button
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _price,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        Text(
                          'One-time payment',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _handleEnrollment(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Enroll Now',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Color _getSecondaryColor(Color primaryColor) {
    if (primaryColor == Colors.purple) return Colors.pink;
    if (primaryColor == Colors.pink) return Colors.purple;
    if (primaryColor == Colors.deepPurple) return Colors.purple;
    if (primaryColor == Colors.blue) return Colors.lightBlue;
    return Colors.pink;
  }

  void _handleEnrollment(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enroll in Program'),
          content: Text('Are you sure you want to enroll in "$_title"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Successfully enrolled in $_title!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: Text('Enroll'),
            ),
          ],
        );
      },
    );
  }
}