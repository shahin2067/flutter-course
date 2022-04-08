
import 'package:final_project/models/user.dart';
import 'package:get/get.dart';



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


}