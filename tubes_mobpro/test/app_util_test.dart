import 'package:flutter_test/flutter_test.dart';
import 'package:tubes_mobpro/tubes/utilities/app_util.dart';

void main() {
  group('AppUtil', () {
    test('formatPrice formats integer price correctly', () {
      expect(AppUtil.formatPrice(1000), equals('Rp1,000'));
      expect(AppUtil.formatPrice(1000000), equals('Rp1,000,000'));
      expect(AppUtil.formatPrice(0), equals('Rp0'));
      expect(AppUtil.formatPrice(-1000), equals('Rp-1,000'));
    });

    test('formatPriceDouble formats double price correctly', () {
      expect(AppUtil.formatPriceDouble(1000.0), equals('Rp1,000'));
      expect(AppUtil.formatPriceDouble(1000000.0), equals('Rp1,000,000'));
      expect(AppUtil.formatPriceDouble(0.0), equals('Rp0'));
      expect(AppUtil.formatPriceDouble(-1000.0), equals('Rp-1,000'));
    });

    test('formatDate formats DateTime correctly', () {
      final date = DateTime(2025, 6, 13);
      expect(AppUtil.formatDate(date), equals('13 June 2025'));
    });

    test('formatDateFromString formats date string correctly', () {
      const dateString = '2025-06-13';
      expect(AppUtil.formatDateFromString(dateString), equals('13 June 2025'));
    });

    test('formatDateFromString throws FormatException for invalid date strings',
        () {
      const invalidDateString = 'not-a-date';
      expect(() => AppUtil.formatDateFromString(invalidDateString),
          throwsA(isA<FormatException>()));
    });

    test('displayEnumValue formats enum values correctly', () {
      expect(AppUtil.displayEnumValue('camelCase'), equals('camel Case'));
      expect(AppUtil.displayEnumValue('PascalCase'), equals('Pascal Case'));
      expect(AppUtil.displayEnumValue('snake_case'), equals('snake_case'));
      expect(AppUtil.displayEnumValue(''), equals(''));
      expect(AppUtil.displayEnumValue(null), equals(''));
    });
  });
}
