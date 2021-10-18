import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/models/home/home_model.dart';
import 'package:myshop/shared/components/constants.dart';
import 'package:myshop/shared/cubit/states.dart';
import 'package:myshop/shared/networks/end_point.dart';
import 'package:myshop/shared/networks/remote/DioHelper.dart';


class MyShopCubit extends Cubit<MyShopStates> {
  MyShopCubit() : super(MyShopInitialState());

  static MyShopCubit get(context) => BlocProvider.of(context);



  HomeModel? homeModel;

  void getHomeData() {
    emit(MyShopLoadingHomeState());
    DioHelper.getData(url: HOME).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel!.data!.banners[0].image);
      emit(MyShopSuccessHomeState());
    }).catchError((error) {
      print(error.toString());
      emit(MyShopErrorHomeState());
    });
  }


}
