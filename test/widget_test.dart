import 'package:flutter_test/flutter_test.dart';
import 'package:quickshare_ui/main.dart';
import 'package:quickshare_ui/screens/splash_screen.dart';
import 'package:quickshare_ui/screens/quick_share_screen.dart';

void main() {
  testWidgets('Splash Screen displays and transitions to Home Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const QuickShareApp());

    // Verify that the splash screen shows logo text and subtitle
    expect(find.text('Quick Share'), findsOneWidget);
    expect(find.text('Smart Social Sharing'), findsOneWidget);
    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.byType(QuickShareScreen), findsNothing);

    // Wait for the 2-second navigation timer to fire and settle transitions
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Verify that we transitioned to QuickShareScreen
    expect(find.byType(QuickShareScreen), findsOneWidget);
    expect(find.byType(SplashScreen), findsNothing);

    // Verify top bar brand text exists
    expect(find.text('ORIFLAME'), findsOneWidget);

    // Verify tabs are present
    expect(find.text('Smart Post'), findsOneWidget);
    expect(find.text('Library'), findsOneWidget);
  });
}
