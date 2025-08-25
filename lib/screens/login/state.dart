part of 'cubit.dart';

class LoginState extends Equatable {
  final int timeLockLoginFail;
  final int timeLockLoginPhoneNumber;
  final bool isChanged;

  const LoginState({this.timeLockLoginFail = 0, this.timeLockLoginPhoneNumber = 0, this.isChanged = false});

  LoginState copyWith({int? timeLockLoginFail, int? timeLockLoginPhoneNumber, bool? isChanged}) {
    return LoginState(
      timeLockLoginFail: timeLockLoginFail ?? this.timeLockLoginFail,
      timeLockLoginPhoneNumber: timeLockLoginPhoneNumber ?? this.timeLockLoginPhoneNumber,
      isChanged: isChanged ?? this.isChanged,
    );
  }

  @override
  List<Object?> get props => [timeLockLoginFail, timeLockLoginPhoneNumber, isChanged];
}
