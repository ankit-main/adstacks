import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../data/project_data.dart';
import '../../models/project_model.dart';

class AllProjectsCard extends StatelessWidget {
  const AllProjectsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 18,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "All Projects",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See All"),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: ProjectData.projects.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: 16),
              itemBuilder: (context, index) {
                return ProjectItem(
                  project: ProjectData.projects[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final ProjectModel project;

  const ProjectItem({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    double cardWidth;

    if (width < 768) {
      cardWidth = 220;
    } else if (width < 1200) {
      cardWidth = 240;
    } else {
      cardWidth = 260;
    }

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: project.highlighted
            ? AppColors.projectRed
            : AppColors.navy,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(14),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: Image.network(
                  project.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              project.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 2),

            Text(
              project.projectId,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),

            const Spacer(),

            Row(
              children: [
                _avatar(
                  "https://randomuser.me/api/portraits/men/11.jpg",
                ),
                _avatar(
                  "https://randomuser.me/api/portraits/women/44.jpg",
                ),
                _avatar(
                  "https://randomuser.me/api/portraits/men/36.jpg",
                ),

                const Spacer(),

                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.edit_outlined,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatar(String image) {
    return Align(
      widthFactor: .75,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 12,
          backgroundImage:
              NetworkImage(image),
        ),
      ),
    );
  }
}