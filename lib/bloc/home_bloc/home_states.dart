abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {
  String msg = '';
  HomeSuccess(this.msg);
}

class HomeFailure extends HomeStates {
  String msg = '';
  HomeFailure(this.msg);
}
