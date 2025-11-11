import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppDialog extends StatelessWidget {
  final String title;
  // final String content;
  final Widget? children;

  const AppDialog({
    super.key,
    required this.title,
    // required this.content,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            Gap(16),
            if (children != null) children!,
          ],
        ),
      ),
    );
  }
}
