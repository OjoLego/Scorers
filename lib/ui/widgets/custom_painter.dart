import 'package:flutter/material.dart';

class MatchMomentumGraphPainter extends CustomPainter {
  final List<int> homeMomentumData;
  final List<int> awayMomentumData;

  MatchMomentumGraphPainter({
    required this.homeMomentumData,
    required this.awayMomentumData,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintHome = Paint()..color = Color.fromARGB(255, 215, 197, 33);
    final paintAway = Paint()..color = Colors.red.shade400;

    final double barWidth = size.width / 130;
    final double centerY = size.height / 2;

    for (int i = 0; i < homeMomentumData.length; i++) {
      final double homeBarHeight = homeMomentumData[i] * (size.height / 200);
      final double awayBarHeight = awayMomentumData[i] * (size.height / 200);

      if (homeMomentumData[i] > 0) {
        canvas.drawRect(
          Rect.fromLTWH(
            i * barWidth,
            centerY - homeBarHeight,
            barWidth * 0.8,
            homeBarHeight,
          ),
          paintHome,
        );
      }

      if (awayMomentumData[i] > 0) {
        canvas.drawRect(
          Rect.fromLTWH(
            i * barWidth,
            centerY,
            barWidth * 0.8,
            awayBarHeight,
          ),
          paintAway,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dashWidth = 8.0;
    const double dashSpace = 2.0;
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 1.0;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
