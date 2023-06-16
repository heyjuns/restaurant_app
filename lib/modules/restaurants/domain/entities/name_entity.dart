import 'package:equatable/equatable.dart';

class NameEntity extends Equatable {
  final String name;

  const NameEntity({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
