import 'package:flutter/material.dart';

class AppointmentsTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AppointmentsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [Tab(text: 'Actives'), Tab(text: 'Previews')],
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
