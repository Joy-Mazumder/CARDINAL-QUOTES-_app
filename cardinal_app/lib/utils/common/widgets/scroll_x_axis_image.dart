import 'package:flutter/material.dart';

class THorizontalImageList extends StatelessWidget {
  const THorizontalImageList({
    super.key,
    required this.images,
    this.height = 132,
    this.width = 132,
    this.borderRadius = 16,
    this.onTap,
  });

  final List<String> images;
  final double height, width;
  final double borderRadius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SizedBox(
        height: height,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (_, index) {
            final image = images[index];
            return GestureDetector(
              // onTap: () => onTap?.call(image),
              onTap: () => onTap,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.asset(
                  image,
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
