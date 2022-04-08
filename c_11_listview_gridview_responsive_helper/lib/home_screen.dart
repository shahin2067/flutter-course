import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_102_code/models/my_user_model.dart';
import 'package:flutter_102_code/responsive_helper.dart';
import 'package:flutter_102_code/widgets/my_custom_tile.dart';
import 'package:fluttertoast/fluttertoast.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    print('createState Method Called');
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  var title='';
  var scroll=ScrollController();


  List<MyUserModel> myList=[];



  bool sort=false;
  double myScreenHeight=0.0;
  double myScreenWidth=0.0;





  @override
  void initState() {
    title='Home page';
    print('initState Method Called');

    myList.add(MyUserModel(userId: '110', userName: 'Samir', userImage: 'https://avatars.githubusercontent.com/u/36180689?v=4'));
    myList.add(MyUserModel(userId: '111', userName: 'Shahin', userImage: 'https://pbs.twimg.com/profile_images/1105546827154124801/T2GbY_Zh_400x400.jpg'));
    myList.add(MyUserModel(userId: '112', userName: 'Salman Khan',userImage: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg/220px-Salman_Khan_at_Renault_Star_Guild_Awards.jpg' ));


    super.initState();



  }

  @override
  Widget build(BuildContext context) {

    myScreenHeight=MediaQuery.of(context).size.height; ///Get.height
    myScreenWidth=MediaQuery.of(context).size.width;  ///Get.width




    print('Build Method Called');

    return Scaffold(
      appBar: AppBar(
        title: Text(title),

        actions: [

          IconButton(onPressed: (){
           setState(() {
             print('Size of List:${myList.length}');
             // myList.add('Samir');
             myList.add(MyUserModel(userId: '110', userName: 'Samir', userImage: 'https://avatars.githubusercontent.com/u/36180689?v=4'));
             print('Size of List:${myList.length}');
           });

          }, icon: const Icon(Icons.add)),
          IconButton(onPressed: (){
            setState(() {
              myList.clear();
            });

          }, icon: const Icon(Icons.delete)),
          IconButton(onPressed: (){
            setState(() {
              //sort!=sort;
              sort=!sort;

              // if(sort==false){
              //   sort=true;
              // }else{
              //   sort=false;
              // }
            });

          }, icon: const Icon(Icons.sort)),

        ],
      ),

      // body: _listViewBuilderOrDynamicListView(context),
      body: _myBody(context),
    );


  }



  _myBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: _activeUserList(),
          ),
          Container(
            height: 80,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),

            child: Center(child: Text("Height:$myScreenHeight\nWidth:$myScreenWidth")),

          ),
          gridView(),
          _listViewBuilderOrDynamicListView(context)

        ],
      ),
    );
  }

  gridView(){
    return GridView.builder(
       itemCount: myList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveHelper.isMobile(context)?2:ResponsiveHelper.isTab(context) ?3:5,
        ),
        itemBuilder: (c,i){
          return Container(
            // padding: EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  // color: Colors.green,
                  child: ClipOval(

                    child: CircleAvatar(
                      child:  Image.network(myList[i].userImage.toString()),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  // color: Colors.red,
                  child: Center(child: Text(myList[i].userName.toString())),
                )
              ],
            ),
          );
        },
    );
  }

  _activeUserList(){
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: myList.length,
        itemBuilder: (context, index){
          return Container(
            margin: const EdgeInsets.only(right: 5),
            // color: Colors.yellowAccent,
            height: 75,
            width: 75,
            child: ClipOval(

              child: CircleAvatar(
                child:  Image.network(myList[index].userImage.toString()),
              ),
            ),
          );
        },

    );
  }





  _listViewBuilderOrDynamicListView(BuildContext context) {

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: myList.length,
      itemBuilder: (context, index){
        return MyCustomTile(title: myList[index].userName??'', imageUrl:  myList[index].userImage, onClickEvent: (){

          setState(() {
            myList.removeAt(index);
          });

          print('Size of List:${myList.length}');

          Fluttertoast.showToast(msg: '${myList[index]} has been deleted');
        },
          subTitle: '30 min ago',
          trailing: '10',
          longPress: (){

            setState(() {
              // myList[index]='Shahin';
            });
            Fluttertoast.showToast(msg: '${myList[index]} Long pressed');
          },
        );
      },
      // reverse: sort,

    );

  }



  @override
  void dispose() {
    print('dispose Method Called');
    title='';
    scroll.removeListener(() { });
    super.dispose();
  }


}
