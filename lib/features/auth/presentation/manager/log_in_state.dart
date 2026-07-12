import 'package:equatable/equatable.dart';
import 'package:men_store_app/core/models/user_model.dart';

abstract class LogInState extends Equatable {
  const LogInState();

  @override
  List<Object?> get props => [];
}

class LogInInitial extends LogInState {
  const LogInInitial();
}

class LogInLoading extends LogInState {
  const LogInLoading();
}

class LogInSuccess extends LogInState {
  final UserModel userModel;
  const LogInSuccess(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class LogInError extends LogInState {
  final String errorMessage;
  const LogInError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
