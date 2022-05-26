enum EndPoint { users, adress }

extension EndPointExtension on EndPoint {
  String get path => _getPath;

  String get _getPath {
    switch (this) {
      case EndPoint.users:
        return "users";
      case EndPoint.adress:
        return "adress";
      default:
        return '';
    }
  }
}
