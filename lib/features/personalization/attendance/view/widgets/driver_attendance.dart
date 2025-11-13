import 'package:flutter/material.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';

class DriverAttendance extends StatelessWidget {
  const DriverAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> attendanceData = List.generate(
      50,
      (index) => {"date": "01/05/2025", "present": 25, "absent": 10},
    );

    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Date", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    "Present",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Absent", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.separated(
                itemCount: attendanceData.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final item = attendanceData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          item['date'],
                          style: const TextStyle(fontSize: 14),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 10,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${item['present']}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Colors.red,
                              size: 10,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${item['absent']}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
