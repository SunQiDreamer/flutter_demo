import '../utils/size_fit.dart';

extension DoubleFit on double {
  double get px {
    return SizeFit.setPx(this);
  }
}
