import 'package:flutter/material.dart';

class ProjectsCard extends StatelessWidget {
  const ProjectsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (_, i) {
          return ListTile(
            leading: const CircleAvatar(),
            title: Text("Blockchain Project ${i + 1}"),
            subtitle: const Text("See details"),
          );
        },
      ),
    );
  }
}