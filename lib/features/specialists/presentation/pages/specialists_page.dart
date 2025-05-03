import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_extension.dart';
import '../../../../core/widgets/responsive_layout.dart';

class SpecialistsPage extends StatelessWidget {
  const SpecialistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _SpecialistsMobileView(),
      tablet: _SpecialistsTabletView(),
      desktop: _SpecialistsDesktopView(),
    );
  }
}

class _SpecialistsMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.spacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Specialists',
                style: TextStyle(
                  fontSize: context.sp(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.spacing),
              // Use ConstrainedBox for list items to control maximum height
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: context.hp(0.8), // 80% of screen height
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.only(bottom: context.spacing),
                      child: Container(
                        height: context.sp(100), // Responsive height
                        padding: EdgeInsets.all(context.spacing),
                        child: const Center(child: Text('Specialist Card')),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpecialistsTabletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Filters panel with constrained width
          Container(
            width: context.wp(0.3),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(context.spacing),
              child: Column(
                children: [
                  Text(
                    'Filters',
                    style: TextStyle(
                      fontSize: context.sp(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: context.spacing),
                  // Add your filters here
                ],
              ),
            ),
          ),
          // Content area with grid layout
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(context.spacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Specialists',
                    style: TextStyle(
                      fontSize: context.sp(24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: context.spacing),
                  // Use GridView for tablet layout
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: context.spacing,
                      crossAxisSpacing: context.spacing,
                      childAspectRatio: 3 / 2,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          padding: EdgeInsets.all(context.spacing),
                          child: const Center(child: Text('Specialist Card')),
                        ),
                      );
                    },
                    itemCount: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecialistsDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Narrower filters panel for desktop
          Container(
            width: context.wp(0.2),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(context.spacing),
              child: Column(
                children: [
                  Text(
                    'Filters',
                    style: TextStyle(
                      fontSize: context.sp(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: context.spacing),
                  // Add your filters here
                ],
              ),
            ),
          ),
          // Wider content area with more columns
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(context.spacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Specialists',
                    style: TextStyle(
                      fontSize: context.sp(24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: context.spacing),
                  // Use GridView with more columns for desktop
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: context.spacing,
                      crossAxisSpacing: context.spacing,
                      childAspectRatio: 4 / 3,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          padding: EdgeInsets.all(context.spacing),
                          child: const Center(child: Text('Specialist Card')),
                        ),
                      );
                    },
                    itemCount: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
