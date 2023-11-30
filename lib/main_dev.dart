import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  Environment.appFlavor = Flavor.dev;
  await runner.main();
}
