
import 'package:final_project/models/JsonHolderData.dart';
import 'package:final_project/models/user.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';



class HomeScreenController extends GetxController{
  
  @override
  void onInit() {
     _fetchPostData();
    //_fetchPostDataParameterData();
    super.onInit();
  }



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


  Future <void> _fetchPostData() async {
    var myUrl = 'https://jsonplaceholder.typicode.com';

    Dio dio = Dio(BaseOptions(
        baseUrl: myUrl,
    ));

    var response = await dio.get('/posts');

    if(response.statusCode == 200) {
      print('Method: ${response.requestOptions.method}');
      print('Base URL: ${response.requestOptions.baseUrl}');
      print('Base Path: ${response.requestOptions.path}');
      print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');

      var myPostsData = response.data as List;
      //print('HTTP DATA: $myPostsData');
      var newList = myPostsData.map((e) => JsonHolderData.fromJson(e)).toList();
      postList.addAll(newList);

      print('Length: ${postList.length}');


    } else{
      print('Failed to Load data');
    }

  }



  Future <void> _fetchPostDataParameterData() async {
    var myUrl = 'https://jsonplaceholder.typicode.com';

    Dio dio = Dio(BaseOptions(
      baseUrl: myUrl,
    ));

    var response = await dio.get('/api/', queryParameters: {'results': '10'});

    if(response.statusCode == 200) {
      print('Method: ${response.requestOptions.method}');
      print('Base URL: ${response.requestOptions.baseUrl}');
      print('Base Path: ${response.requestOptions.path}');
      print('HTTP Status Code: ${response.statusCode} Status Message: ${response.statusMessage}');

      var myPostsData = response.data as List;
      //print('HTTP DATA: $myPostsData');
      var newList = myPostsData.map((e) => JsonHolderData.fromJson(e)).toList();


      // postList.addAll(newList);
      //
      // print('Length: ${postList.length}');


    } else{
      print('Failed to Load data');
    }

  }


}