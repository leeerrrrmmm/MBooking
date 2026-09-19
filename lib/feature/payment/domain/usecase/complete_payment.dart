// feature/payment/domain/usecases/complete_payment.dart
import 'package:dartz/dartz.dart';
import 'package:mbooking/core/error/failures.dart';
import 'package:mbooking/feature/booking/domain/entity/booking_draft.dart';
import 'package:mbooking/feature/payment/domain/entity/payment_result.dart';
import 'package:mbooking/feature/payment/domain/repo/payment_repo.dart';
import 'package:mbooking/feature/ticket/domain/entity/ticket_entity.dart';
import 'package:mbooking/feature/ticket/domain/usecase/create_ticket_from_booking_usecase.dart';
import 'package:mbooking/feature/ticket/domain/usecase/save_ticket_usecase.dart';

class CompletePayment {
  final PaymentRepository paymentRepository;
  final SaveTicketUseCase saveTicket;
  final CreateTicketFromBookingUseCase createTicket;

  CompletePayment({
    required this.paymentRepository,
    required this.saveTicket,
    required this.createTicket,
  });

  Future<Either<Failure, TicketEntity>> call({
    required BookingDraft draft,
    required double amount,
  }) async {
    try {
      final PaymentResult result = await paymentRepository.chargeFromDraft(
        draft: draft,
        amount: amount,
      );

      final ticket = createTicket(draft: draft, result: result);
      return await saveTicket(ticket);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
