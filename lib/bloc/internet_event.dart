part of 'internet_bloc.dart';

@immutable
sealed class InternetEvent {}

class connectedInt extends InternetEvent{}

class NotConnectedInt extends InternetEvent{}