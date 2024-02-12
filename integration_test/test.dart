import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:giants/flutter_flow/flutter_flow_widgets.dart';
import 'package:giants/index.dart';
import 'package:giants/main.dart';
import 'package:giants/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login', (WidgetTester tester) async {
    _overrideOnError();

    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: 'ryan', password: 'ryan');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));

    await tester.enterText(find.byKey(ValueKey('email_cugu')), 'ryan');
    await tester.enterText(find.byKey(ValueKey('Senha_65qc')), 'ryan');
    await tester.tap(find.byKey(ValueKey('Button_4ucv')));
    await tester.pumpAndSettle(Duration(milliseconds: 6000));
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
