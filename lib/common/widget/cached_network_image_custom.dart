import 'package:extended_image/extended_image.dart';
import 'package:shimmer/shimmer.dart';

import '../commons.dart';

class CachedImageNetworkWidget extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool isCache;

  const CachedImageNetworkWidget({super.key, required this.imageUrl, this.width, this.height, this.fit, this.isCache = false});

  @override
  State<CachedImageNetworkWidget> createState() => _CachedImageNetworkWidgetState();
}

class _CachedImageNetworkWidgetState extends State<CachedImageNetworkWidget> {
  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      widget.imageUrl,
      width: widget.width ?? double.maxFinite,
      height: widget.height ?? double.maxFinite,
      fit: widget.fit ?? BoxFit.cover,
      cache: widget.isCache,
      cacheWidth: widget.width != null ? (widget.width! * 2.5).toInt() : 700,
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.completed:
            return state.completedWidget;

          case LoadState.failed:
            return Center(
              child: ColorFiltered(
                colorFilter: const ColorFilter.matrix(<double>[
                  0.2126, 0.7152, 0.0722, 0, 0, // R
                  0.2126, 0.7152, 0.0722, 0, 0, // G
                  0.2126, 0.7152, 0.0722, 0, 0, // B
                  0, 0, 0, 1, 0, // A
                ]),
                child: Image.asset('assets/images/logo_nex.png', fit: BoxFit.contain, width: 70),
              ),
            );
          case LoadState.loading:
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade50,
              child: Container(width: 50, height: 50, color: Colors.red),
            ).wrapSize(50, 50);
        }
      },
    );
  }
}
