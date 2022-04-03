import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/data.dart';
import 'package:personal_portfolio/widgets/about_section.dart';
import 'package:personal_portfolio/widgets/copyright_section.dart';
import 'package:personal_portfolio/widgets/intro_section.dart';
import 'package:personal_portfolio/widgets/navbar_section.dart';
import 'package:personal_portfolio/widgets/skills_section.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;

  _changePage(i) {
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
      {
        'text': 'Blog',
        'onPressed': () {
          _changePage(2);
        },
        'index': 2
      },
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
                  currentIndex == 0 ? const HomePage() : const PortfolioPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        CopyrightSection(),
      ],
    );
  }
}

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
                    style: TextStyle(
                      fontSize: 16,
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.portfolio['description'],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
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

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        IntroSection(),
        SkillsSection(),
        AboutSection(),
        CopyrightSection(),
      ],
    );
  }
}

/// When a pointer has come to contact with screen and has begun to move.
///
/// The function provides the position of the touch when it first
/// touched the surface.
typedef GFItemsCarouselSlideStartCallback = void Function(
    DragStartDetails details);

/// When a pointer that is in contact with the screen and moving
/// has moved again.
///
/// The function provides the position of the touch and the distance it
/// has travelled since the last update.
typedef GFItemsCarouselSlideCallback = void Function(DragUpdateDetails details);

/// When a pointer that was previously in contact with the screen
/// and moving is no longer in contact with the screen.
///
/// The velocity at which the pointer was moving when it stopped contacting
/// the screen.
typedef GFItemsCarouselSlideEndCallback = void Function(DragEndDetails details);

class GFItemsCarousel extends StatefulWidget {
  /// Creates slide show of Images and [Widget] with animation for sliding.
  /// Shows multiple items on one slide, items number depends on rowCount.
  const GFItemsCarousel({
    Key? key,
    required this.rowCount,
    required this.children,
    this.onSlideStart,
    this.onSlide,
    this.onSlideEnd,
    this.itemHeight = 200,
    required this.padding,
    required this.height,
    required this.width,
  }) : super(key: key);

  final EdgeInsets padding;

  final double height, width;

  /// Count of visible cells
  final int rowCount;

  /// The widgets to be shown as sliders.
  final List<Widget> children;

  /// When a pointer has contacted the screen and has begun to move.
  final GFItemsCarouselSlideStartCallback? onSlideStart;

  /// When a pointer that is in contact with the screen and moving
  /// has moved again.
  final GFItemsCarouselSlideCallback? onSlide;

  /// When a pointer that was previously in contact with the screen
  /// and moving is no longer in contact with the screen.
  final GFItemsCarouselSlideEndCallback? onSlideEnd;

  /// defines the height of items
  final double itemHeight;

  @override
  _GFItemsCarouselState createState() => _GFItemsCarouselState();
}

