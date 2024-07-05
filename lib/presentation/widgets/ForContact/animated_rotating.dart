import 'package:flutter/material.dart';

class AnimationController extends ChangeNotifier {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2126420842.
   AnimationController _controller ;
   late Animation<double> _animation;
  AnimationController({
    required Duration duration,
    required TickerProvider vsync,
  }) : _controller = AnimationController(
          duration: duration,
          vsync: vsync,
        ) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:960024885.
    _animation = Tween<double>(begin: 0, end: 360).animate(_controller as Animation<double>);
    _animation.addListener(() => notifyListeners());
  }

  double get value => _animation.value;

  void start() {
    _controller.start();
  }

  void stop() {
    _controller.stop();
  }

  void dispose() {
    _controller.dispose();
  }
}
