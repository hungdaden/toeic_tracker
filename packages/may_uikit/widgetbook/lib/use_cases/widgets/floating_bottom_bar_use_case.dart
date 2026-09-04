import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Interactive playground for [FloatingBottomBarV2].
@UseCase(
  name: 'Playground',
  type: FloatingBottomBarV2,
)
Widget floatingBottomBarUseCase(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColorsV2.themeLightBackground,
    body: Center(
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(AppSpacingV2.md),
                  child: CardInfoV2(
                    title: 'Dummy Item $index',
                    rows: const [
                      RegistrationInfoRowData(
                        items: [CardInfoEntry(label: 'Test', value: 'Value')],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _FloatingBottomBarWrapper(),
          ),
        ],
      ),
    ),
  );
}

class _FloatingBottomBarWrapper extends StatefulWidget {
  /// Creates the mutable state used by the floating bottom bar demo.
  @override
  State<_FloatingBottomBarWrapper> createState() => _FloatingBottomBarWrapperState();
}

class _FloatingBottomBarWrapperState extends State<_FloatingBottomBarWrapper> {
  int currentIndex = 0;

  /// Builds the demo wrapper around [FloatingBottomBarV2].
  @override
  Widget build(BuildContext context) {
    return FloatingBottomBarV2(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: const [
        FloatingBottomBarItemV2(
          title: 'Home',
          activeIcon: Icon(Icons.home, color: AppColorsV2.genericWhite),
          inactiveIcon: Icon(Icons.home_outlined, color: AppColorsV2.neutral500),
        ),
        FloatingBottomBarItemV2(
          title: 'Search',
          activeIcon: Icon(Icons.search, color: AppColorsV2.genericWhite),
          inactiveIcon: Icon(Icons.search, color: AppColorsV2.neutral500),
        ),
        FloatingBottomBarItemV2(
          title: 'Profile',
          activeIcon: Icon(Icons.person, color: AppColorsV2.genericWhite),
          inactiveIcon: Icon(Icons.person_outline, color: AppColorsV2.neutral500),
        ),
      ],
    );
  }
}
