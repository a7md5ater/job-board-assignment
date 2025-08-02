// import 'package:flutter/material.dart';
// import 'package:money_distributors/config/theme/app_theme.dart';
// import 'package:money_distributors/core/utils/app_colors.dart';

// class CustomExpansionTile extends StatefulWidget {
//   final ScrollController scrollController;
//   final Widget title;
//   final double borderRadius;
//   final List<Widget> children;

//   const CustomExpansionTile({
//     super.key,
//     required this.scrollController,
//     required this.title,
//     required this.borderRadius,
//     required this.children,
//   });

//   @override
//   State<CustomExpansionTile> createState() => _CustomExpansionTileState();
// }

// class _CustomExpansionTileState extends State<CustomExpansionTile> {
//   final GlobalKey expansionTileKey = GlobalKey();
//   void _scrollToSelectedContent({required GlobalKey expansionTileKey}) {
//     final keyContext = expansionTileKey.currentContext;
//     if (keyContext != null) {
//       Future.delayed(const Duration(milliseconds: 200)).then((value) {
//         Scrollable.ensureVisible(keyContext,
//             duration: const Duration(milliseconds: 200));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: AppTheme.lightTheme().copyWith(
//         highlightColor: Colors.transparent,
//         splashColor: Colors.transparent,
//       ),
//       child: ExpansionTile(
//         key: expansionTileKey,
//         title: widget.title,
//         shape: RoundedRectangleBorder(
//           side: const BorderSide(
//             color: AppColors.lightBlack,
//           ),
//           borderRadius: BorderRadius.circular(widget.borderRadius),
//         ),
//         iconColor: AppColors.primary,
//         collapsedIconColor: AppColors.primary,
//         backgroundColor: AppColors.lightBlack,
//         collapsedBackgroundColor: AppColors.lightBlack,
//         collapsedShape: RoundedRectangleBorder(
//           side: const BorderSide(
//             color: AppColors.lightBlack,
//           ),
//           borderRadius: BorderRadius.circular(widget.borderRadius),
//         ),
//         expandedCrossAxisAlignment: CrossAxisAlignment.center,
//         onExpansionChanged: (value) {
//           if (value) {
//             _scrollToSelectedContent(expansionTileKey: expansionTileKey);
//           }
//         },
//         children: widget.children,
//       ),
//     );
//   }
// }
