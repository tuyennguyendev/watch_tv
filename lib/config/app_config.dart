enum Flavor {
  dev,
  stg,
  prod,
}

class Environment {
  static Flavor? appFlavor;

  static const AppConfig appConfigDev = AppConfig(
    appFlavor: Flavor.dev,
    title: 'Watch TV Dev',
    name: 'Development',
    apiBaseUrl: 'https://iptv-org.github.io/api/',
  );

  static const AppConfig appConfigStg = AppConfig(
    appFlavor: Flavor.stg,
    title: 'Watch TV Staging',
    name: 'Staging',
    apiBaseUrl: 'https://iptv-org.github.io/api/',
  );
  static const AppConfig appConfigProd = AppConfig(
    appFlavor: Flavor.prod,
    title: 'Watch TV',
    name: 'Production',
    apiBaseUrl: 'https://iptv-org.github.io/api/',
  );

  static AppConfig get config {
    switch (appFlavor) {
      case Flavor.dev:
        return appConfigDev;
      case Flavor.stg:
        return appConfigStg;
      case Flavor.prod:
        return appConfigProd;
      default:
        return appConfigDev;
    }
  }
}

class AppConfig {
  final Flavor appFlavor;
  final String title;
  final String name;
  final String apiBaseUrl;

  const AppConfig({
    required this.appFlavor,
    required this.title,
    required this.name,
    required this.apiBaseUrl,
  });
}
