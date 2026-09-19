import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mbooking/feature/booking/presentation/state/cubit/booking_cubit.dart';
import 'package:mbooking/feature/payment/domain/entity/payment_method.dart';
import 'package:mbooking/feature/payment/presentation/state/cubit/payment_cubit.dart';
import 'package:mbooking/router/app_routes.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _PaymentView();
  }
}

class _TestModeBadge extends StatelessWidget {
  const _TestModeBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0x33FCC434),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFFCC434)),
      ),
      child: const Text(
        'TEST MODE',
        style: TextStyle(
          color: Color(0xFFFCC434),
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _MoreMovieInfoWidget extends StatelessWidget {
  final String? text;
  final IconData icon;

  const _MoreMovieInfoWidget({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 16),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text ?? '',
            style: const TextStyle(fontSize: 12, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _MovieInfoCard extends StatelessWidget {
  final String? posterPath;
  final String? title;
  final String? cinemaAddress;
  final List<String> genres;
  final DateTime? date;
  final String? time;

  const _MovieInfoCard({
    required this.posterPath,
    required this.title,
    required this.cinemaAddress,
    required this.genres,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 142,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              bottomLeft: Radius.circular(14),
            ),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${posterPath ?? ''}',
              width: 100,
              height: 142,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                width: 100,
                height: 142,
                color: Colors.grey.shade800,
                child: const Icon(Icons.movie, color: Colors.white54),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  _MoreMovieInfoWidget(
                    text: cinemaAddress,
                    icon: Icons.location_on_outlined,
                  ),
                  _MoreMovieInfoWidget(
                    text: genres.take(3).join(', '),
                    icon: Icons.movie_outlined,
                  ),
                  _MoreMovieInfoWidget(
                    text:
                        '${date != null ? _formatDate(date!) : ''} • ${time ?? ""}',
                    icon: Icons.timer_outlined,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  String _formatDate(DateTime d) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[d.month - 1]} ${d.day}, ${d.year}';
  }
}

class _PaymentView extends StatefulWidget {
  const _PaymentView();

  @override
  State<_PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<_PaymentView> {
  static const _validDiscountCode = '123123456';

  static const _discountAmount = 10.0;

  final List<PaymentMethod> _paymentMethods = PaymentMethodCatalog.all;
  bool _discountApplied = false; // уже применили?

  late final String orderId;
  final TextEditingController discountController = TextEditingController();

  int _selectedPaymentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, paymentState) {
        if (paymentState is PaymentSuccess) {
          // только TicketEntity
          context.pushReplacement(
            AppRoutes.detailTicket,
            extra: paymentState.ticket,
          );
        } else if (paymentState is PaymentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Payment failed: ${paymentState.message}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      },
      builder: (context, paymentState) {
        final isPaying = paymentState is PaymentProcessing;

        return BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            final draft = state.draft;

            final date = draft.date;
            final time = draft.time;
            final total = draft.totalPrice;
            final seatsText = draft.seatsLabel;
            final genres = draft.genres;
            final posterPath = draft.posterPath;
            final title = draft.title;
            final cinemaAddress = draft.cinemaAddress;

            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'Payment',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _MovieInfoCard(
                              posterPath: posterPath,
                              title: title,
                              cinemaAddress: cinemaAddress,
                              genres: genres,
                              date: date,
                              time: time,
                            ),
                            const SizedBox(height: 20),

                            _InfoRow(label: 'Order ID', value: orderId),
                            const SizedBox(height: 12),
                            _InfoRow(label: 'Seat', value: seatsText),
                            const SizedBox(height: 20),

                            // Discount
                            Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1C1C1C),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: discountController,
                                      enabled: !_discountApplied,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                        hintText: _discountApplied
                                            ? 'Discount applied'
                                            : 'Enter discount code',
                                        hintStyle: const TextStyle(
                                          color: Color(0xFFBFBFBF),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: _discountApplied
                                        ? null
                                        : () => _onApplyDiscount(total),
                                    child: Container(
                                      width: 110,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: _discountApplied
                                            ? const Color(0xFF3A3A3A)
                                            : Colors.amber,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        _discountApplied ? 'Applied' : 'Apply',
                                        style: TextStyle(
                                          color: _discountApplied
                                              ? Colors.white54
                                              : Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Divider(
                                color: Color(0xFF595959),
                                height: 1,
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    if (_discountApplied)
                                      Text(
                                        '\$${total.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white38,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    Text(
                                      '\$${_finalTotal(total).toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const Row(
                              children: [
                                Text(
                                  'Payment Method',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                _TestModeBadge(),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Test mode only. Use card 4242 4242 4242 4242, any future date, any CVC.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFFBFBFBF),
                              ),
                            ),
                            const SizedBox(height: 12),

                            ...List.generate(_paymentMethods.length, (index) {
                              final method = _paymentMethods[index];
                              final isSelected = _selectedPaymentIndex == index;

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () => _selectedPaymentIndex = index,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 64,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1C1C1C),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: isSelected
                                            ? Colors.amber
                                            : Colors.transparent,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          _iconFor(method.type),
                                          color: isSelected
                                              ? Colors.amber
                                              : Colors.white70,
                                          size: 28,
                                        ),
                                        const SizedBox(width: 14),
                                        Expanded(
                                          child: Text(
                                            method.title,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: isSelected
                                                  ? Colors.amber
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          isSelected
                                              ? Icons.radio_button_checked
                                              : Icons.radio_button_off,
                                          color: isSelected
                                              ? Colors.amber
                                              : Colors.white38,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),

                    // Pay button — всегда внизу
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                        child: SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: isPaying
                                ? null
                                : () {
                                    final method =
                                        _paymentMethods[_selectedPaymentIndex]
                                            .type;
                                    context.read<PaymentCubit>().pay(
                                      draft: draft.copyWith(
                                        paymentMethod: method,
                                        orderId: int.parse(orderId),
                                      ),
                                      amount: _finalTotal(total),
                                    );
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFCC434),
                              disabledBackgroundColor: const Color(
                                0xFFFCC434,
                              ).withValues(alpha: 0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: isPaying
                                ? const SizedBox(
                                    width: 22,
                                    height: 22,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.4,
                                      color: Colors.black,
                                    ),
                                  )
                                : Text(
                                    _discountApplied
                                        ? '\$${_finalTotal(total).toStringAsFixed(2)}'
                                        : 'Pay  \$${total.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    discountController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    orderId = _generateOrderId();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) =>
          context.read<BookingCubit>().attachOrderId(int.parse(orderId)),
    );
  }

  IconData _iconFor(PaymentMethodType type) {
    return switch (type) {
      PaymentMethodType.card => Icons.credit_card,
      PaymentMethodType.applePay => Icons.apple,
      PaymentMethodType.googlePay => Icons.account_balance_wallet_outlined,
      PaymentMethodType.cash => Icons.payments_outlined,
    };
  }

  double _finalTotal(double baseTotal) {
    final total = _discountApplied ? baseTotal - _discountAmount : baseTotal;
    return total < 0 ? 0 : total;
  }

  String _generateOrderId() {
    final random = Random();
    final buffer = StringBuffer();
    for (int i = 0; i < 11; i++) {
      buffer.write(random.nextInt(10));
    }
    return buffer.toString();
  }

  void _onApplyDiscount(double baseTotal) {
    if (_discountApplied) return;

    final code = discountController.text.trim();
    if (code.isEmpty) return;

    if (code == _validDiscountCode) {
      setState(() {
        _discountApplied = true;
      });
      discountController.clear();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Discount applied: −\$10')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Code "$code" not found')));
    }
  }
}
