import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class TopRatingBanner extends StatelessWidget {
  const TopRatingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 768;
    final bool isTablet = width < 1200;

    return Container(
      height: isMobile
    ? 340
    : isTablet
        ? 300
        : 280,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.bannerStart,
            AppColors.bannerMiddle,
            AppColors.bannerEnd,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            left: -30,
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.08),
              ),
            ),
          ),

          Positioned(
            bottom: -60,
            right: 120,
            child: Container(
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.06),
              ),
            ),
          ),

          Positioned(
            top: 20,
            right: isMobile ? 30 : 250,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.1),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            child: isMobile
                ? Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ETHEREUM 2.0",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Top Rating\nProject",
                        style: TextStyle(
                          color: Colors.white,
                          height: 1.1,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        "Trending project and high rating project created by team.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 12),

                      SizedBox(
                        height: 120,
                        child: Center(
                          child: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/4712/4712109.png",
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.circular(
                                  30),
                        ),
                        child: const Text(
                          "Learn More",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            const Text(
                              "ETHEREUM 2.0",
                              style: TextStyle(
                                color:
                                    Colors.white70,
                                fontWeight:
                                    FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),

                            const SizedBox(
                                height: 10),

                            const Text(
                              "Top Rating\nProject",
                              style: TextStyle(
                                color:
                                    Colors.white,
                                height: 1.1,
                                fontSize: 34,
                                fontWeight:
                                    FontWeight.w700,
                              ),
                            ),

                            const SizedBox(
                                height: 12),

                            const SizedBox(
                              width: 320,
                              child: Text(
                                "Trending project and high rating project created by team.",
                                style: TextStyle(
                                  color: Colors
                                      .white70,
                                  fontSize: 13,
                                ),
                              ),
                            ),

                            const SizedBox(
                                height: 20),

                            Container(
                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                horizontal: 22,
                                vertical: 12,
                              ),
                              decoration:
                                  BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                            30),
                              ),
                              child: const Text(
                                "Learn More",
                                style: TextStyle(
                                  color:
                                      Colors.white,
                                  fontWeight:
                                      FontWeight
                                          .w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 2,
                        child: Image.network(
                          "https://cdn-icons-png.flaticon.com/512/4712/4712109.png",
                          fit: BoxFit.contain,
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