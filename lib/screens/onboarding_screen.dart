import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matunda/screens/create_account.dart';
import 'package:matunda/models/onboard_items_model.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});
  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  //method to load pages
  void _nextPage() {
    if (_currentPage < onboardingDataList.length - 1) {
      _pageController.nextPage(
          duration: const Duration(microseconds: 300), curve: Curves.ease);
      setState(() {
        _currentPage++;
      });
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => CreateAccount()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingDataList.length,
                itemBuilder: (context, index) {
                  return OnboardItemsWiget(
                    data: onboardingDataList[index],
                    pageIndex: index,
                    onNext: _nextPage,
                    currentPage: _currentPage,
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardItemsWiget extends StatelessWidget {
  final OnboardItems data;
  final int pageIndex;
  final currentPage;
  final VoidCallback onNext;

  OnboardItemsWiget(
      {required this.data,
      required this.pageIndex,
      required this.currentPage,
      required this.onNext});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SvgPicture.asset(
          data.svgAsset,
          height: 210,
          width: size.width * 0.7,
        ),
        const SizedBox(height: 20),
        Text(data.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
          child: Text(data.message,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.4),
                  fontWeight: FontWeight.w600)),
        ),
        SizedBox(height: size.height * 0.3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DotsIndicator(
                decorator: DotsDecorator(
                  color: const Color.fromARGB(255, 35, 94, 37).withOpacity(0.2),
                  activeColor: const Color.fromARGB(255, 35, 94, 37),
                ),
                dotsCount: onboardingDataList.length,
                position: currentPage,
              ),
              InkWell(
                onTap: onNext,
                child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 35, 94, 37),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
