// lib/services/api_service.dart
import 'package:flutter/material.dart';

class ApiService {
  // Simulate API delay
  static Future<void> simulateApiDelay() async {
    await Future.delayed(Duration(seconds: 2));
  }

  // Mock programs data
  static Future<List<Map<String, dynamic>>> getPrograms() async {
    await simulateApiDelay();

    return [
      {
        'id': 1,
        'title': 'Flutter Mobile Development',
        'category': 'Technology',
        'duration': '12 weeks',
        'level': 'Intermediate',
        'icon': 'code',
        'color': 'purple',
        'instructor': 'John Doe',
        'rating': 4.8,
        'students': 1247,
        'price': '\$79.99',
        'lessons': 12,
        'description': 'Learn Flutter and Dart to build beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
        'objectives': [
          'Master Flutter widget system',
          'Build responsive UIs',
          'State management solutions',
          'API integration',
          'Publishing to app stores'
        ]
      },
      {
        'id': 2,
        'title': 'Digital Marketing Strategy',
        'category': 'Business',
        'duration': '8 weeks',
        'level': 'Beginner',
        'icon': 'trending_up',
        'color': 'pink',
        'instructor': 'Jane Smith',
        'rating': 4.6,
        'students': 892,
        'price': '\$69.99',
        'lessons': 8,
        'description': 'Master digital marketing strategies including SEO, social media, email marketing, and analytics to grow your business online.',
        'objectives': [
          'SEO optimization techniques',
          'Social media marketing',
          'Email campaign management',
          'Google Analytics mastery',
          'Conversion rate optimization'
        ]
      },
      {
        'id': 3,
        'title': 'UI/UX Design Fundamentals',
        'category': 'Design',
        'duration': '10 weeks',
        'level': 'All Levels',
        'icon': 'design_services',
        'color': 'deepPurple',
        'instructor': 'Mike Johnson',
        'rating': 4.9,
        'students': 1563,
        'price': '\$89.99',
        'lessons': 10,
        'description': 'Learn user-centered design principles, prototyping, and testing to create intuitive and engaging digital experiences.',
        'objectives': [
          'User research methods',
          'Wireframing and prototyping',
          'Visual design principles',
          'Usability testing',
          'Design system creation'
        ]
      },
      {
        'id': 4,
        'title': 'Data Science with Python',
        'category': 'Technology',
        'duration': '15 weeks',
        'level': 'Advanced',
        'icon': 'analytics',
        'color': 'blue',
        'instructor': 'Sarah Wilson',
        'rating': 4.7,
        'students': 2034,
        'price': '\$99.99',
        'lessons': 15,
        'description': 'Comprehensive data science course covering Python, statistics, machine learning, and data visualization for real-world applications.',
        'objectives': [
          'Python programming for data science',
          'Statistical analysis',
          'Machine learning algorithms',
          'Data visualization',
          'Real-world project deployment'
        ]
      }
    ];
  }

  // Mock feedback submission
  static Future<Map<String, dynamic>> submitFeedback(Map<String, dynamic> feedback) async {
    await simulateApiDelay();

    // Simulate API response
    return {
      'success': true,
      'message': 'Feedback submitted successfully!',
      'data': feedback
    };
  }

  // Mock registration
  static Future<Map<String, dynamic>> registerUser(Map<String, dynamic> userData) async {
    await simulateApiDelay();

    // Simulate API response
    return {
      'success': true,
      'message': 'Registration successful!',
      'user': {
        'id': DateTime.now().millisecondsSinceEpoch,
        'email': userData['email'],
        'name': userData['name'],
        'type': userData['type']
      }
    };
  }

  // Helper method to convert string to IconData
  static IconData getIconFromString(String iconName) {
    switch (iconName) {
      case 'code': return Icons.code;
      case 'trending_up': return Icons.trending_up;
      case 'design_services': return Icons.design_services;
      case 'analytics': return Icons.analytics;
      case 'phone_android': return Icons.phone_android;
      default: return Icons.school;
    }
  }

  // Helper method to convert string to Color
  static Color getColorFromString(String colorName) {
    switch (colorName) {
      case 'purple': return Colors.purple;
      case 'pink': return Colors.pink;
      case 'deepPurple': return Colors.deepPurple;
      case 'blue': return Colors.blue;
      case 'green': return Colors.green;
      case 'orange': return Colors.orange;
      default: return Colors.purple;
    }
  }
}