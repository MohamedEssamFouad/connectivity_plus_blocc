import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  InternetBloc() : _connectivity = Connectivity(), super(InternetInitial()) {
    _initializeConnectivitySubscription();
    on<InternetEvent>((event, emit) {
      if (event is connectedInt) {
        emit(ConnectedState(message: "Connected"));
      } else if (event is NotConnectedInt) {
        emit(NotConnectedState(message: "Not Connected"));
      }
    });
  }

  void _initializeConnectivitySubscription() async {
    final ConnectivityResult result = await _connectivity.checkConnectivity();
    print('Initial connectivity check: $result');
    _onConnectivityChanged(result);

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
  }

  void _onConnectivityChanged(ConnectivityResult result) {
    print('Connectivity changed: $result');
    if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
      add(connectedInt());
    } else if (result == ConnectivityResult.none) {
      add(NotConnectedInt());
    }
  }


  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
