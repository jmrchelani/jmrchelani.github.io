import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/screens/home_page.dart';
import 'package:personal_portfolio/screens/portfolio_page.dart';
import 'package:personal_portfolio/widgets/navbar_section.dart';

// TODO: Add Blog Page

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void _changePage(i) {
    setState(() {
      currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> navItems = [
      {
        'text': 'Home',
        'onPressed': () {
          _changePage(0);
        },
        'index': 0
      },
      {
        'text': 'Portfolio',
        'onPressed': () {
          _changePage(1);
        },
        'index': 1
      },
      // {
      //   'text': 'Blog',
      //   'onPressed': () {
      //     _changePage(2);
      //   },
      //   'index': 2
      // },
    ];
    return Scaffold(
      backgroundColor: kBlueColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Container(
              // color: kGreyColor.withOpacity(0.5),
              constraints: const BoxConstraints(
                maxWidth: kMaxWidth,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NavBar(navItems: navItems, currentIndex: currentIndex),
                  currentIndex == 0
                      ? HomePage(
                          onPressedPortfolio: () => _changePage(1),
                        )
                      : const PortfolioPage()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
