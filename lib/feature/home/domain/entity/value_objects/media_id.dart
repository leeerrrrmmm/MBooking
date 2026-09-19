import 'package:equatable/equatable.dart';

class MediaId extends Equatable {
  const MediaId(this.value);

  final int value;

  @override
  List<Object?> get props => [value];
}
