import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioCard extends StatefulWidget {
  const PortfolioCard({
    Key? key,
    required this.portfolio,
  }) : super(key: key);

  final dynamic portfolio;

  @override
  State<PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  var _hovering = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!(await launch(widget.portfolio['url']))) {
          throw 'Could not launch ${widget.portfolio['url']}';
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (e) {
          setState(() {
            _hovering = true;
          });
        },
        onExit: (e) {
          setState(() {
            _hovering = false;
          });
        },
        onHover: (e) {
          setState(() {
            _hovering = true;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          transform: Transform.translate(
            offset: _hovering ? const Offset(-10, -10) : Offset.zero,
          ).transform,
          decoration: BoxDecoration(
            color: kGreyColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            // boxShadow: kElevationToShadow[24],
          ),
          child: SizedBox(
            height: 350,
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.portfolio['title'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 16,
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.portfolio['description'],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: kGreyColor,
                    ),
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        widget.portfolio['img'],
                        height: 150,
                        width: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
