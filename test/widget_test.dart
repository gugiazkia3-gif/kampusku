
import 'package:flutter_test/flutter_test.dart';
import 'package:kampusku/app.dart';

void main() {
  testWidgets('KampusKu berhasil ditampilkan', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const KampusKuApp());

    expect(find.text('KampusKu'), findsOneWidget);
    expect(find.text('Ringkasan Akademik'), findsOneWidget);
    expect(find.text('Daftar Pengumuman'), findsOneWidget);
  });
}
