import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';

// Parameters i can give it any name like hamada
abstract class BaseUseCase<T, Parameters> {

  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {

  const NoParameters();

  @override
  List<Object> get props => [];
}