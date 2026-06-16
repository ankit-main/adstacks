import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';
import '../core/responsive/responsive.dart';

import '../widgets/sidebar.dart';
import '../widgets/header/header_widget.dart';
import '../widgets/banner/top_rating_banner.dart';
import '../widgets/projects/all_projects_card.dart';
import '../widgets/creators/top_creators_card.dart';
import '../widgets/chart/performance_chart.dart';
import '../widgets/calendar/calendar_panel.dart';
import '../widgets/birthday/birthday_widget.dart';
import '../widgets/anniversary/anniversary_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return const MobileDashboard();
        }

        if (constraints.maxWidth < 1300) {
          return const TabletDashboard();
        }

        return const DesktopDashboard();
      },
    );
  }
}

class DesktopDashboard extends StatelessWidget {
  const DesktopDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SidebarWidget(),

          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(
                AppConstants.defaultPadding,
              ),
              child: Column(
                children: [
                  const HeaderWidget(),

                  const SizedBox(height: 20),

                  const TopRatingBanner(),

                  const SizedBox(height: 20),

                  Expanded(
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              // FIX: Use Flexible instead of Expanded
                              Flexible(
                                flex: 3,
                                child: AllProjectsCard(),
                              ),

                              const SizedBox(height: 10),

                              Flexible(
                                flex: 2,
                                child: PerformanceChart(),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 20),

                        const Expanded(
                          flex: 3,
                          child: TopCreatorsCard(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            width: AppConstants.rightPanelWidth,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const [
                  Expanded(
                    flex: 6,
                    child: CalendarPanel(),
                  ),

                  SizedBox(height: 16),

                  Expanded(
                    flex: 3,
                    child: BirthdayWidget(),
                  ),

                  SizedBox(height: 16),

                  Expanded(
                    flex: 2,
                    child: AnniversaryWidget(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabletDashboard extends StatelessWidget {
  const TabletDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SidebarWidget(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: const [
              HeaderWidget(),
              SizedBox(height: 20),

              TopRatingBanner(),
              SizedBox(height: 20),

              SizedBox(
                height: 280,
                child: AllProjectsCard(),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 280,
                child: TopCreatorsCard(),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 280,
                child: PerformanceChart(),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 380,
                child: CalendarPanel(),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 200,
                child: BirthdayWidget(),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 200,
                child: AnniversaryWidget(),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileDashboard extends StatelessWidget {
  const MobileDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SidebarWidget(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              HeaderWidget(),
              SizedBox(height: 20),

              TopRatingBanner(),
              SizedBox(height: 20),

              SizedBox(
                height: 250,
                child: AllProjectsCard(),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 250,
                child: TopCreatorsCard(),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 250,
                child: PerformanceChart(),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 320,
                child: CalendarPanel(),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 180,
                child: BirthdayWidget(),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 180,
                child: AnniversaryWidget(),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}