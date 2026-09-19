import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

enum ConnectivityStatus { unknown, online, offline }

class ConnectivityCubit extends Cubit<ConnectivityStatus> {
  ConnectivityCubit(this._connection) : super(ConnectivityStatus.unknown) {
    _subscription = _connection.onStatusChange.listen(_onStatus);
    unawaited(check());
  }

  final InternetConnection _connection;
  StreamSubscription<InternetStatus>? _subscription;

  Future<void> check() async {
    final hasAccess = await _connection.hasInternetAccess;
    if (isClosed) return;
    emit(hasAccess ? ConnectivityStatus.online : ConnectivityStatus.offline);
  }

  void _onStatus(InternetStatus status) {
    if (isClosed) return;
    emit(
      status == InternetStatus.connected
          ? ConnectivityStatus.online
          : ConnectivityStatus.offline,
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
