import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/src/features/language/language_popup_menu.dart';
import 'package:octattoo_app/src/features/language/localization.dart';
import 'package:octattoo_app/src/features/onboarding/presentation/onboarding_artist_name_screen.dart';
import 'package:octattoo_app/src/features/onboarding/presentation/onboarding_workplaces_screen.dart';
import 'package:octattoo_app/src/features/router/app_router.dart';
import 'package:octattoo_app/src/theme/theme_toggle_button.dart';

class OnboardingWrapperScreen extends ConsumerStatefulWidget {
  const OnboardingWrapperScreen({super.key});

  @override
  OnboardingWrapperScreenState createState() => OnboardingWrapperScreenState();
}

class OnboardingWrapperScreenState extends ConsumerState<OnboardingWrapperScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    const OnboardingArtistNameScreen(),
    const OnboardingWorkplacesScreen(),
    // Add other onboarding steps as widgets
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Completed onboarding, navigate to the next screen in the app
      context.goNamed(RoutePath.artistProfile.name);
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.onboardingTitle),
        automaticallyImplyLeading: true,
        leading: _currentPage > 0 ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _goToPreviousPage,
        ) : null,
        actions: const [
          ThemeModeToggleButton(),
          LanguagePopupMenu(),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            _currentPage = page;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _currentPage > 0 ? _goToPreviousPage : null,
                child: const Text('Back'),
              ),
              ElevatedButton(
                onPressed: _goToNextPage,
                child: Text(_currentPage < _pages.length - 1 ? 'Next'.hardcoded : 'Finish'.hardcoded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
