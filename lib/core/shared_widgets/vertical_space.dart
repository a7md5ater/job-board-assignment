import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpace extends StatelessWidget {
  final double height;
  const VerticalSpace(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h);
  }
}
