import 'dart:async';
import 'package:nutrition_app/models/meals.dart';
import 'package:nutrition_app/repositories/repository.dart';
import 'package:nutrition_app/repositories/state.dart';
import 'package:rxdart/rxdart.dart';
import 'bloc_base.dart';

class HomeScreenBloc extends BlocBase {
  static Repository _repository = Repository();
  PublishSubject<String> _query;

  init() {
    _query = PublishSubject<String>();
  }

  Observable<MealsModel> get mealsList => _query.stream
      .debounceTime(Duration(milliseconds: 300))
      .where((String value) => value.isNotEmpty)
      .distinct()
      .transform(streamTransformer);

  final streamTransformer = StreamTransformer<String, MealsModel>.fromHandlers(
      handleData: (query, sink) async {
        State state = await _repository.mealData(query);
        if (state is SuccessState) {
          sink.add(state.value);
        } else {
          sink.addError((state as ErrorState).msg);
        }
      });

  Function(String) get changeQuery => _query.sink.add;

  @override
  void dispose() {
    _query.close();
  }

}

final bloc = HomeScreenBloc();