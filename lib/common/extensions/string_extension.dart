extension StringExt on String {
  String get capitalizeString {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } else {
      return '';
    }
  }

  String sizeMedia({String? sizeWidth}) {
    String res = replaceAll('upload/public', 'upload/w_$sizeWidth/public');
    return res;
  }

  String customUrlMedia({
    bool isGetThumbnailVideo = false,
    String? sizeWidth,
  }) {
    String res = '';
    if (isGetThumbnailVideo) {
      res = replaceAll('.mp4', '.jpg')
          .replaceAll('.mov', '.jpg')
          .replaceAll('upload/public', 'upload/w_$sizeWidth/public');
    } else {
      res = replaceAll('upload/public', 'upload/w_$sizeWidth/public');
    }
    return res;
  }


  String capitalize() {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } else {
      return '';
    }
  }

}
