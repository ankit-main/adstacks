import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../core/responsive/responsive.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? const _MobileHeader()
        : const _DesktopHeader();
  }
}

class _DesktopHeader extends StatelessWidget {
  const _DesktopHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// TITLE
        const Text(
          "Home",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),

        const Spacer(),

        /// SEARCH
        Container(
          width: 340,
          height: 52,
          decoration: BoxDecoration(
            color: const Color(0xffF2F3FF),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                color: Colors.grey.shade600,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        /// SEARCH BTN
        _circleButton(
          icon: Icons.search,
          color: AppColors.primary,
        ),

        const SizedBox(width: 10),

        /// MESSAGE
        _circleButton(
          icon: Icons.mail_outline,
        ),

        const SizedBox(width: 10),

        /// NOTIFICATION
        Stack(
          children: [
            _circleButton(
              icon: Icons.notifications_none,
            ),

            Positioned(
              right: 10,
              top: 10,
              child: Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(width: 10),

        /// POWER
        _circleButton(
          icon: Icons.power_settings_new,
        ),

        const SizedBox(width: 14),

        /// PROFILE
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.orange,
              width: 2,
            ),
          ),
          child: const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              "https://randomuser.me/api/portraits/women/44.jpg",
            ),
          ),
        ),
      ],
    );
  }
}

class _MobileHeader extends StatelessWidget {
  const _MobileHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                );
              },
            ),

            const Text(
              "Home",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),

            const Spacer(),

            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                "https://randomuser.me/api/portraits/women/44.jpg",
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        Container(
          height: 52,
          decoration: BoxDecoration(
            color: const Color(0xffF2F3FF),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _circleButton({
  required IconData icon,
  Color? color,
}) {
  return Container(
    height: 46,
    width: 46,
    decoration: BoxDecoration(
      color: color ?? Colors.white,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 10,
        ),
      ],
    ),
    child: Icon(
      icon,
      color: color != null
          ? Colors.white
          : Colors.black87,
    ),
  );
}