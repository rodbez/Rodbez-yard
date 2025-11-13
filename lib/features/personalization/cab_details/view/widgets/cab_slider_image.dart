import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';
import 'package:rodbez_yard/utils/constants/image_strings.dart';
import 'package:rodbez_yard/utils/constants/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarDetailsCarousel extends StatefulWidget {
  const CarDetailsCarousel({super.key});

  @override
  State<CarDetailsCarousel> createState() => _CarDetailsCarouselState();
}

class _CarDetailsCarouselState extends State<CarDetailsCarousel> {
  final PageController _controller = PageController();
  int currentPage = 0;
  late Timer autoScrollTimer;

  final List<String> carImages = [
    RImages.cabDetailsImage,
    RImages.cabDetailsImage,
    RImages.cabDetailsImage,
  ];

  @override
  void initState() {
    super.initState();
    autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentPage < carImages.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    autoScrollTimer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Car images
          PageView.builder(
            controller: _controller,
            itemCount: carImages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.asset(
                    carImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                  ),
                  // Overlay gradient
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withValues(alpha: 0.8),
                          Colors.transparent
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withValues(alpha: 0.4),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),

                  // Text + Button overlay
                  Positioned(
                    top: 40,
                    left: 16,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back,
                          color: Colors.white),
                    ),
                  ),
                  // Responsive Car Number Text
                  Positioned(
                    top: 40,
                    left: 40,
                    right: 40,
                    child: Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth - 20),
                            child: Text(
                              'BR01 AA XXXX',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: RColors.darkYellow,
                        borderRadius: BorderRadius.circular(RSizes.borderRadiusMd),
                      ),
                      child: const Text(
                        'Received',
                        style: TextStyle(
                            color: RColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              );
            },
            onPageChanged: (index) {
              setState(() => currentPage = index);
            },
          ),

          // Page indicator
          Positioned(
            bottom: 12,
            child: SmoothPageIndicator(
              controller: _controller,
              count: carImages.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: RColors.darkYellow,
                dotColor: Colors.white54,
                dotHeight: 6,
                dotWidth: 6,
                expansionFactor: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
