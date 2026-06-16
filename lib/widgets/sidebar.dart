import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/sidebar_data.dart';
import '../../utils/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../providers/dashboard_provider.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardProvider>(context);

    return Container(
      width: AppConstants.sidebarWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),

          /// Logo
          Column(
  children: [
    Image.asset(
      "assets/images/logo.png",
      height: 70,
      fit: BoxFit.contain,
    ),

    const SizedBox(height: 10),

    const Text(
      "Adstacks",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
    ),
  ],
),

          const SizedBox(height: 20),

          Divider(
            color: Colors.grey.shade300,
            indent: 20,
            endIndent: 20,
          ),

          const SizedBox(height: 15),

          /// Profile Card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.orange,
                      width: 3,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: const AssetImage(
    "assets/images/profile.png",
  ),
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Pooja Mishra",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.primary,
                    ),
                  ),
                  child: const Text(
                    "Admin",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Divider(
            color: Colors.grey.shade300,
            indent: 20,
            endIndent: 20,
          ),

          const SizedBox(height: 10),

          /// Menu
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ...List.generate(
                  SidebarData.menuItems.length,
                  (index) {
                    final item = SidebarData.menuItems[index];

                    bool selected =
                        provider.selectedMenu == index;

                    return InkWell(
                      onTap: () {
                        provider.selectMenu(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? Colors.grey.shade100
                              : Colors.transparent,
                          borderRadius:
                              BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                color: selected
                                    ? Colors.black
                                    : Colors.transparent,
                                borderRadius:
                                    BorderRadius.circular(8),
                              ),
                              child: Icon(
                                item.icon,
                                size: 18,
                                color: selected
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),

                            const SizedBox(width: 16),

                            Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: selected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 12),

                /// WORKSPACES
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  color: const Color(0xffEEF0FF),
                  child: const Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "WORKSPACES",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.add),
                    ],
                  ),
                ),

                /// Adstacks
                ExpansionTile(
                  initiallyExpanded:
                      provider.adstacksExpanded,
                  title: const Text("Adstacks"),
                  children: [
                    workspaceTile(
                      "Dashboard",
                    ),
                    workspaceTile(
                      "Projects",
                    ),
                    workspaceTile(
                      "Teams",
                    ),
                  ],
                ),

                /// Finance
                ExpansionTile(
                  initiallyExpanded:
                      provider.financeExpanded,
                  title: const Text("Finance"),
                  children: [
                    workspaceTile(
                      "Revenue",
                    ),
                    workspaceTile(
                      "Invoices",
                    ),
                    workspaceTile(
                      "Reports",
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Bottom Buttons
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 25,
            ),
            child: Column(
              children: [
                bottomItem(
                  Icons.settings_outlined,
                  "Setting",
                ),

                const SizedBox(height: 16),

                bottomItem(
                  Icons.logout_outlined,
                  "Logout",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget workspaceTile(String title) {
    return ListTile(
      contentPadding:
          const EdgeInsets.only(left: 40, right: 20),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }

  static Widget bottomItem(
    IconData icon,
    String title,
  ) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}