import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
    
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800,
            Colors.purple.shade900,
          ],
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 16), 
        child: Column(
          children: [
            _buildProfileHeader(),
            SizedBox(height: 24),
            _buildStatsSection(),
            SizedBox(height: 24),
            _buildMenuSection(),
          ],
        ),
      ),
    );
  }

  // A reusable glassmorphism-style card widget for a modern, layered look.
  // It uses a semi-transparent fill and a subtle border.
  Widget _buildGlassCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1.0,
        ),
      ),
      child: child,
    );
  }

  Widget _buildProfileHeader() {
    return _buildGlassCard(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
              
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: Icon(
                    Icons.person_outline,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                 
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'john.doe@excerlate.com',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
               
                IconButton(
                  icon: Icon(Icons.edit_outlined, color: Colors.white.withOpacity(0.8)),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16),
           
            Chip(
              avatar: Icon(Icons.school_outlined, color: Colors.white.withOpacity(0.8), size: 18),
              label: Text('Intermediate Learner'),
              backgroundColor: Colors.white.withOpacity(0.15),
              labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return _buildGlassCard(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem('5', 'Courses'),
            _buildStatItem('12', 'Completed'),
            _buildStatItem('85%', 'Progress'),
            _buildStatItem('3', 'Certificates'),
          ],
        ),
      ),
    );
  }


  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 6),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuSection() {
  
    final menuItems = [
      {'icon': Icons.settings_outlined, 'title': 'Settings', 'color': Colors.cyanAccent},
      {'icon': Icons.help_outline, 'title': 'Help & Support', 'color': Colors.lightGreenAccent},
      {'icon': Icons.share_outlined, 'title': 'Share App', 'color': Colors.orangeAccent},
      {'icon': Icons.star_border_outlined, 'title': 'Rate App', 'color': Colors.yellowAccent},
      {'icon': Icons.logout, 'title': 'Logout', 'color': Colors.pinkAccent},
    ];

    return _buildGlassCard(
      child: Column(
        children: menuItems.map((item) {
          final isLastItem = item == menuItems.last;
          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                leading: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: (item['color'] as Color).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(item['icon'] as IconData, color: item['color'] as Color, size: 24),
                ),
                title: Text(
                  item['title'] as String,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white.withOpacity(0.5)),
                onTap: () {
                  // Handle menu item tap
                },
              ),

              if (!isLastItem)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(color: Colors.white.withOpacity(0.1), height: 1),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
