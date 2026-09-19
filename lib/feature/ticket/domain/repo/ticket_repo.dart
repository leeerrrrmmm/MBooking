import 'package:dartz/dartz.dart';
import 'package:mbooking/core/error/failures.dart';
import 'package:mbooking/feature/ticket/domain/entity/ticket_entity.dart';

abstract class TicketRepository {
  Future<Either<Failure, TicketEntity>> saveTicket(TicketEntity ticket);
  Future<Either<Failure, TicketEntity>> getTicketById(String ticketId);
  Future<Either<Failure, List<TicketEntity>>> getUserTickets();
}
