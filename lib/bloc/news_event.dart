part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class NewsFetchEvent extends NewsEvent {
  NewsFetchEvent();
  @override
  List<Object> get props => [];
}

class NewsTopIdEvent extends NewsEvent {
  NewsTopIdEvent({bool hasReachedMax, List posts});
  @override
  List<Object> get props => [];
}