class _GFItemsCarouselState extends State<GFItemsCarousel>
    with TickerProviderStateMixin {
  double kButtonSpacing = 100;

  /// In milliseconds
  static const int dragAnimationDuration = 1000;

  /// In milliseconds
  static const int shiftAnimationDuration = 300;

  /// Size of cell
  double size = 0;

  /// Width of cells container
  double width = 0;

  late AnimationController animationController;

  /// Shift of cells container
  late double offset;

  bool lockLeft = false, lockRight = false;

  @override
  void initState() {
    offset = 0;
    animationController = AnimationController(
      duration: const Duration(milliseconds: dragAnimationDuration),
      vsync: this,
    );
    Future.delayed(
      Duration.zero,
      () {
        setState(() {
          width = widget.width - kButtonSpacing;
          size = width / widget.rowCount;
        });
      },
    );
    super.initState();
  }

  double calculateOffset(double shift) {
    double localOffset = offset + shift;
    final double rightLimit = size * (widget.children.length - widget.rowCount);

    /// Check cells container limits
    if (localOffset > 0) {
      localOffset = 0;
    } else if (localOffset < -rightLimit) {
      localOffset = -rightLimit;
    }
    return localOffset;
  }

  void onSlideStart(DragStartDetails details) {
    animationController.stop();
    if (widget.onSlideStart != null) {
      widget.onSlideStart!(details);
    }
  }

  void onSlide(DragUpdateDetails details) {
    setState(() {
      offset = calculateOffset(3 * details.delta.dx);
    });
    if (widget.onSlide != null) {
      widget.onSlide!(details);
    }
  }

  void onSlideEnd(DragEndDetails details) {
    final double dx = details.velocity.pixelsPerSecond.dx;

    if (dx == 0) {
      return slideAnimation();
    }

    animationController = AnimationController(
      duration: const Duration(milliseconds: dragAnimationDuration),
      vsync: this,
    );

    final Tween tween =
        Tween<double>(begin: offset, end: calculateOffset(0.5 * dx));
    Animation animation;
    animation = tween.animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));
    animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        slideAnimation();
      }
    });
    animation.addListener(() {
      setState(() {
        offset = animation.value;
      });
    });

    animationController.forward();
    if (widget.onSlideEnd != null) {
      widget.onSlideEnd!(details);
    }
    if (kDebugMode) {
      print(offset);
    }
  }

  void slideAnimation() {
    final double beginAnimation = offset;
    final double endAnimation = size * (offset / size).round().toDouble();
    animationController = AnimationController(
      duration: const Duration(milliseconds: shiftAnimationDuration),
      vsync: this,
    );
    final Tween tween = Tween<double>(begin: beginAnimation, end: endAnimation);
    final Animation animation = tween.animate(animationController);
    animation.addListener(() {
      setState(() {
        offset = animation.value;
      });
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        lockRight = lockLeft = false;
      }
    });
    animationController.forward();
    if (kDebugMode) {
      print(offset);
    }
    final double rightLimit = size * (widget.children.length - widget.rowCount);
    if (kDebugMode) {
      print(rightLimit);
    }
  }

  @override
  Widget build(BuildContext context) => Row(
        children: [
          IconButton(
            onPressed: () {
              if (lockLeft) return;
              if (offset == 0) {
                lockLeft = false;
                return;
              }
              lockLeft = true;
              animationController = AnimationController(
                duration: const Duration(milliseconds: dragAnimationDuration),
                vsync: this,
              );

              final Tween tween = Tween<double>(
                  begin: offset, end: offset + (size + (kDefaultPadding / 2)));
              Animation animation;
              animation = tween.animate(CurvedAnimation(
                parent: animationController,
                curve: Curves.easeOut,
              ));
              animation.addStatusListener((AnimationStatus status) {
                if (status == AnimationStatus.completed) {
                  slideAnimation();
                }
              });
              animation.addListener(() {
                setState(() {
                  offset = animation.value;
                });
              });

              animationController.forward();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: GestureDetector(
              onHorizontalDragStart: onSlideStart,
              onHorizontalDragUpdate: onSlide,
              onHorizontalDragEnd: onSlideEnd,
              child: SizedBox(
                width: width,
                height: widget.height,
                child: Stack(
                  children: [
                    Positioned(
                      left: offset,
                      child: Row(
                        children: widget.children
                            .map((child) => Container(
                                  padding: widget.padding,
                                  width: size,
                                  height: widget.itemHeight,
                                  child: child,
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          IconButton(
            onPressed: () {
              if (lockRight) return;
              if (offset <
                  -((size * (widget.children.length - widget.rowCount)) -
                      kDefaultPadding / 2)) {
                lockRight = false;
                return;
              }
              lockRight = true;
              animationController = AnimationController(
                duration: const Duration(milliseconds: dragAnimationDuration),
                vsync: this,
              );

              final Tween tween = Tween<double>(
                  begin: offset, end: offset - (size + (kDefaultPadding / 2)));
              Animation animation;
              animation = tween.animate(CurvedAnimation(
                parent: animationController,
                curve: Curves.easeOut,
              ));
              animation.addStatusListener((AnimationStatus status) {
                if (status == AnimationStatus.completed) {
                  slideAnimation();
                }
              });
              animation.addListener(() {
                setState(() {
                  offset = animation.value;
                });
              });

              animationController.forward();
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      );
}
