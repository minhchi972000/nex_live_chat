extension ImagesExtension on String {
  String get assetImagePath => 'assets/images/$this';
  String get assetImagesPathPNG => 'assets/images/$this.png';
  String get assetImagesPathGIF => 'assets/images/$this.gif';
  String get assetIconsPathPNG => 'assets/icon/$this.png';
  String get assetIconsPathSVG => 'assets/icon/$this.svg';
  String get assetIconsPathGIF => 'assets/icon/$this.gif';
  String get assetIconsPath => 'assets/icon/$this';
  String get assetGame => 'assets/images/game/$this';
}
