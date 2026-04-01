import 'package:ecommerse/core/constants/assets.dart';
import 'package:ecommerse/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  int _indext = 1;

  final List<OnboardingModel> _pages = [
    OnboardingModel(
      image: Assets.imagesOnboarding1,
      title: "Welcome to Marketi",
      subtitle:
          "Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.",
      index: 0,
    ),
    OnboardingModel(
      image: Assets.imagesOnboarding2,
      title: "Welcome to Marketi",
      subtitle:
          "Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.",
      index: 1,
    ),
    OnboardingModel(
      image: Assets.imagesOnboarding3,
      title: "Welcome to Marketi",
      subtitle:
          "Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.",
      index: 2,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (v) {
              setState(() {
                _indext = v;
              });
            },
            controller: _pageController,
            itemCount: _pages.length,
            itemBuilder: (_, i) {
              return _pages[i];
            },
          ),
        ],
      ),
    );
  }
}

class OnboardingModel extends StatelessWidget {
  const OnboardingModel({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.index,
    this.total = 3,
  });
  final String image;
  final String title;
  final String subtitle;
  final int index;
  final int total;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: Column(
        children: [
          SizedBox(height: 100),
          // Image
          Image.asset(image),
          SizedBox(height: 40),
          // Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(total, (i) {
              return CustomIndecator(active: i == index);
            }),
          ),
          // Title
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: 16),
          // Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Spacer(),
          // Button
          CustomButton(text: "Next", onPressed: () {}),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textPrimary,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class CustomIndecator extends StatelessWidget {
  const CustomIndecator({super.key, required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: active ? 18 : 16,
          height: active ? 18 : 16,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: active
                ? AppColors.secondary
                : AppColors.primary.withAlpha(100),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
