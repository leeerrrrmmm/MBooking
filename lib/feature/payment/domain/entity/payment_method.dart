class PaymentMethod {
  final PaymentMethodType type;
  final String title;
  final String? subtitle;
  final bool isEnabled;

  const PaymentMethod({
    required this.type,
    required this.title,
    this.subtitle,
    this.isEnabled = true,
  });
}

/// Каталог доступных методов (можно расширять без правки UI-логики)
class PaymentMethodCatalog {
  static const List<PaymentMethod> all = [
    PaymentMethod(
      type: PaymentMethodType.card,
      title: 'Credit card',
      subtitle: 'Visa, Mastercard',
    ),
    PaymentMethod(type: PaymentMethodType.applePay, title: 'Apple Pay'),
    PaymentMethod(type: PaymentMethodType.googlePay, title: 'Google Pay'),
  ];
}

enum PaymentMethodType { card, applePay, googlePay, cash }
