import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSpace extends StatelessWidget {
  final double width;
  const HorizontalSpace(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.h);
  }
}
