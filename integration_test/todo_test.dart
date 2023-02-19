import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/network/api_constant.dart';
import 'package:todo_app/page/todo_page.dart';

import 'test_data/test_data.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY,
  );

  testWidgets('Todo App Testing', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await Future.delayed(const Duration(seconds: 2));

    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.byType(ToDoPage), findsOneWidget);

    expect(find.text(todoOne), findsOneWidget);
    expect(find.text(todoTwo), findsOneWidget);
    expect(find.text(todoThree), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text(add), findsOneWidget);

    await tester.enterText(find.byType(TextField), todoFour);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.text(add));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text(todoFour), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 5));
  });
}
