import '../utils//size_fit.dart';

extension IntFit on int {
  double get px {
    return SizeFit.setPx(this.toDouble());
  }
}