import 'package:flutter/cupertino.dart';
import 'package:food_subs/utils/png_files.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? placeholder;
  const CustomImage(
      {super.key,
      required this.image,
      this.height,
      this.width,
      this.fit,
      this.placeholder});

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: placeholder ?? PngFiles.restaurentPH,
      height: height,
      width: width,
      fit: fit,
      image: image,
      imageErrorBuilder: (c, o, s) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          placeholder != null ? placeholder ?? '' : PngFiles.categoryPH,
          height: height,
          width: width,
          fit: fit,
        ),
      ),
    );
  }
}
