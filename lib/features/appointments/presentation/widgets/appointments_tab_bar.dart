import 'package:flutter/material.dart';

class AppointmentsTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AppointmentsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorColor: Colors.white,
      tabs: [Tab(text: 'Actives'), Tab(text: 'Previews')],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
