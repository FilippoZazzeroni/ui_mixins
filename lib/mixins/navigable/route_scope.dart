

abstract class NavigableRouteScope {

  NavigableRouteScope(this.rawValue);

  //

  final String rawValue;

  @override
  int get hashCode => rawValue.hashCode;

}