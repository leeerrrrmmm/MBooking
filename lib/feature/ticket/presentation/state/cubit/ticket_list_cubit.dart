// presentation/state/cubit/tickets_list_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbooking/feature/ticket/domain/entity/ticket_entity.dart';
import 'package:mbooking/feature/ticket/domain/usecase/get_user_tickets_usecase.dart';

part 'ticket_list_state.dart';

class TicketsListCubit extends Cubit<TicketsListState> {
  final GetUserTicketsUseCase getUserTickets;

  TicketsListCubit(this.getUserTickets) : super(const TicketsListInitial());

  Future<void> load() async {
    emit(const TicketsListLoading());
    final result = await getUserTickets();
    result.fold(
      (f) => emit(TicketsListError(f.message)),
      (tickets) => emit(TicketsListLoaded(tickets)),
    );
  }
}
