
import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora/main.dart'; // Verifique o caminho correto do seu arquivo main.dart

void main() {
  testWidgets('Calculadora inicializa e interage corretamente', (WidgetTester tester) async {
    // Construa o aplicativo e acione um quadro.
    await tester.pumpWidget(MyApp()); // Remova o 'const' aqui se não estiver declarado como 'const' no main.dart

    // Verifique se a tela inicial mostra o valor inicial correto (0).
    expect(find.text('0'), findsOneWidget);

    // Toque no botão '1' e verifique se o texto mudou para '1'.
    await tester.tap(find.text('1'));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    // Toque no botão '+', depois no botão '2' e no botão '='.
    await tester.tap(find.text('+'));
    await tester.pump();
    await tester.tap(find.text('2'));
    await tester.pump();
    await tester.tap(find.text('='));
    await tester.pump();

    // Verifique se a tela mostra o resultado esperado. (Isso depende da lógica de cálculo que você implementou.)
    // Se o cálculo estiver correto, você pode ajustar para verificar o resultado correto.
    expect(find.text('3'), findsOneWidget); // Supondo que o resultado esperado seja '3' após 1 + 2
  });
}
