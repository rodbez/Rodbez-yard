import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;

  const DrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = RColors.darkYellow,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(Icons.navigate_next),
      onTap: () {
        Navigator.of(context).pop();
        Future.delayed(const Duration(milliseconds: 200), onTap);
      },
    );
  }
}
