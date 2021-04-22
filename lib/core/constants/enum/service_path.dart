enum ServicePath { BASEURL }

extension ServicePathExtension on ServicePath {
  Uri get values {
    switch (this) {
      case ServicePath.BASEURL:
        return Uri.parse(
            'https://acm-challenge-shop-default-rtdb.firebaseio.com/Product.json');
      default:
        throw Exception();
    }
  }
}
