import 'package:bording_week1/bloc/notification/notification_bloc.dart';
import 'package:bording_week1/bloc/notification/notification_event.dart';
import 'package:bording_week1/bloc/notification/notification_state.dart';
import 'package:bording_week1/common/const/appcolors.dart';
import 'package:bording_week1/common/const/styles/texts/medium_font.dart';
import 'package:bording_week1/common/utils/dateformatter.dart';
import 'package:bording_week1/data/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// NotificationsScreen displays the list of notifications fetched from API
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      // Provide NotificationBloc and trigger fetching notifications
      create:
          (context) =>
              NotificationBloc(ApiService())..add(FetchNotifications()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // Custom AppBar for Notifications Screen
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Back button with circular background
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Appcolors.appgreen,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Screen title
                    MediumFont(text: "Notifications", fontsize: 20),
                  ],
                ),
              ),

              // BlocBuilder to reactively display notifications based on state
              BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  // Loading state: show progress indicator
                  if (state is NotificationLoading) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Appcolors.appgreen,
                        ),
                      ),
                    );
                  }
                  // Loaded state: show list of notifications
                  else if (state is NotificationLoaded) {
                    return Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: 10,
                        separatorBuilder:
                            (context, index) => const Divider(thickness: 1),
                        itemBuilder: (context, index) {
                          final item = state.notifications[index];
                          return Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Notification icon/image
                                Image.asset(
                                  "assets/${item.image}",
                                  fit: BoxFit.cover,
                                  width: screenWidth * 0.06,
                                ),
                                const SizedBox(width: 12),

                                // Notification title, body, and timestamp
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item.body,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        DateFormatter.format(
                                          DateTime.parse(item.timestamp),
                                        ).toString(),
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                  // Error state: display error message
                  else if (state is NotificationError) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          "Error: ${state.message}",
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  }

                  // Default state: show placeholder message
                  return const Expanded(
                    child: Center(child: Text("Press button to fetch data")),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
