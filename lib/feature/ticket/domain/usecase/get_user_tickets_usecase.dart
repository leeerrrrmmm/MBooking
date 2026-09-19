// domain/usecase/get_user_tickets_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:mbooking/core/error/failures.dart';
import 'package:mbooking/feature/ticket/domain/entity/ticket_entity.dart';
import 'package:mbooking/feature/ticket/domain/repo/ticket_repo.dart';

class GetUserTicketsUseCase {
  final TicketRepository repository;
  GetUserTicketsUseCase(this.repository);

  Future<Either<Failure, List<TicketEntity>>> call() async {
    return await repository.getUserTickets();
  }
}
