import 'package:flutter/material.dart';
import 'package:rodbez_yard/common/widgets/expandable_tile/expandable_tile.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';
import 'package:rodbez_yard/utils/constants/sizes.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      appBar: AppBar(
        title: Text("Help",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(RSizes.smallSpace),
        child: Column(
          children: [
            ExpandableTile(title: "How do I check my earnings?", description: "Go to the 'Earning' tab in the bottom menu. It shows your daily, weekly and monthly earnings summary. You can also download a detailed report in PDF.", subtitle: "Was this information useful?"),
            ExpandableTile(title: "How do I check active rides across my fleet?", description: "Go to the 'Earning' tab in the bottom menu. It shows your daily, weekly and monthly earnings summary. You can also download a detailed report in PDF.", subtitle: "Was this information useful?"),
            ExpandableTile(title: "How do I add/remove a driver from the system?", description: "Go to the 'Earning' tab in the bottom menu. It shows your daily, weekly and monthly earnings summary. You can also download a detailed report in PDF.", subtitle: "Was this information useful?"),
            ExpandableTile(title: "How do I view driver performance and ratings?", description: "Go to the 'Earning' tab in the bottom menu. It shows your daily, weekly and monthly earnings summary. You can also download a detailed report in PDF.", subtitle: "Was this information useful?"),
            ExpandableTile(title: "How to generate monthly earning reports?", description: "Go to the 'Earning' tab in the bottom menu. It shows your daily, weekly and monthly earnings summary. You can also download a detailed report in PDF.", subtitle: "Was this information useful?"),
            ExpandableTile(title: "How do I track a cab’s live location?", description: "Go to the 'Earning' tab in the bottom menu. It shows your daily, weekly and monthly earnings summary. You can also download a detailed report in PDF.", subtitle: "Was this information useful?"),
            ExpandableTile(title: "What if a cab breaks down mid-ride?", description: "Go to the 'Earning' tab in the bottom menu. It shows your daily, weekly and monthly earnings summary. You can also download a detailed report in PDF.", subtitle: "Was this information useful?"),
            ExpandableTile(title: "How can I communicate with drivers?", description: "Go to the 'Earning' tab in the bottom menu. It shows your daily, weekly and monthly earnings summary. You can also download a detailed report in PDF.", subtitle: "Was this information useful?"),
            ExpandableTile(title: "How to receive invoice in my email?", description: "Go to the 'Earning' tab in the bottom menu. It shows your daily, weekly and monthly earnings summary. You can also download a detailed report in PDF.", subtitle: "Was this information useful?"),
            ExpandableTile(title: "How can I view daily earnings per cab?", description: "Go to the 'Earning' tab in the bottom menu. It shows your daily, weekly and monthly earnings summary. You can also download a detailed report in PDF.", subtitle: "Was this information useful?"),

          ],
        ),
      ),
    );
  }
}
