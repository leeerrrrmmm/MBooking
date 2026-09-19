import 'package:equatable/equatable.dart';

class MediaTitle extends Equatable {
  const MediaTitle({required this.title, required this.originalTitle});

  final String title;
  final String originalTitle;

  @override
  List<Object?> get props => [title, originalTitle];
}
