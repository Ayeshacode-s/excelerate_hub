// lib/screens/programs_tab.dart
import 'package:flutter/material.dart';
import 'package:exclelerate_learning_hub/services/api_service.dart';
import 'program_details_screen.dart'; // Make sure this import is correct

class ProgramsTab extends StatefulWidget {
  @override
  _ProgramsTabState createState() => _ProgramsTabState();
}

class _ProgramsTabState extends State<ProgramsTab> {
  List<Map<String, dynamic>> _programs = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _loadPrograms();
  }

  Future<void> _loadPrograms() async {
    try {
      setState(() {
        _isLoading = true;
        _error = '';
      });

      final programs = await ApiService.getPrograms();

      setState(() {
        _programs = programs;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load programs. Please try again.';
        _isLoading = false;
      });
    }
  }

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
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadPrograms,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
            ),
            SizedBox(height: 16),
            Text(
              'Loading programs...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    if (_error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            SizedBox(height: 16),
            Text(
              _error,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadPrograms,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: Text('Try Again'),
            ),
          ],
        ),
      );
    }

    if (_programs.isEmpty) {
      return Center(
        child: Text(
          'No programs available',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadPrograms,
      color: Colors.purple,
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _programs.length,
        itemBuilder: (context, index) {
          return _buildProgramCard(_programs[index], context);
        },
      ),
    );
  }

  Widget _buildProgramCard(Map<String, dynamic> program, BuildContext context) {
    // Convert API data to safe format
    final IconData programIcon = ApiService.getIconFromString(program['icon'] ?? 'school');
    final Color programColor = ApiService.getColorFromString(program['color'] ?? 'purple');

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
            color: programColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(programIcon, color: programColor),
        ),
        title: Text(
          program['title'] ?? 'Unknown Program',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(program['category'] ?? 'General'),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.timer, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text(program['duration'] ?? 'Duration not specified'),
                SizedBox(width: 16),
                Icon(Icons.school, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text(program['level'] ?? 'All Levels'),
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