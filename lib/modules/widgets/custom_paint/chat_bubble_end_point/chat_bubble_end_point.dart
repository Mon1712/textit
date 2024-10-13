import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:flutter/material.dart';

class ChatBubbleEndPoint extends CustomPainter {
  final Color bgColor;
  final bool isCurrentUser;
  ChatBubbleEndPoint(this.bgColor, this.isCurrentUser);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;
    paint.style = PaintingStyle.fill;
    var path = Path();
    double five = ScreenHeight.five;
    if(isCurrentUser==true){
      // Triangle on the left
      path.moveTo(size.width + five, 0); // Start outside the right border
      path.lineTo(size.width, 0); // Top-right corner
      path.lineTo(size.width, five); // Bottom-right corner
    }else{
      path.lineTo(-five, 0);
      path.lineTo(0, five);
      path.lineTo(five, 0);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}