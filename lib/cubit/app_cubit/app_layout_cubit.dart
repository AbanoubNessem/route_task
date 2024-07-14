import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:route_task/cubit/app_cubit/app_layout_state.dart';
import 'package:route_task/models/products_model/products_model.dart';
import 'package:route_task/services/dio_helper.dart';
import 'package:route_task/services/end_points.dart';


class AppLayoutCubit extends Cubit<AppLayoutStates>{
  AppLayoutCubit():super(HomeInitialState());

  static AppLayoutCubit get(context) => BlocProvider.of<AppLayoutCubit>(context);


  Products products = Products();

  void getHomeData(){
    emit(GetDataLoadingState());
    DioHelper.getData(url: PRODUCTS,query: {}).then((value){
      products = Products.fromJson(value.data);
      emit(GetDataSuccessState());
    }).catchError((error){
      print("ERROR FROM GET DATA ::: $error");
      emit(GetDataErrorState(error: error));
    });
  }

}