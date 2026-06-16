import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../data/creator_data.dart';
import '../../models/creator_model.dart';

class TopCreatorsCard extends StatelessWidget {
  const TopCreatorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.circular(28),
      ),
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            children: [
              const Text(
                "Top Creators",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// TABLE HEADER
          Row(
            children: const [
              Expanded(
                flex: 4,
                child: Text(
                  "Name",
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "Artworks",
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "Rating",
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Expanded(
            child: ListView.separated(
              itemCount: CreatorData.creators.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: 15),
              itemBuilder: (context, index) {
                return CreatorRow(
                  creator:
                      CreatorData.creators[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CreatorRow extends StatelessWidget {
  final CreatorModel creator;

  const CreatorRow({
    super.key,
    required this.creator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          /// USER
          Expanded(
            flex: 4,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      NetworkImage(
                    creator.image,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    creator.username,
                    overflow:
                        TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight:
                          FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// ARTWORKS
          Expanded(
            flex: 2,
            child: Text(
              creator.artworks.toString(),
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ),

          /// RATING
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(
                            20),
                    child:
                        LinearProgressIndicator(
                      value:
                          creator.rating / 5,
                      minHeight: 8,
                      backgroundColor:
                          Colors.white12,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                Text(
                  creator.rating
                      .toStringAsFixed(1),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}