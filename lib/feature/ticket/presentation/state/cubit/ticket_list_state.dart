part of 'ticket_list_cubit.dart';

sealed class TicketsListState {
  const TicketsListState();
}

class TicketsListInitial extends TicketsListState {
  const TicketsListInitial();
}

class TicketsListLoading extends TicketsListState {
  const TicketsListLoading();
}

class TicketsListLoaded extends TicketsListState {
  final List<TicketEntity> tickets;
  const TicketsListLoaded(this.tickets);
}

class TicketsListError extends TicketsListState {
  final String message;
  const TicketsListError(this.message);
}
