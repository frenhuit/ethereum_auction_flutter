import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:redux/redux.dart';

class ActionLoggingMiddleware extends MiddlewareClass<AppState> {
  List<dynamic> dispatchedActions = [];

  void reset() => dispatchedActions.clear();

  @override
  void call(Store<AppState> _, dynamic action, NextDispatcher next) {
    dispatchedActions.add(action);
    next(action);
  }
}

class ActionLoggingReducer extends ReducerClass<AppState> {
  List<dynamic> dispatchedActions = [];

  void reset() => dispatchedActions.clear();

  @override
  AppState call(AppState state, dynamic action) {
    dispatchedActions.add(action);
  }
}
