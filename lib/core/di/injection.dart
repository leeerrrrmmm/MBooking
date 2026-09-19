import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mbooking/core/network/connectivity_cubit.dart';
import 'package:mbooking/core/network/dio_client.dart';
import 'package:mbooking/core/user/data/datasource/current_user_remote_datasource.dart';
import 'package:mbooking/core/user/data/repo_impl/current_user_repository_impl.dart';
import 'package:mbooking/core/user/domain/repo/current_user_repository.dart';
import 'package:mbooking/core/user/presentation/state/cubit/current_user_cubit.dart';
import 'package:mbooking/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:mbooking/feature/auth/data/repo/auth_repo.dart';
import 'package:mbooking/feature/auth/domain/repo/auth_repo.dart';
import 'package:mbooking/feature/auth/domain/usecase/sign_in_with_email_usecase.dart';
import 'package:mbooking/feature/auth/domain/usecase/sign_out_usecase.dart';
import 'package:mbooking/feature/auth/domain/usecase/sign_up_with_email_usecase.dart';
import 'package:mbooking/feature/auth/presentation/state/cubit/auth_cubit.dart';
import 'package:mbooking/feature/profile/data/datasource/profile_remote_datasource.dart';
import 'package:mbooking/feature/profile/data/repo/profile_repository_impl.dart';
import 'package:mbooking/feature/profile/domain/repo/profile_repository.dart';
import 'package:mbooking/feature/profile/domain/usecase/change_password_usecase.dart';
import 'package:mbooking/feature/profile/domain/usecase/update_display_name_usecase.dart';
import 'package:mbooking/feature/profile/presentation/state/cubit/profile_cubit.dart';
import 'package:mbooking/feature/booking/data/datasource/booking_local_datasource.dart';
import 'package:mbooking/feature/booking/data/datasource/booking_remote_datasource.dart';
import 'package:mbooking/feature/booking/data/repo/booking_repo_impl.dart';
import 'package:mbooking/feature/booking/domain/repo/booking_repository.dart';
import 'package:mbooking/feature/booking/domain/usecase/reset_booking.dart';
import 'package:mbooking/feature/booking/domain/usecase/select_seats.dart';
import 'package:mbooking/feature/booking/domain/usecase/select_session.dart';
import 'package:mbooking/feature/booking/domain/usecase/start_booking.dart';
import 'package:mbooking/feature/booking/presentation/state/cubit/booking_cubit.dart';
import 'package:mbooking/feature/home/data/datasource/genre/genre_remote_data_source.dart';
import 'package:mbooking/feature/home/data/datasource/genre/genre_remote_data_source_impl.dart';
import 'package:mbooking/feature/home/data/datasource/movie/movie_remote_data_source.dart';
import 'package:mbooking/feature/home/data/datasource/movie/movie_remote_data_source_impl.dart';
import 'package:mbooking/feature/home/data/repo/genre_cache/genre_cache.dart';
import 'package:mbooking/feature/home/data/repo/movie_repo_impl.dart';
import 'package:mbooking/feature/home/domain/repo/movie_repo/movie_repo.dart';
import 'package:mbooking/feature/home/domain/usecases/detail/fetch_movie_details.dart';
import 'package:mbooking/feature/home/domain/usecases/movie/fetch_popular_movies.dart';
import 'package:mbooking/feature/home/domain/usecases/movie/fetch_upcoming_movies.dart';
import 'package:mbooking/feature/home/presentation/state/detail/cubit/detail_movie_cubit.dart';
import 'package:mbooking/feature/home/presentation/state/popular/cubit/popular_movies_cubit.dart';
import 'package:mbooking/feature/home/presentation/state/upcoming/cubit/upcoming_movies_cubit.dart';
import 'package:mbooking/feature/payment/data/datasource/payment_datasource.dart';
import 'package:mbooking/feature/payment/data/mock/mock_payment_datasource.dart';
import 'package:mbooking/feature/payment/data/repo/payment_repo_impl.dart';
import 'package:mbooking/feature/payment/domain/repo/payment_repo.dart';
import 'package:mbooking/feature/payment/domain/usecase/complete_payment.dart';
import 'package:mbooking/feature/payment/presentation/state/cubit/payment_cubit.dart';
import 'package:mbooking/feature/ticket/data/dataource/ticket_remote_datasource.dart';
import 'package:mbooking/feature/ticket/data/repo/ticket_repo_impl.dart';
import 'package:mbooking/feature/ticket/domain/repo/ticket_repo.dart';
import 'package:mbooking/feature/ticket/domain/usecase/get_user_tickets_usecase.dart';
import 'package:mbooking/feature/ticket/domain/usecase/save_ticket_usecase.dart';
import 'package:mbooking/feature/ticket/presentation/state/cubit/ticket_list_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<Dio>(
    () => createDio(
      apiKey: const String.fromEnvironment(
        'TMDB_API_KEY',
        defaultValue: 'c34e7208333be19aa3b45750f44e2f62',
      ),
    ),
  );
  //External
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<InternetConnection>(() => InternetConnection());
  sl.registerLazySingleton(() => ConnectivityCubit(sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl(), sl()),
  );
  sl.registerLazySingleton<CurrentUserRemoteDataSource>(
    () => CurrentUserRemoteDataSourceImpl(sl(), sl()),
  );
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(sl(), sl()),
  );

  /// Data sources

  sl.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<GenreRemoteDataSource>(
    () => GenreRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<BookingRemoteDataSource>(
    () => BookingRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<BookingLocalDataSource>(
    () => BookingLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<PaymentDataSource>(() => StripePaymentDataSource());
  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<TicketRemoteDataSource>(
    () => TicketRemoteDataSourceImpl(firestore: sl(), auth: sl()),
  );
  sl.registerLazySingleton<TicketRepository>(() => TicketRepositoryImpl(sl()));

  /// Repositories

  sl.registerLazySingleton<GenreCache>(() => GenreCache(sl()));
  sl.registerLazySingleton<MovieRepo>(() => MovieRepoImpl(sl(), sl()));
  sl.registerLazySingleton<BookingRepository>(
    () => BookingRepositoryImpl(remote: sl(), local: sl()),
  );
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<CurrentUserRepository>(
    () => CurrentUserRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl()),
  );

  /// Usecases
  sl.registerLazySingleton(() => StartBooking(sl()));
  sl.registerLazySingleton(() => SelectSession(sl()));
  sl.registerLazySingleton(() => SelectSeats(sl()));
  // sl.registerLazySingleton(() => SelectPaymentMethod(sl()));
  // sl.registerLazySingleton(() => ConfirmPayment(sl()));
  sl.registerLazySingleton(() => ResetBooking(sl()));
  sl.registerLazySingleton(() => FetchUpcomingMovies(sl()));
  sl.registerLazySingleton(() => FetchPopularMovies(sl()));
  sl.registerLazySingleton(() => FetchMovieDetailsUsecase(sl()));
  sl.registerLazySingleton(() => SignInWithEmailUseCase(sl()));
  sl.registerLazySingleton(() => SignUpWithEmailUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  sl.registerLazySingleton(() => UpdateDisplayNameUseCase(sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(sl()));
  sl.registerLazySingleton(() => SaveTicketUseCase(sl()));
  sl.registerLazySingleton(
    () => CompletePayment(
      paymentRepository: sl(),
      saveTicket: sl(),
      createTicket: sl(),
    ),
  );
  sl.registerLazySingleton(() => GetUserTicketsUseCase(sl()));

  /// Cubits
  sl.registerLazySingleton(() => CurrentUserCubit(sl()));
  sl.registerLazySingleton(
    () =>
        AuthCubit(signInWithEmail: sl(), signUpWithEmail: sl(), signOut: sl()),
  );
  sl.registerFactory(
    () => ProfileCubit(updateDisplayName: sl(), changePassword: sl()),
  );
  sl.registerFactory(
    () => BookingCubit(
      startBooking: sl(),
      selectSession: sl(),
      selectSeats: sl(),
      // selectPaymentMethod: sl(),
      // confirmPayment: sl(),
      resetBooking: sl(),
    ),
  );

  sl.registerFactory(() => TicketsListCubit(sl()));
  sl.registerFactory(() => PaymentCubit(sl<CompletePayment>()));
  sl.registerFactory(() => PopularMoviesCubit(sl()));
  sl.registerFactory(() => UpcomingMoviesCubit(sl()));
  sl.registerFactory(() => DetailMovieCubit(sl()));
}
