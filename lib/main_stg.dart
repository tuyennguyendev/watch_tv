import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  Environment.appFlavor = Flavor.stg;
  await runner.main();
}
