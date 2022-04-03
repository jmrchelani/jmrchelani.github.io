import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/widgets/gfitems_carousel.dart';
import 'package:personal_portfolio/widgets/portfolio_card.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Map<String, dynamic>> data;

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: kMaxWidth,
      child: GFItemsCarousel(
        rowCount: 3,
        children: widget.data
            .map(
              (s) => PortfolioCard(
                portfolio: s,
              ),
            )
            .toList(),
        itemHeight: 370,
        padding: const EdgeInsets.all(kDefaultPadding),
        height: 400,
        width: kMaxWidth,
      ),
    );
  }
}
