// Import the test package and Counter class
import 'package:test/test.dart';
import 'package:cicd_flutter_app/counter.dart';

void main() {
  test('[Test]::[increment] Counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });

  group(' Counter', () {
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('[Test]::[increment] value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('[Test]::[decrement]value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
