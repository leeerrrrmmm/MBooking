// domain/usecases/save_ticket.dart
import 'package:dartz/dartz.dart';
import 'package:mbooking/core/error/failures.dart';
import 'package:mbooking/feature/ticket/domain/entity/ticket_entity.dart';
import 'package:mbooking/feature/ticket/domain/repo/ticket_repo.dart';

class SaveTicketUseCase {
  final TicketRepository repository;
  SaveTicketUseCase(this.repository);

  Future<Either<Failure, TicketEntity>> call(TicketEntity ticket) async {
    return await repository.saveTicket(ticket);
  }
}
