part of 'feedback_bloc.dart';

abstract class FeedbackEvent extends Equatable {
  const FeedbackEvent();

  @override
  List<Object> get props => [];
}

class AddFeedback extends FeedbackEvent {
  final Map<String, dynamic> laporan;

  const AddFeedback(this.laporan);
}
