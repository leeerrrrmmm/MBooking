import 'package:barcode_widget/barcode_widget.dart';
import 'package:content_flipper/content_flipper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mbooking/feature/ticket/domain/entity/ticket_entity.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailTicketScreen extends StatelessWidget {
  final TicketEntity ticket;

  const DetailTicketScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    final date = ticket.date;
    final time = ticket.time;
    final total = ticket.totalPrice;
    final seatsText = ticket.seatsLabel;
    final title = ticket.title;
    final cinemaAddress = ticket.cinemaAddress;
    final cinemaName = ticket.cinemaName;
    final orderId = ticket.orderId;
    final hasPoster = ticket.posterPath?.isNotEmpty == true;
    final qrData = ticket.qrPayload;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'My Ticket',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ContentFlipper(
        axis: Axis.horizontal,
        initialSide: FlipSide.front,
        // ========== ПЕРЕДНЯЯ СТОРОНА ==========
        front: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Белый контейнер
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Top Info
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: hasPoster
                              ? Image.network(
                                  'https://image.tmdb.org/t/p/original${ticket.posterPath}',
                                  width: 125,
                                  height: 177,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, _, _) =>
                                      _posterPlaceholder(),
                                )
                              : _posterPlaceholder(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.movie,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      ticket.genres.join(', '),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.timer,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      '${date?.toLocal().toString().split(' ')[0] ?? ''} • ${time ?? ''}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Date + Seats (исправлен overflow)
                    Row(
                      children: [
                        // Date
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: Colors.black,
                                size: 40,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      date?.toLocal().toString().split(
                                            ' ',
                                          )[0] ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      time ?? '',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Seats
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.local_movies,
                                color: Colors.black,
                                size: 40,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Seats:',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      seatsText,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 20),

                    // Price / Location / Info
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.monetization_on_outlined,
                              color: Colors.black,
                              size: 40,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Price: ${total.toString()}\$',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.black,
                              size: 40,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                        'Cinema: $cinemaName',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                        'Location: $cinemaAddress',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Row(
                          children: [
                            const Icon(
                              Icons.info_outline,
                              color: Colors.black,
                              size: 40,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                'Tap the ticket to flip and show QR code',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Barcode
                    Column(
                      children: [
                        BarcodeWidget(
                          barcode: Barcode.code128(),
                          data: orderId,
                          width: 280,
                          height: 70,
                          color: Colors.black,
                          backgroundColor: Colors.transparent,
                          drawText: false,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Order ID: $orderId',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Точки по бокам + пунктир
              Positioned(
                left: -29,
                right: -29,
                bottom: MediaQuery.sizeOf(context).height * 0.19,
                child: Row(
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Expanded(
                      child: DashedDivider(
                        color: Colors.grey,
                        height: 1.5,
                        dashWidth: 8,
                        dashSpace: 5,
                      ),
                    ),
                    Container(
                      width: 58,
                      height: 58,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // ========== ЗАДНЯЯ СТОРОНА ==========
        back: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Белый контейнер (те же отступы)
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 220,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),

              // Только точки по бокам (без пунктирной линии)
              Positioned(
                left: -29,
                right: -29,
                bottom: MediaQuery.sizeOf(context).height * 0.19,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 58,
                      height: 58,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _posterPlaceholder() {
    return Container(
      width: 125,
      height: 177,
      color: const Color(0xFF2A2A2A),
      child: const Icon(Icons.movie, color: Colors.black26, size: 40),
    );
  }
}

// DashedDivider остаётся таким же
class DashedDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const DashedDivider({
    super.key,
    this.height = 1,
    this.color = Colors.grey,
    this.dashWidth = 6,
    this.dashSpace = 4,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();

        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            );
          }),
        );
      },
    );
  }
}
