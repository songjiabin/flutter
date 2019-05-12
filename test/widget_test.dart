// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

void main() {
  /*testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(getWidget());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
*/

  /**
    * 初始化List
    */
  List list = List<String>.generate(10, (j) => 'itme$j');
//   print(list);

  /**
    * 将list 循环并变成list
    */
  list.map((index) {
    print(index);
  }).toList();

  List listDemo = List<demo>.generate(10, (j) {
    return new demo('1111');
  });

  print(111);
  print(listDemo);
}

class demo {
  String name;

  demo(this.name);
}
