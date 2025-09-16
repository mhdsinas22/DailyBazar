import 'package:bording_week1/bloc/notification/notification_bloc.dart';
import 'package:bording_week1/bloc/notification/notification_event.dart';
import 'package:bording_week1/bloc/notification/notification_state.dart';
import 'package:bording_week1/common/const/appcolors.dart';
import 'package:bording_week1/common/const/styles/texts/medium_font.dart';
import 'package:bording_week1/data/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              NotificationBloc(ApiService())..add(FetchNotifications()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
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
                    // Back button circle
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
                    MediumFont(text: "Notifications", fontsize: 20),
                  ],
                ),
              ),
              BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  if (state is NotificationLoading) {
                    return Expanded(
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Appcolors.appgreen,
                        ),
                      ),
                    );
                  } else if (state is NotificationLoaded) {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder:
                            (context, index) => const Divider(thickness: 1),
                        padding: const EdgeInsets.all(8),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          final item = state.notifications[index];
                          // String baseUrl =
                          //     "https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json/images/";
                          // String imageName = item.image; // API-l ninn vannu
                          // String fullImageUrl = "$baseUrl$imageName";
                          return Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Icon / Image
                                CircleAvatar(
                                  radius: 24,
                                  backgroundImage: NetworkImage(
                                    "https://raw.githubusercontent.com/sayanp23/test-api/main/images/${item.image}",
                                  ),
                                  onBackgroundImageError: (_, __) {
                                    print("Image load failed");
                                  },
                                ),
                                const SizedBox(width: 12),

                                // Title + Body + Time
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is NotificationError) {
                    print("HER IS ERROR:-${state.message}");
                    return Expanded(
                      child: Center(child: Text("Error: ${state.message}")),
                    );
                  }
                  return Expanded(
                    child: const Center(
                      child: Text("Press button to fetch data"),
                    ),
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
