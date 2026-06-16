import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/app_colors.dart';

class CalendarPanel extends StatefulWidget {
  const CalendarPanel({super.key});

  @override
  State<CalendarPanel> createState() => _CalendarPanelState();
}

class _CalendarPanelState extends State<CalendarPanel> {
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "GENERAL 10:00 AM TO 7:00 PM",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),

          const SizedBox(height: 12),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2020),
                    lastDay: DateTime.utc(2035),
                    focusedDay: focusedDay,

                    selectedDayPredicate: (day) =>
                        isSameDay(selectedDay, day),

                    onDaySelected: (selected, focused) {
                      setState(() {
                        selectedDay = selected;
                        focusedDay = focused;
                      });
                    },

                    rowHeight: 38,

                    headerStyle: const HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,

                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),

                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),

                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ),

                    calendarStyle: CalendarStyle(
                      outsideTextStyle:
                          const TextStyle(
                        color: Colors.white24,
                      ),

                      defaultTextStyle:
                          const TextStyle(
                        color: Colors.white,
                      ),

                      weekendTextStyle:
                          const TextStyle(
                        color: Colors.white,
                      ),

                      selectedDecoration:
                          const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),

                      todayDecoration:
                          BoxDecoration(
                        color:
                            Colors.white.withOpacity(.15),
                        shape: BoxShape.circle,
                      ),

                      todayTextStyle:
                          const TextStyle(
                        color: Colors.white,
                      ),
                    ),

                    daysOfWeekStyle:
                        const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                      weekendStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    padding:
                        const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius:
                          BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 4,
                          height: 50,
                          decoration:
                              BoxDecoration(
                            color: Colors.pink,
                            borderRadius:
                                BorderRadius
                                    .circular(20),
                          ),
                        ),

                        const SizedBox(width: 12),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              Text(
                                "Project Meeting",
                                overflow:
                                    TextOverflow
                                        .ellipsis,
                                style: TextStyle(
                                  color:
                                      Colors.white,
                                  fontWeight:
                                      FontWeight
                                          .w600,
                                ),
                              ),

                              SizedBox(height: 4),

                              Text(
                                "09:00 AM - 10:00 AM",
                                overflow:
                                    TextOverflow
                                        .ellipsis,
                                style: TextStyle(
                                  color: Colors
                                      .white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
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