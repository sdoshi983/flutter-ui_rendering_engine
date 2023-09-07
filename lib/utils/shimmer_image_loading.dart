import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui_rendering_engine/utils/utils.dart';

class ShimmerImageLoading extends StatelessWidget {
  const ShimmerImageLoading({
    this.loadingHeight,
    this.loadingWidth,
    required this.imageUrl,
    this.height,
    this.width,
    this.onClick,
    this.decoration = const BoxDecoration(color: Colors.cyan),
    Key? key,
    this.fit,
    this.radius = 0,
    this.placeHolder = imgErrorPlaceholder,
  }) : super(key: key);

  final String? imageUrl;
  final double? height;
  final double? width;
  final VoidCallback? onClick;
  final Decoration decoration;
  final BoxFit? fit;
  final double? loadingHeight;
  final double? loadingWidth;
  final int radius;
  final String placeHolder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius.toDouble()),
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? '',
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white,
            direction: ShimmerDirection.rtl,
            period: const Duration(milliseconds: 1000),
            child: Container(
              decoration: decoration,
              width: loadingWidth ?? width,
              height: loadingHeight ?? height,
            ),
          ),
          errorWidget: (context, url, dynamic error) => Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              placeHolder,
            ),
          ),
        ),
      ),
    );
  }
}
