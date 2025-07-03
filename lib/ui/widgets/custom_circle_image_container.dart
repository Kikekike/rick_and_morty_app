import 'package:flutter/widgets.dart';
import 'package:rickandmortyapp/theme/app_images.dart';

class CustomCircleImageContainer extends StatelessWidget {
  final String image;
  final double size;

  const CustomCircleImageContainer(
      {this.image = AppImages.homeOne, this.size = 20, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isNetworkImage = image.startsWith('http');
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
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
