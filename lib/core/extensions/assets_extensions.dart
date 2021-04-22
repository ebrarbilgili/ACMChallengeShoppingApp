enum AssetPathEnum { RANDOM_IMAGE, RANDOM_IMAGE_SQUARE, STATIC_RANDOM_IMAGE }

extension HomeAssetsExtension on AssetPathEnum {
  String get rawValue {
    switch (this) {
      case AssetPathEnum.RANDOM_IMAGE:
        return 'https://picsum.photos/200/300';
      case AssetPathEnum.RANDOM_IMAGE_SQUARE:
        return 'https://picsum.photos/200';
      case AssetPathEnum.STATIC_RANDOM_IMAGE:
        return 'https://picsum.photos/seed/picsum/200/300';

      default:
        throw Exception();
    }
  }
}
