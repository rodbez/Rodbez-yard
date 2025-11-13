import 'package:flutter/material.dart';

class MonthlyLeaderBoard extends StatelessWidget {
  const MonthlyLeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> users = [
      {
        "rank": 1,
        "name": "Abhishek",
        "rides": 122,
        "rating": 4.9,
        "points": 36,
        "color": Colors.tealAccent,
        "avatar": "👨‍🦱",
      },
      {
        "rank": 2,
        "name": "Priya Sharma",
        "rides": 98,
        "rating": 4.7,
        "points": 36,
        "color": Colors.pinkAccent,
        "avatar": "👩‍🦰",
      },
      {
        "rank": 3,
        "name": "Rahul Verma",
        "rides": 110,
        "rating": 4.8,
        "points": 36,
        "color": Colors.blueAccent,
        "avatar": "👨🏽‍🦳",
      },
      {
        "rank": 4,
        "name": "Suman Rani",
        "rides": 99,
        "rating": 4.6,
        "points": 36,
        "color": Colors.purpleAccent,
        "avatar": "👩🏻",
      },
      {
        "rank": 5,
        "name": "Rohit Kumar",
        "rides": 130,
        "rating": 4.9,
        "points": 36,
        "color": Colors.orangeAccent,
        "avatar": "🧔🏽",
      },
    ];
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      /// Rank number
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade200,
                        child: Text(
                          user["rank"].toString(),
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      /// Avatar
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: user["color"],
                        child: Text(
                          user["avatar"],
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                      const SizedBox(width: 12),

                      /// Name + rides + rating
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user["name"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    "Rides: ${user["rides"]} | Rating: ${user["rating"]}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      /// Points
                      Text(
                        "${user["points"]} pts",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
