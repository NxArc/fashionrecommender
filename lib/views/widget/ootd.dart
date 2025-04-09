import 'package:fasionrecommender/data/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Ootd extends StatefulWidget {
  const Ootd({super.key});

  @override
  State<Ootd> createState() => _OotdState();
}

class _OotdState extends State<Ootd> {
  String location = 'Batangas City';
  String date = 'Today, Jan 1';
  int temp = 38;
  String imageDirect = 'assets/images/onboard-bg.jpg';
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ValueListenableBuilder(
        valueListenable: isDarkModeNotifier,
        builder: (context, value, child) {
          return Container(
            decoration: BoxDecoration(
              color: value? Colors.white : Colors.white70,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: SizedBox(
              height: 220,
              child: Row(
                children: [
                  // Left side
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 25,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today, ${DateFormat('MMM').format(now)} ${now.day}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 18,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 4),
                              Text(
                                location,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Weather',
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                          Row(
                            children: [
                              Text(
                                '$temp°C',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.wb_sunny, color: Colors.orange, size: 22),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            'OOTD calendar',
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 5),
                          Icon(
                            Icons.calendar_month,
                            size: 28,
                            color: Colors.black87,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Right side: outfit image
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), // Adjust the radius for rounded corners
                          image: DecorationImage(
                            image: AssetImage(imageDirect), // Use the uploaded image
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
