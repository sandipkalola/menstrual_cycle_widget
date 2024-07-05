import '../../utils/enumeration.dart';

class SimpleSwipeConfig {
  final double verticalThreshold;
  final double horizontalThreshold;
  final SwipeDetectionMoment swipeDetectionMoment;

  const SimpleSwipeConfig({
    this.verticalThreshold = 50.0,
    this.horizontalThreshold = 50.0,
    this.swipeDetectionMoment = SwipeDetectionMoment.onEnd,
  });
}
