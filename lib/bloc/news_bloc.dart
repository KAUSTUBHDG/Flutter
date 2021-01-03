import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_api/news_api_provider.dart';
//import 'package:weather_api/repository.dart';
import 'package:weather_api/item_models.dart';
import 'package:weather_api/repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({this.httpClient}) : super(NewsInitialState());

  final http.Client httpClient;
  NewsApiProvider newsApiProvider;
  Repository repository;
  ItemModel itemModel;

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    final currentState = state;
    if (event is NewsFetchEvent && !_hasReachedMax(currentState)) {
      try {
        if (currentState is NewsTopIdState) {
          final posts = await newsApiProvider.fetchTopIds();
          yield NewsTopIdState(posts: posts, hasReachedMax: false);
        }
        if (currentState is NewsFetchState) {
          final post =
              await newsApiProvider.fetchItem(currentState.props.length);
          yield NewsFetchState(id: post);
        }
      } catch (e) {
        yield NewsErrorState();
      }
    } else {}
  }

  bool _hasReachedMax(NewsState state) =>
      state is NewsTopIdState && state.hasReachedMax;
}
