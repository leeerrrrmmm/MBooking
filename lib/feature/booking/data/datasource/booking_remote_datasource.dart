// data/datasource/booking_remote_datasource.dart
import 'package:mbooking/feature/payment/data/models/payment_request_method.dart';
import 'package:mbooking/feature/payment/data/models/payment_response_model.dart';

abstract class BookingRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchSeats({
    required int movieId,
    required String cinemaId,
    required String date,
    required String time,
  });
  Future<PaymentResponseModel> pay(PaymentRequestModel request);
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchSeats({
    required int movieId,
    required String cinemaId,
    required String date,
    required String time,
  }) async {
    // return (await dio.get(...)).data;
    return [];
  }

  // final Dio dio;
  // BookingRemoteDataSourceImpl(this.dio);

  @override
  Future<PaymentResponseModel> pay(PaymentRequestModel request) async {
    // final response = await dio.post('/bookings/pay', data: request.toJson());
    // return PaymentResponseModel.fromJson(response.data);

    // fake пока нет бэка
    await Future.delayed(const Duration(seconds: 1));
    return PaymentResponseModel(
      ticketId: 'TKT-${DateTime.now().millisecondsSinceEpoch}',
      status: 'confirmed',
      purchasedAt: DateTime.now().toIso8601String(),
    );
  }
}
