
import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('MyApp displays the homepage', (WidgetTester tester) async {
    // Build the application.
    await tester.pumpWidget(
      MyApp(apiClient: ApiClient()),
    );

    await tester.pumpAndSettle();

    // Verify that the homepage is displayed.
    expect(find.text('Selamat datang di MyPortfolio Mobile!'), findsOneWidget);

    // Verify that the homepage menu items are displayed.
    expect(find.text('Lihat Proyek'), findsOneWidget);
    expect(find.text('Tambah Proyek'), findsOneWidget);
    expect(find.text('Lihat Pengalaman'), findsOneWidget);
    expect(find.text('Tambah Pengalaman'), findsOneWidget);
  });
}
