import 'package:flutter/widgets.dart';
import 'package:rickandmortyapp/theme/app_colors.dart';
import 'package:rickandmortyapp/theme/app_images.dart';

class CustomCircleImageContainer extends StatelessWidget {
  final String image;
  final double size;
  final bool hasBorder;

  const CustomCircleImageContainer(
      {this.image = AppImages.homeOne,
      this.size = 20,
      this.hasBorder = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isNetworkImage = image.startsWith('http');
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: hasBorder
            ? Border.all(color: AppColors.homeCardColor, width: 3)
            : null,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
