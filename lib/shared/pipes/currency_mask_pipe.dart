import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$ ',
    decimalDigits: 2,
  );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return const TextEditingValue(
        text: 'R\$ 0,00',
        selection: TextSelection.collapsed(offset: 4), // Cursor após "R\$ "
      );
    }

    // Remove caracteres não numéricos
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Garante que sempre haja ao menos dois dígitos
    if (cleanedText.length < 3) {
      cleanedText = cleanedText.padLeft(3, '0');
    }

    // Converte para número, dividindo por 100
    double value = double.tryParse(cleanedText) ?? 0.0;
    value /= 100;

    // Formata o valor como moeda
    String formattedText = currencyFormat.format(value);

    // Calcula a nova posição do cursor com base na diferença entre os textos
    int newCursorOffset = formattedText.length - 
        (newValue.text.length - newValue.selection.end);

    // Retorna o valor formatado com o cursor atualizado
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: newCursorOffset.clamp(0, formattedText.length),
      ),
    );
  }
}
