import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:flutter/material.dart';

class PurpleContainer extends StatelessWidget {
  const PurpleContainer({
    super.key,
    required this.H,
    required this.W,
    this.child = const SizedBox(),
    this.withShadow = true,
    this.padding = EdgeInsets.zero,
    this.color = MyColor.secounderyColor,
  });
  final Color color;
  final double H;
  final double W;
  final Widget? child;
  final bool withShadow;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: H,
      width: W,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if (withShadow)
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 3,
              spreadRadius: 0,
              offset: const Offset(0, 5),
            ),
        ],
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [child!],
      ),
    );
  }
}
