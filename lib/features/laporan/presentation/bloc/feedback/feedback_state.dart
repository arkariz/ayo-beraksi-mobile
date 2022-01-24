part of 'feedback_bloc.dart';

abstract class FeedbackState extends Equatable {
  final Feedback? feedback;
  final DioError? error;

  const FeedbackState({this.feedback, this.error});

  @override
  List<Object?> get props => [feedback, error];
}

class FeedbackInitial extends FeedbackState {}

class FeedbackSuccess extends FeedbackState {
  const FeedbackSuccess(Feedback? feedback) : super(feedback: feedback);
}

class FeedbackFailed extends FeedbackState {
  const FeedbackFailed(DioError? error) : super(error: error);
}
