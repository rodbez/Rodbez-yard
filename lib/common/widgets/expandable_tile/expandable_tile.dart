import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ExpandableTile extends StatefulWidget {
  final String title;
  final String description;
  final String subtitle;

  const ExpandableTile({
    super.key,
    required this.title,
    required this.description,
    required this.subtitle,
  });

  @override
  State<ExpandableTile> createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<ExpandableTile> {
  bool _isExpanded = false;
  bool? _liked;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: RColors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(
          left: RSizes.sm,
          right: RSizes.sm,
          top: RSizes.xs,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Responsive Title
                    Expanded(
                      child: Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),

                    /// Expand/Collapse Icon
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ],
                ),
              ),
            ),

            /// Expanded Content
            if (_isExpanded) ...[
              Text(
                widget.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Text(
                widget.subtitle,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 12),

              /// Feedback Buttons
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () => setState(() => _liked = true),
                    icon: Icon(
                      Icons.thumb_up,
                      color:
                      _liked == true
                          ? RColors.successStatus
                          : RColors.darkGrey,
                    ),
                    label: Text(
                      "Yes",
                      style: TextStyle(
                        color:
                        _liked == true
                            ? RColors.successStatus
                            : RColors.darkGrey,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => setState(() => _liked = false),
                    icon: Icon(
                      Icons.thumb_down,
                      color: _liked == false ? RColors.error : RColors.darkGrey,
                    ),
                    label: Text(
                      "No",
                      style: TextStyle(
                        color:
                        _liked == false ? RColors.error : RColors.darkGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
