import 'package:test/test.dart';
import 'package:cicd_flutter_app/news/page/news_page.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = NewsPage();

    counter.increment();

    expect(counter.value, 1);
  });

  test('Counter value should be decremented', () {
    final counter = NewsPage();

    counter.decrement();

    expect(counter.value, -1);
  });

  test('Counter value should be decremented twice', () {
    final counter = NewsPage();

    counter.decrement();
    counter.decrement();

    expect(counter.value, -2);
  });

  test('Counter value should be incremented twice', () {

    final counter = NewsPage();

    counter.increment();
    counter.increment();

    expect(counter.value, 2);
  });
}

// dart analyze lib

// flutter pub global run dart_code_metrics:metrics lib --reporter=html
// flutter pub global run dart_code_metrics:metrics lib --reporter=json

// flutter test --coverage
// genhtml coverage/lcov.info -o coverage/html


// 