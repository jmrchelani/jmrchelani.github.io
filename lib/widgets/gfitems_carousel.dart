import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';

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
