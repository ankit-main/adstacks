import 'package:flutter/material.dart';
import '../core/responsive/responsive.dart';

class TopCreatorsCard extends StatelessWidget {
  const TopCreatorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    
    final creators = [
      {'name': 'Alice Johnson', 'projects': 12},
      {'name': 'Bob Smith', 'projects': 8},
      {'name': 'Carol White', 'projects': 5},
      {'name': 'David Brown', 'projects': 3},
      {'name': 'Eve Davis', 'projects': 1},
    ];

    final itemCount = isMobile ? 3 : (isTablet ? 4 : 5);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Top Creators',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: isMobile ? 10 : 12,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 16),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  final creator = creators[index];
                  return ListTile(
                    dense: true,
                    leading: Container(
                      width: isMobile ? 32 : 40,
                      height: isMobile ? 32 : 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pravatar.cc/150?img=${index + 1}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      creator['name']!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: isMobile ? 13 : 14,
                      ),
                    ),
                    subtitle: Text(
                      '${creator['projects']} Projects',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: isMobile ? 11 : 12,
                      ),
                    ),
                    trailing: Icon(
                      Icons.more_horiz,
                      color: Colors.grey[400],
                      size: isMobile ? 18 : 24,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}