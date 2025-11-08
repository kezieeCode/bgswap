import 'package:flutter/material.dart';
import '../../ui/drawer/mobile_drawer.dart';
import '../../routing/app_routes.dart';

class ExplorerPage extends StatelessWidget {
  const ExplorerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileShell(title: 'Explorer', activeRoute: AppRoutes.explorer);
  }
}

class BridgesPage extends StatelessWidget {
  const BridgesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileShell(title: 'Bridges', activeRoute: AppRoutes.bridges);
  }
}

class NetworkPage extends StatelessWidget {
  const NetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileShell(title: 'Network', activeRoute: AppRoutes.network);
  }
}

class MobileShell extends StatefulWidget {
  final String title;
  final String activeRoute;
  const MobileShell({super.key, required this.title, required this.activeRoute});

  @override
  State<MobileShell> createState() => _MobileShellState();
}

class _MobileShellState extends State<MobileShell> {
  bool drawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFF0F1115),
          appBar: AppBar(
            backgroundColor: const Color(0xFF171A21),
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => setState(() => drawerOpen = true),
            ),
            title: Text(widget.title, style: const TextStyle(color: Colors.white)),
          ),
          body: Center(
            child: Text(
              widget.title,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),

        // Drawer overlay
        MobileDrawer(
          visible: drawerOpen,
          activeRoute: widget.activeRoute,
          onClose: () => setState(() => drawerOpen = false),
          onNavigate: (route) {
            if (ModalRoute.of(context)?.settings.name == route) return;
            Navigator.of(context).pushReplacementNamed(route);
          },
        ),
      ],
    );
  }
}


