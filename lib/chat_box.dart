
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        // Container(
        //   padding: const EdgeInsets.symmetric(vertical: 5,horizontal:10),
        //   decoration: const BoxDecoration(
        //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), topLeft: Radius.circular(0), bottomRight: Radius.circular(5)),
        //     color: Colors.red,
        //   ),
        //   child: Text("Hii "),
        // )
            SentMessage(message: "Hello this is cool"),
            SentMessage(message: "How are you"),
            SentMessage(message: "Now is good day to try something new and work on it. Stick to the plan"),
          ],
        ),
      ),
    );
  }
}


// class CustomChatBox extends CustomPainter {
//   CustomChatBox({required this.fromCurrentUser});
//   final bool fromCurrentUser;
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint();
//     paint.color = Colors.red;
//     // Adjust the triangle coordinates based on padding (20 in this case)
//     double paddingOffset = ScreenHeight.twenty;
//
//     Path path2 = Path();
//     if (fromCurrentUser) {
//       // For message from current user, draw triangle on the right
//       path2.moveTo(size.width + paddingOffset, 0); // Start outside the right border
//       path2.lineTo(size.width, 0); // Top-right corner
//       path2.lineTo(size.width, 10); // Bottom-right corner
//     } else {
//       // For message from another user, draw triangle on the left
//       path2.moveTo(-paddingOffset, 0); // Start outside the left border
//       path2.lineTo(0, 0); // Top-left corner
//       path2.lineTo(0, 10); // Bottom-left corner
//     }
//
//     path2.close(); // Close the path to form the triangle
//
//     canvas.drawPath(path2, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

class Triangle extends CustomPainter {
  final Color bgColor;
  final bool isCurrentUser;
  Triangle(this.bgColor, this.isCurrentUser);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
   if(isCurrentUser==true){
      // Triangle on the left
      path.moveTo(size.width + 10, 0); // Start outside the right border
      path.lineTo(size.width, 0); // Top-right corner
      path.lineTo(size.width, 10); // Bottom-right corner


    }else{
    path.lineTo(-10, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SentMessage extends StatelessWidget {
  final String message;
  const SentMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Flexible(
              child: CustomPaint(
        painter: Triangle(Colors.grey[900]!, true),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  constraints: BoxConstraints(
                      maxWidth: Get.width * 0.8),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: const BorderRadius.only(
                      // topLeft: Radius.circular(18),
                      // bottomLeft: Radius.circular(18),
                      // bottomRight: Radius.circular(18),
                    ),
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontFamily: 'Monstserrat', fontSize: 14),
                  ),
                ),
              ),
            ),

            ],
        ));

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          messageTextGroup,
        ],
      ),
    );
  }
}