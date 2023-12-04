import 'config/app_config.dart';

import 'main.dart' as runner;

Future<void> main() async {
  Environment.appFlavor = Flavor.stg;
  await runner.main();
}
