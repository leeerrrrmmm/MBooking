// presentation/widgets/ticket_list_card.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mbooking/feature/ticket/domain/entity/ticket_entity.dart';

class TicketListCard extends StatelessWidget {
  final TicketEntity ticket;
  final VoidCallback? onTap;

  const TicketListCard({super.key, required this.ticket, this.onTap});

  @override
  Widget build(BuildContext context) {
    final hasPoster = ticket.posterPath?.isNotEmpty == true;
    final dateStr = ticket.date != null
        ? DateFormat('dd.MM.yyyy').format(ticket.date!)
        : '—';
    final timeStr = ticket.time ?? '';

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1C),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: hasPoster
                    ? Image.network(
                        'https://image.tmdb.org/t/p/w200${ticket.posterPath}',
                        width: 72,
                        height: 96,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => _posterPlaceholder(),
                      )
                    : _posterPlaceholder(),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ticket.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.white.withValues(alpha: 0.55),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            [
                              if (timeStr.isNotEmpty) timeStr,
                              dateStr,
                            ].join('  •  '),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.55),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: Colors.white.withValues(alpha: 0.55),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            ticket.cinemaName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.55),
                              fontSize: 13,
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
        ),
      ),
    );
  }

  Widget _posterPlaceholder() {
    return Container(
      width: 72,
      height: 96,
      color: const Color(0xFF2A2A2A),
      child: const Icon(Icons.movie, color: Colors.white24),
    );
  }
}
