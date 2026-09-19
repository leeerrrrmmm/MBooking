// feature/ticket/data/repositories/ticket_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:mbooking/core/error/app_exception.dart';
import 'package:mbooking/core/error/failures.dart';
import 'package:mbooking/feature/ticket/data/dataource/ticket_remote_datasource.dart';
import 'package:mbooking/feature/ticket/data/model/ticket_model.dart';
import 'package:mbooking/feature/ticket/domain/entity/ticket_entity.dart';
import 'package:mbooking/feature/ticket/domain/repo/ticket_repo.dart';

class TicketRepositoryImpl implements TicketRepository {
  final TicketRemoteDataSource remote;

  TicketRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, TicketEntity>> saveTicket(TicketEntity ticket) async {
    try {
      final model = TicketModel(
        id: ticket.id,
        orderId: ticket.orderId,
        movieId: ticket.movieId,
        title: ticket.title,
        posterPath: ticket.posterPath,
        genres: ticket.genres,
        cinemaId: ticket.cinemaId,
        cinemaName: ticket.cinemaName,
        cinemaAddress: ticket.cinemaAddress,
        date: ticket.date,
        time: ticket.time,
        seatsLabel: ticket.seatsLabel,
        totalPrice: ticket.totalPrice,
        paymentMethod: ticket.paymentMethod,
        transactionId: ticket.transactionId,
        createdAt: ticket.createdAt,
      );
      final saved = await remote.saveTicket(model);
      return Right(saved);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TicketEntity>> getTicketById(String ticketId) async {
    try {
      final ticket = await remote.getTicketById(ticketId);
      return Right(ticket);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TicketEntity>>> getUserTickets() async {
    try {
      final list = await remote.getUserTickets();
      return Right(list);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
