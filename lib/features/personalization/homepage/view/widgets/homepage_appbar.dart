import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';

class HomepageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomepageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 2, 5),
        child: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Container(
              decoration: BoxDecoration(
                color: RColors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Icon(Icons.menu, color: RColors.black),
            ),
          ),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: RColors.textDarkGrey),
            ),
            Text(
              "Dilkhush Kumar",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
