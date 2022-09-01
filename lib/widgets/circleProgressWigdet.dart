import 'dart:math';
import 'package:flutter/material.dart';

class CircleProgressWidget extends StatelessWidget {
  const CircleProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.red)
        //   ),
        child: RadialPercentWidget(
          percent: 0.72,
          lineColor: Colors.green,
          freeColor: Colors.white12,
          lineWidth: 5,
          feelColor: Colors.black,
          child: Text(
            '72%',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class RadialPercentWidget extends StatelessWidget {
  const RadialPercentWidget({
    Key? key,
    required this.child,
    required this.percent,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
    required this.feelColor,
  }) : super(key: key);

  final Widget child;
  final Color feelColor;
  final double percent;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
            painter: MyPainter(
                feelColor: feelColor,
                child: child,
                percent: percent,
                lineColor: lineColor,
                freeColor: freeColor,
                lineWidth: lineWidth)),
        Padding(
          padding: const EdgeInsets.all(11),
          child: Center(child: child),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final Widget child;
  final Color feelColor;
  final double percent;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter({
    required this.feelColor,
    required this.child,
    required this.percent,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);
    drawBackground(canvas, size);
    drawFreeArc(canvas, arcRect);
    drawLineArcs(canvas, arcRect);
  }

  void drawLineArcs(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = lineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    paint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi * 2 * percent,
      false,
      paint,
    );
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = freeColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    canvas.drawArc(
      arcRect,
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      paint,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = feelColor;
    paint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect calculateArcsRect(Size size) {
    final lineMargin = 3;
    final offset = lineWidth / 2 + lineMargin;
    final arcRect = Offset(offset, offset) &
        Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
