import 'package:flutter/material.dart';

import '../../../../core/widgets/responsive_layout.dart';
import '../widgets/doctors_list.dart';
import '../widgets/home_banner.dart';
import '../widgets/home_bottom_nav.dart';
import '../widgets/home_header.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/top_specialties.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobile: _HomeMobileView(),
        tablet: _HomeTabletView(),
        desktop: _HomeDesktopView(),
      ),
      bottomNavigationBar: const HomeBottomNav(),
    );
  }
}

class _HomeMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(),
          HomeSearchBar(),
          SizedBox(height: 8),
          HomeBanner(),
          TopSpecialties(),
          DoctorsList(),
        ],
      ),
    );
  }
}

class _HomeTabletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeader(),
          const HomeSearchBar(),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: const [HomeBanner(), TopSpecialties()],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(flex: 2, child: DoctorsList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeader(),
          const HomeSearchBar(),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: const [HomeBanner(), TopSpecialties()],
                  ),
                ),
                SizedBox(width: 24),
                Expanded(child: DoctorsList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
