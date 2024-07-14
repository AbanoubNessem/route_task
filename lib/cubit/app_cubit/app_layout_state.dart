

abstract class AppLayoutStates{}
class HomeInitialState extends AppLayoutStates {}


class GetDataLoadingState extends AppLayoutStates {}
class GetDataSuccessState extends AppLayoutStates {}
class GetDataErrorState extends AppLayoutStates {
  var error ;
  GetDataErrorState({required this.error});
}

