// 径向hero动画
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;
//
// class Photo extends StatelessWidget {
//   const Photo({super.key, required this.photo, this.onTap});
//
//   final String photo;
//   final VoidCallback? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Theme.of(context).primaryColor.withOpacity(0.25),
//       child: InkWell(
//         onTap: onTap,
//         child: LayoutBuilder(
//           builder: (context, size) {
//             return Image.asset(
//               photo,
//               fit: BoxFit.contain,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class RadialExpansion extends StatelessWidget {
//   const RadialExpansion({super.key, required this.maxRadius, this.child})
//       : clipReactSize = 2.0 * (maxRadius / math.sqrt2);
//   final double maxRadius;
//   final double clipReactSize;
//   final Widget? child;
//
//   @override
//   Widget build(BuildContext context) {
//     // 剪辑椭圆
//     return ClipOval(
//       child: Center(
//         child: SizedBox(
//           width: clipReactSize,
//           height: clipReactSize,
//           child: ClipRect(
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class RadialHeroExpansion extends StatelessWidget {
//   const RadialHeroExpansion({super.key});
//
//   static double kMinRadius = 32.0;
//   static double kMaxRadius = 128.0;
//   static Interval opacityCurve =
//       const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
//
//   static RectTween _createRectTween(Rect? begin, Rect? end) {
//     return MaterialRectCenterArcTween(begin: begin, end: end);
//   }
//
//   static Widget _buildPage(
//       BuildContext context, String imageName, String description) {
//     return Container(
//       color: Theme.of(context).canvasColor,
//       child: Center(
//         child: Card(
//           elevation: 8, //高度
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 width: kMaxRadius * 2.0,
//                 height: kMaxRadius * 2.0,
//                 child: Hero(
//                   tag: imageName,
//                   createRectTween: _createRectTween,
//                   child: RadialExpansion(
//                     maxRadius: kMaxRadius,
//                     child: Photo(
//                       photo: imageName,
//                       onTap: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               Text(
//                 description,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//                 textScaleFactor: 3,
//               ),
//               const SizedBox(
//                 height: 16,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHero(
//       BuildContext context, String imageName, String description) {
//     return SizedBox(
//       width: kMinRadius * 2.0,
//       height: kMinRadius * 2.0,
//       child: Hero(
//         tag: imageName,
//         createRectTween: _createRectTween,
//         child: RadialExpansion(
//           maxRadius: kMaxRadius,
//           child: Photo(
//             photo: imageName,
//             onTap: () {
//               Navigator.of(context).push(PageRouteBuilder<void>(
//                   pageBuilder: (context, animation, secondaryAnimation) {
//                 return AnimatedBuilder(
//                     animation: animation,
//                     builder: (context, child) {
//                       return Opacity(
//                         opacity: opacityCurve.transform(animation.value),
//                         child: _buildPage(context, imageName, description),
//                       );
//                     });
//               }));
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     timeDilation =5.0;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Radial hero"),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(32),
//         alignment: FractionalOffset.bottomLeft,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _buildHero(context, 'images/chair.png', 'chair'),
//             _buildHero(context, 'images/binoculars.png', 'Binoculars'),
//             _buildHero(context, 'images/beachBall.png', 'Beach ball'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(const MaterialApp(
//     home: RadialHeroExpansion(),
//   ));
// }

//==================  基础版本  ====================

// import 'dart:math' as math;
//
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;
//
// class Photo extends StatelessWidget {
//   const Photo({super.key, required this.photo, this.color, this.onTap});
//
//   final String photo;
//   final Color? color;
//   final VoidCallback? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Theme.of(context).primaryColor.withOpacity(0.25),
//       child: InkWell(
//         onTap: onTap,
//         child: Image.asset(
//           photo,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }
//
// class RadialExpansion extends StatelessWidget {
//   const RadialExpansion({
//     super.key,
//     required this.maxRadius,
//     this.child,
//   })  : clipRectExtent = 2.0 * (maxRadius / math.sqrt2);
//
//   final double maxRadius;
//   final double clipRectExtent;
//   final Widget? child;
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipOval(
//       child: Center(
//         child: SizedBox(
//           width: clipRectExtent,
//           height: clipRectExtent,
//           child: ClipRect(
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class RadialExpansionDemo extends StatelessWidget {
//   const RadialExpansionDemo({super.key});
//
//   static double kMinRadius = 32;
//   static double kMaxRadius = 128;
//   static Interval opacityCurve =
//   const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
//
//   static RectTween _createRectTween(Rect? begin, Rect? end) {
//     return MaterialRectCenterArcTween(begin: begin, end: end);
//   }
//
//   static Widget _buildPage(
//       BuildContext context, String imageName, String description) {
//     return Container(
//       color: Theme.of(context).canvasColor,
//       alignment: FractionalOffset.center,
//       child: SizedBox(
//         width: kMaxRadius * 2.0,
//         height: kMaxRadius * 2.0,
//         child: Hero(
//           createRectTween: _createRectTween,
//           tag: imageName,
//           child: RadialExpansion(
//             maxRadius: kMaxRadius,
//             child: Photo(
//               photo: imageName,
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHero(
//       BuildContext context, String imageName, String description) {
//     return SizedBox(
//       width: kMinRadius * 2,
//       height: kMinRadius * 2,
//       child: Hero(
//         createRectTween: _createRectTween,
//         tag: imageName,
//         child: RadialExpansion(
//           maxRadius: kMaxRadius,
//           child: Photo(
//             photo: imageName,
//             onTap: () {
//               Navigator.of(context).push(
//                 PageRouteBuilder<void>(
//                   pageBuilder: (context,
//                       animation,
//                       secondaryAnimation) {
//                     return AnimatedBuilder(
//                       animation: animation,
//                       builder: (context, child) {
//                         return Opacity(
//                           opacity: opacityCurve.transform(animation.value),
//                           child: _buildPage(context, imageName, description),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     timeDilation = 20.0; // 1.0 is normal animation speed.
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Basic Radial Hero Animation Demo'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(32),
//         alignment: FractionalOffset.bottomLeft,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _buildHero(context, 'images/chair.png', 'Chair'),
//             _buildHero(context, 'images/binoculars.png', 'Binoculars'),
//             _buildHero(context, 'images/beachBall.png', 'Beach ball'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(
//     const MaterialApp(
//       home: RadialExpansionDemo(),
//     ),
//   );
// }


//================= 高阶版本 ====================

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Photo extends StatelessWidget {
  const Photo({super.key, required this.photo, this.onTap});

  final String photo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      // Slightly opaque color appears where the image has transparency.
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (context, size) {
            return Image.asset(
              photo,
              fit: BoxFit.contain,
            );
          },
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    super.key,
    required this.minRadius,
    required this.maxRadius,
    this.child,
  })  : clipTween = Tween<double>(
    begin: 2.0 * minRadius,
    end: 2.0 * (maxRadius / math.sqrt2),
  );

  final double minRadius;
  final double maxRadius;
  final Tween<double> clipTween;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final double t =
            (size.biggest.width / 2.0 - minRadius) / (maxRadius - minRadius);
        final double rectClipExtent = clipTween.transform(t);
        return ClipOval(
          child: Center(
            child: SizedBox(
              width: rectClipExtent,
              height: rectClipExtent,
              child: ClipRect(
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}

class RadialExpansionDemo extends StatelessWidget {
  const RadialExpansionDemo({super.key});

  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve = Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  RectTween _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child: RadialExpansion(
                    minRadius: kMinRadius,
                    maxRadius: kMaxRadius,
                    child: Photo(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Text(
                description,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return SizedBox(
      width: kMinRadius * 2.0,
      height: kMinRadius * 2.0,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialExpansion(
          minRadius: kMinRadius,
          maxRadius: kMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder<void>(
                  pageBuilder: (context,
                      animation,
                      secondaryAnimation) {
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: opacityCurve.transform(animation.value),
                          child: _buildPage(context, imageName, description),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 15.0; // 1.0 is normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radial Transition Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHero(context, 'images/chair.png', 'Chair'),
            _buildHero(context, 'images/binoculars.png', 'Binoculars'),
            _buildHero(context, 'images/beachBall.png', 'Beach ball'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: RadialExpansionDemo(),
    ),
  );
}