import 'package:flutter/cupertino.dart';

class CustomClipEdge extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    var path = Path();

    /// This creates a vertical line from the origin (0, 0) down to the bottom-left corner of the widget (0, size.height).
    path.lineTo(0, size.height);

    /// This defines the first curve along the bottom of the widget.
    /// Offset(0, size.height-20) is the control point for the curve, where the curve starts.
    /// Offset(30, size.height-20) is the endpoint of the curve.
    /// The path.quadraticBezierTo() method draws a quadratic Bezier curve from the current point (0, size.height) to (30, size.height - 20) with the control point (0, size.height - 20).
    final firstCurve = Offset(0, size.height-40);
    final secondCurve = Offset(40, size.height-40);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, secondCurve.dx, secondCurve.dy);



/// This defines a similar curve across the bottom of the widget.
/// Offset(0, size.height - 20) is the control point.
/// Offset(size.width - 30, size.height - 20) is the endpoint.
/// The curve starts at the previous endpoint (30, size.height - 20) and moves towards the right side of the widget.
    final secondFirstCurve = Offset(0,  size.height -40);
    final secondLastCurve = Offset(size.width-40,  size.height -40);
    path.quadraticBezierTo(secondFirstCurve.dx,secondFirstCurve.dy , secondLastCurve.dx, secondLastCurve.dy);



/// This defines the curve on the right edge of the widget.
/// Offset(size.width, size.height - 20) is the control point.
/// Offset(size.width, size.height) is the endpoint at the bottom-right corner.
/// The curve completes the clipping path at the right side of the widget.
    final thirdFirstCurve = Offset(size.width,  size.height-40);
    final thirdLastCurve = Offset(size.width,  size.height);
    path.quadraticBezierTo(thirdFirstCurve.dx,thirdFirstCurve.dy , thirdLastCurve.dx, thirdLastCurve.dy);


   /// After drawing the curves, this creates a straight vertical line from the bottom-right corner to the top-right corner of the widget.
    path.lineTo(size.width, 0);

    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}