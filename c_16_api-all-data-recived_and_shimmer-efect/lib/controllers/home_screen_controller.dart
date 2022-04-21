
import 'package:final_project/models/eshopModel/categoryModel/EshopCategoryModel.dart';
import 'package:final_project/models/user.dart';
import 'package:final_project/utils/apis.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../models/JsonHolderData.dart';
import '../models/picsumModel/PicSumModel.dart';



class HomeScreenController extends GetxController{

  var myValue=0.obs;
  var appBarName='Home Screen'.obs;
  var cgpa=0.0.obs;
  var myUserList=[].obs;
  var myMap={}.obs;
  var isActive=false.obs;
  List<String> myList=[];
  var name=<String>['s'].obs;
  var number=<int>[1].obs;
  var userModel=<UserModel>[].obs;


  var postList=<JsonHolderData>[].obs;
  var picSumDataList=<PicSumModel>[].obs;

  RxObjectMixin<EshopCategoryModel> myEshopCategoryData = EshopCategoryModel().obs;

  var isLoading = false.obs;






  @override
  void onInit() {
    print('OnInit Method Called');
    //cgpa.value=3.5;
    getEshopCategories();
    super.onInit();
  }

  @override
  void onClose() {
    print('onClose Method Called');
    cgpa.close();
    super.onClose();
  }

  void getEshopCategories() async{

    var url='https://picsum.photos/v2/list?page=3&limit=5';


    Dio  dio=Dio(BaseOptions(
      baseUrl:Apis.baseUrlEshop,
      headers: {
        'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjIwMDE3OTAyMDUsImlhdCI6MTY0MTc5MDIwNSwiaXNzIjoiZXNob3AifQ.pMhVWFe_ql39Pdt4jh0D3v-_cQsO0XgqDUVlUSwEb6E'
      },
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());
    try{
      if (connectivityResult == ConnectivityResult.none) {
        EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));

        print('No Internet Connection');
      }else{
        isLoading.value = true;
        print('Internet Connected');
        // EasyLoading.show(status: 'loading...');
        var response=await dio.post(Apis.eshopCategories);
        if(response.statusCode==200){

          var myReceivedData = response.data;

          // EasyLoading.showSuccess('Great Success!');
          EasyLoading.showToast(response.data['message'], duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
          print('HTTP Mehtod: ${response.requestOptions.method} ');
          print('HTTP URL: ${response.requestOptions.baseUrl} ');
          print('HTTP Path: ${response.requestOptions.path} ');
          print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');

          myEshopCategoryData.value = EshopCategoryModel.fromJson(myReceivedData);

          print('My Popular Data List Length From Model: ${myEshopCategoryData.value.popularCategories?.length??0}');

          // var myPopularData = myReceivedData['popular_categories'] as List;
          // var myDataList = myReceivedData['data'] as List;
          //
          // print('My Popular Data List Length: ${myPopularData.length}');
          // print('My DataList Length: ${myDataList.length}');

          // var myPostData=response.data as List;
          //
          // var newList=myPostData.map((e) => PicSumModel.fromJson(e)).toList();
          //
          // picSumDataList.clear();
          // picSumDataList.addAll(newList);
          //
          // print('dfdsf ${picSumDataList.length}');



        }else{
          print('Failed to load data');
        }
      }
    }catch(e){
      print('Error occurred: $e');
      EasyLoading.showError('Failed to Load data');
    }finally{
      //EasyLoading.dismiss();
      isLoading.value = false;
    }
  }

}