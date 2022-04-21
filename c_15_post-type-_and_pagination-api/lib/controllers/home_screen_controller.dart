
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






  @override
  void onInit() {
    print('OnInit Method Called');
    cgpa.value=3.5;
    // _fetchPostData();
    // _postDataToJsonHolder();
    // _fetchPostData1();
    // _putDataToJsonHolder();
    // _patchDataToJsonHolder();
    // _deleteDataToJsonHolder();

    // getPaginationData( pageNo: 3);
    super.onInit();
  }

  @override
  void onClose() {
    print('onClose Method Called');
    cgpa.close();
    super.onClose();
  }




  void increment(){
    myValue.value++;
    myUserList.add('Item-${myValue.value}');
  }


  void removeItem(int index){
    myUserList.removeAt(index);
  }

  void updateItem(int i) {
    myUserList[i]='Samir';
  }

  Future<void> _fetchPostData() async{
    Dio  dio=Dio(BaseOptions(
      baseUrl:Apis.baseUrl,
    ));
    var connectivityResult = await (Connectivity().checkConnectivity());
    try{
      if (connectivityResult == ConnectivityResult.none) {
        EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));

        print('No Internet Connection');
      }else{
        print('Internet Connected');
        EasyLoading.show(status: 'loading...');
        var response=await dio.get(Apis.getJsonHolderPostData);
        if(response.statusCode==200){
          // EasyLoading.showSuccess('Great Success!');
          EasyLoading.showToast('Data loaded successfully', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
          print('HTTP Mehtod: ${response.requestOptions.method} ');
          print('HTTP URL: ${response.requestOptions.baseUrl} ');
          print('HTTP Path: ${response.requestOptions.path} ');
          print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');

          var myPostData=response.data as List;

          var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();

          postList.addAll(newList);
          //print(postList[0].body);

          print('dfdsf ${postList.length}');


        }else{
          print('Failed to load data');
        }
      }
    }catch(e){
      print('Error occurred: $e');
      EasyLoading.showError('Failed to Load data');
    }finally{
      EasyLoading.dismiss();

    }
  }

  Future<void> _postDataToJsonHolder() async{
    Dio  dio=Dio(BaseOptions(
      baseUrl:Apis.baseUrl,
    ));
    var connectivityResult = await (Connectivity().checkConnectivity());
    try{
      if (connectivityResult == ConnectivityResult.none) {
        EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));

        print('No Internet Connection');
      }else{
        print('Internet Connected');
        EasyLoading.show(status: 'loading...');
        var response=await dio.post(Apis.getJsonHolderPostData, data: {
          'userId':'10',
          'title':'my title',
          'body':'My body'
        });

        if(response.statusCode==201){
          // EasyLoading.showSuccess('Great Success!');

          print('HTTP Mehtod: ${response.requestOptions.method} ');
          print('HTTP URL: ${response.requestOptions.baseUrl} ');
          print('HTTP Path: ${response.requestOptions.path} ');
          print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');

          var myPostData=response.data;

          EasyLoading.showToast('Data loaded successfully at:\n${myPostData['id']}', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );

          //
          // var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          //
          // postList.addAll(newList);
          //
          // print('dfdsf ${postList.length}');


        }else{
          print('Failed to load data');
        }
      }
    }catch(e){
      print('Error occurred: $e');
      EasyLoading.showError('Failed to Load data');
    }finally{
      EasyLoading.dismiss();

    }
  }

  Future<void> _putDataToJsonHolder() async{
    Dio  dio=Dio(BaseOptions(
      baseUrl:Apis.baseUrl,
    ));
    var connectivityResult = await (Connectivity().checkConnectivity());
    try{
      if (connectivityResult == ConnectivityResult.none) {
        EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));

        print('No Internet Connection');
      }else{
        print('Internet Connected');
        EasyLoading.show(status: 'loading...');
        var response=await dio.put(Apis.getJsonHolderPostDataByPostId+'50', data: {
          'userId':'10',
          'title':'my title',
          'body':'My body'
        });

        if(response.statusCode==200){
          // EasyLoading.showSuccess('Great Success!');

          print('HTTP Mehtod: ${response.requestOptions.method} ');
          print('HTTP URL: ${response.requestOptions.baseUrl} ');
          print('HTTP Path: ${response.requestOptions.path} ');
          print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');

          var myPostData=response.data;

          EasyLoading.showToast('Updated successfully at:\n${myPostData['id']}', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );

          //
          // var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          //
          // postList.addAll(newList);
          //
          // print('dfdsf ${postList.length}');


        }else{
          print('Failed to load data');
        }
      }
    }catch(e){
      print('Error occurred: $e');
      EasyLoading.showError('Failed to Load data');
    }finally{
      EasyLoading.dismiss();

    }
  }

  Future<void> _patchDataToJsonHolder() async{
    Dio  dio=Dio(BaseOptions(
      baseUrl:Apis.baseUrl,
    ));
    var connectivityResult = await (Connectivity().checkConnectivity());
    try{
      if (connectivityResult == ConnectivityResult.none) {
        EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));

        print('No Internet Connection');
      }else{
        print('Internet Connected');
        EasyLoading.show(status: 'loading...');
        var response=await dio.patch(Apis.getJsonHolderPostDataByPostId+'50', data: {
          'userId':'10',
          'title':'my title',
          'body':'My body'
        });

        if(response.statusCode==200){
          // EasyLoading.showSuccess('Great Success!');

          print('HTTP Mehtod: ${response.requestOptions.method} ');
          print('HTTP URL: ${response.requestOptions.baseUrl} ');
          print('HTTP Path: ${response.requestOptions.path} ');
          print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');

          var myPostData=response.data;

          EasyLoading.showToast('Updated successfully at:\n${myPostData['id']}', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );

          //
          // var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          //
          // postList.addAll(newList);
          //
          // print('dfdsf ${postList.length}');


        }else{
          print('Failed to load data');
        }
      }
    }catch(e){
      print('Error occurred: $e');
      EasyLoading.showError('Failed to Load data');
    }finally{
      EasyLoading.dismiss();

    }
  }

  Future<void> _deleteDataToJsonHolder() async{
    Dio  dio=Dio(BaseOptions(
      baseUrl:Apis.baseUrl,
    ));
    var connectivityResult = await (Connectivity().checkConnectivity());
    try{
      if (connectivityResult == ConnectivityResult.none) {
        EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));

        print('No Internet Connection');
      }else{
        print('Internet Connected');
        EasyLoading.show(status: 'loading...');
        var response=await dio.delete(Apis.getJsonHolderPostDataByPostId+'19');

        if(response.statusCode==200){
          // EasyLoading.showSuccess('Great Success!');

          print('HTTP Mehtod: ${response.requestOptions.method} ');
          print('HTTP URL: ${response.requestOptions.baseUrl} ');
          print('HTTP Path: ${response.requestOptions.path} ');
          print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');

          var myPostData=response.data;

          EasyLoading.showToast('Record deleted successfully ', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );

          //
          // var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
          //
          // postList.addAll(newList);
          //
          // print('dfdsf ${postList.length}');


        }else{
          print('Failed to load data');
        }
      }
    }catch(e){
      print('Error occurred: $e');
      EasyLoading.showError('Failed to Load data');
    }finally{
      EasyLoading.dismiss();

    }
  }

  void getPaginationData({required int pageNo}) async{

    var url='https://picsum.photos/v2/list?page=3&limit=5';


    Dio  dio=Dio(BaseOptions(
      baseUrl:'https://picsum.photos',
    ));
    var connectivityResult = await (Connectivity().checkConnectivity());
    try{
      if (connectivityResult == ConnectivityResult.none) {
        EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));

        print('No Internet Connection');
      }else{
        print('Internet Connected');
        EasyLoading.show(status: 'loading...');
        var response=await dio.get('/v2/list', queryParameters:{
            'page':'$pageNo',
            'limit':'5'
        } );
        if(response.statusCode==200){
          // EasyLoading.showSuccess('Great Success!');
          EasyLoading.showToast('Data loaded successfully', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
          print('HTTP Mehtod: ${response.requestOptions.method} ');
          print('HTTP URL: ${response.requestOptions.baseUrl} ');
          print('HTTP Path: ${response.requestOptions.path} ');
          print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');

          var myPostData=response.data as List;

          var newList=myPostData.map((e) => PicSumModel.fromJson(e)).toList();

          picSumDataList.clear();
          picSumDataList.addAll(newList);

          print('dfdsf ${picSumDataList.length}');



        }else{
          print('Failed to load data');
        }
      }
    }catch(e){
      print('Error occurred: $e');
      EasyLoading.showError('Failed to Load data');
    }finally{
      EasyLoading.dismiss();

    }
  }





}