import 'package:flutter/material.dart';

class DrawerGroup extends StatefulWidget {
  final String title;
  final bool initiallyExpanded;
  final List<Widget> children;

  const DrawerGroup({
    super.key,
    required this.title,
    this.initiallyExpanded = false,
    required this.children,
  });

  @override
  State<DrawerGroup> createState() => _DrawerGroupState();
}

class _DrawerGroupState extends State<DrawerGroup> {
  late bool expanded;

  @override
  void initState() {
    super.initState();
    expanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    const Color panelColor = Color(0xFF171A21);
    const Color textPrimary = Color(0xFFE6EAF2);
    const Color secondaryText = Color(0xFF8B93A7);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => setState(() => expanded = !expanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        color: textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 200),
                    turns: expanded ? 0.5 : 0.0,
                    child: const Icon(Icons.expand_more, color: secondaryText),
                  ),
                ],
              ),
            ),
          ),
          if (expanded) ...[
            const SizedBox(height: 4),
            ...widget.children,
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}


