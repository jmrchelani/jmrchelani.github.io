import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/data.dart';
import 'package:personal_portfolio/widgets/carousel_section.dart';
import 'package:personal_portfolio/widgets/copyright_section.dart';
import 'package:personal_portfolio/widgets/portfolio_card.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MediaQuery.of(context).size.width < kMaxWidth
            ? Padding(
                padding: const EdgeInsets.only(
                  bottom: kDefaultPadding * 2,
                  top: kDefaultPadding * 4,
                ),
                child: Column(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '— My Portfolio',
                          style: TextStyle(
                            fontSize: 16,
                            color: kRedColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        Text(
                          'Some of my distinguished work!',
                          style: TextStyle(
                            fontSize: 22,
                            color: kWhiteColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: kDefaultPadding * 2,
                    ),
                    ...portfolioDetails
                        .map((e) => Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding),
                            child: PortfolioCard(portfolio: e)))
                        .toList(),
                  ],
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '— My Portfolio',
                          style: TextStyle(
                            fontSize: 16,
                            color: kRedColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        Text(
                          'Some of my distinguished work!',
                          style: TextStyle(
                            fontSize: 22,
                            color: kWhiteColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding * 2,
                        ),
                        CarouselSection(
                          data: portfolioDetails,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        const CopyrightSection(),
      ],
    );
  }
}
