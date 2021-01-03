part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsErrorState extends NewsState {}

class NewsTopIdState extends NewsState {
  final List posts;
  final bool hasReachedMax;

  NewsTopIdState({this.posts, this.hasReachedMax});

  NewsTopIdState copyWith({List posts, bool hasReachedMax}) {
    return NewsTopIdState(
        posts: posts ?? this.posts,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  String toString() =>
      'PostSuccess { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
}

class NewsFetchState extends NewsState {
  final ItemModel id;

  NewsFetchState({this.id});

  NewsFetchState copyWith({ItemModel id}) {
    return NewsFetchState(id: id ?? this.id);
  }

  @override
  List<Object> get props => [id];
}
