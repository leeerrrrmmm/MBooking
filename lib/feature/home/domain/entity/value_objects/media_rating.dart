import 'package:equatable/equatable.dart';

class MediaRating extends Equatable {
  const MediaRating({required this.average, this.voteCount = 0});

  final double average;
  final int voteCount;

  @override
  List<Object?> get props => [average, voteCount];
}
