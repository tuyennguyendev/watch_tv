enum Flavor {
  dev,
  stg,
  prod,
}

class Environment {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Watch TV Dev';
      case Flavor.stg:
        return 'Watch TV Staging';
      case Flavor.prod:
        return 'Watch TV';
      default:
        return 'title';
    }
  }

}
