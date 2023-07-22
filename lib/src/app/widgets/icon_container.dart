import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../themes/color_utils.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({super.key, required this.icon});
  final SvgPicture icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
          color: ColorUtils.rgbToColor(59, 59, 59, 1),
          borderRadius: BorderRadius.circular(15.0)),
      width: 40,
      height: 40,
      child: icon,
    );
  }
}
