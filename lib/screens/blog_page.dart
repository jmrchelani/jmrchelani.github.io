import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/widgets/copyright_section.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = kDefaultPadding;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 3;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 240;
    var _aspectRatio = _width / cellHeight;
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '— Blog',
                    style: TextStyle(
                      fontSize: 16,
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  const Text(
                    'Some of my articles, thoughts and so on :)',
                    style: TextStyle(
                      fontSize: 22,
                      color: kWhiteColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  SizedBox(
                    width: kMaxWidth,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _crossAxisCount,
                        childAspectRatio: _aspectRatio,
                        crossAxisSpacing: kDefaultPadding * 2,
                        mainAxisSpacing: kDefaultPadding * 2,
                      ),
                      itemBuilder: (context, index) => const BlogPostCard(
                        post: {
                          'title':
                              'Here is the title which is trying to be as long as it can xdddd but well i dont think it can go more than 2 lines!',
                          'description':
                              'Here is the description i try to write sometimes as code which is going to be somehow 3 plus lines long, though it is kinda hard but well I will try to make it though!!',
                        },
                      ),
                    ),
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

class BlogPostCard extends StatefulWidget {
  const BlogPostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  final dynamic post;

  @override
  State<BlogPostCard> createState() => _BlogPostCardState();
}

class _BlogPostCardState extends State<BlogPostCard> {
  var _hovering = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.post['title'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    color: kRedColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.post['description'],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: kGreyColor,
                  ),
                ),
                // Center(
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(15),
                //     child: Image.network(
                //       widget.portfolio['img'],
                //       height: 150,
                //       width: 200,
                //       fit: BoxFit.fill,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
