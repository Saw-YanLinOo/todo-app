import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/network/api_constant.dart';
import 'package:todo_app/page/todo_page.dart';

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
    await tester.pumpWidget(MyApp());

    await Future.delayed(const Duration(seconds: 2));

    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.byType(ToDoPage), findsOneWidget);
  });
}
