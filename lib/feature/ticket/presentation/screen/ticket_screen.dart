// presentation/screens/ticket_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mbooking/components/futuristic_loader.dart';
import 'package:mbooking/feature/ticket/presentation/state/cubit/ticket_list_cubit.dart';
import 'package:mbooking/feature/ticket/presentation/widget/ticket_list_card.dart';
import 'package:mbooking/router/app_routes.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My ticket',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocBuilder<TicketsListCubit, TicketsListState>(
        builder: (context, state) {
          if (state is TicketsListLoading || state is TicketsListInitial) {
            return const Center(
              child: FuturisticLoader(size: 72, label: 'LOADING TICKETS'),
            );
          }

          if (state is TicketsListError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white54),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => context.read<TicketsListCubit>().load(),
                    child: const Text(
                      'Retry',
                      style: TextStyle(color: Color(0xFFFCC434)),
                    ),
                  ),
                ],
              ),
            );
          }

          final tickets = (state as TicketsListLoaded).tickets;

          if (tickets.isEmpty) {
            return const Center(
              child: Text(
                'No tickets yet',
                style: TextStyle(color: Colors.white54, fontSize: 16),
              ),
            );
          }

          return RefreshIndicator(
            color: const Color(0xFFFCC434),
            onRefresh: () => context.read<TicketsListCubit>().load(),
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
              itemCount: tickets.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return TicketListCard(
                  ticket: ticket,
                  onTap: () {
                    context.push(AppRoutes.detailTicket, extra: ticket);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
