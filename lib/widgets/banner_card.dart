import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff6C3EF4),
            Color(0xffC86DD7),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              "Top Rating Project",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Trending project and high rating",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: null,
              child: Text("Learn More"),
            )
          ],
        ),
      ),
    );
  }
}