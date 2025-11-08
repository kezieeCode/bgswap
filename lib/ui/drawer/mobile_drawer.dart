import 'package:flutter/material.dart';
import '../../routing/app_routes.dart';
import 'drawer_group.dart';
import 'drawer_item.dart';

/// Mobile full-screen overlay drawer with manual animation.
class MobileDrawer extends StatefulWidget {
  final bool visible;
  final ValueChanged<String> onNavigate;
  final VoidCallback onClose;
  final String? activeRoute;

  const MobileDrawer({
    super.key,
    required this.visible,
    required this.onNavigate,
    required this.onClose,
    required this.activeRoute,
  });

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 260),
  );

  @override
  void didUpdateWidget(covariant MobileDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible && !_controller.isCompleted) {
      _controller.forward();
    } else if (!widget.visible && !_controller.isDismissed) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color scrimColor = Colors.black54;
    const Color background = Color(0xFF0F1115);
    const Color panelColor = Color(0xFF171A21);
    const double drawerWidth = 320;

    return IgnorePointer(
      ignoring: !widget.visible && _controller.isDismissed,
      child: Stack(
        children: [
          // Scrim
          FadeTransition(
            opacity: _controller,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.onClose,
              child: Container(color: scrimColor),
            ),
          ),

          // Sliding panel
          Align(
            alignment: Alignment.centerLeft,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: Curves.easeOutCubic,
                reverseCurve: Curves.easeInCubic,
              )),
              child: SafeArea(
                child: Container(
                  width: drawerWidth,
                  height: double.infinity,
                  color: background,
                  child: Material(
                    color: Colors.transparent,
                    child: _buildContent(panelColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(Color panelColor) {
    const Color textPrimary = Color(0xFFE6EAF2);
    const EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: 24);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top bar: close button
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: textPrimary),
                onPressed: widget.onClose,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),

        const SizedBox(height: 8),
        // Title
        const Padding(
          padding: sidePadding,
          child: Text(
            'Croswap',
            style: TextStyle(
              color: textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Explorer group
        DrawerGroup(
          title: 'Explorer',
          initiallyExpanded: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: DrawerItem(
                label: 'Explorer',
                active: widget.activeRoute == AppRoutes.explorer,
                onTap: () => _navigate(AppRoutes.explorer),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: DrawerItem(
                label: 'Bridges',
                active: widget.activeRoute == AppRoutes.bridges,
                onTap: () => _navigate(AppRoutes.bridges),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: DrawerItem(
                label: 'Network',
                active: widget.activeRoute == AppRoutes.network,
                onTap: () => _navigate(AppRoutes.network),
              ),
            ),
          ],
        ),
        const Spacer(),

        // Bottom padding to look good on tall screens
        const SizedBox(height: 16),
      ],
    );
  }

  void _navigate(String route) {
    widget.onClose();
    widget.onNavigate(route);
  }
}


