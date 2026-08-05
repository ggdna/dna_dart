// Placed by the dna-dart DNA — instantiates and verifies this project's
// DNA on every test run.

import 'package:gg_dna/gg_dna.dart';
import 'package:test/test.dart';

void main() {
  test(
    'dna is instantiated and unmodified',
    () => runDnaTest(),
    timeout: const Timeout(Duration(minutes: 2)),
  );
}
