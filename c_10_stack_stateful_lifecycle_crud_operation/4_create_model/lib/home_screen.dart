import 'package:class_10/models/my_user_model.dart';
import 'package:class_10/widgets/my_custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() {
    print('createState Method Called');
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  var title = '';
  var scroll = ScrollController();

  List <MyUserModel> myList = [

    // {
    //   'id': '111',
    //   'username':'User1',
    //   'image':'https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg?cs=srgb&dl=pexels-pixabay-60597.jpg&fm=jpg'
    // },
    // {
    //   'id': '112',
    //   'username':'User2',
    //   'image':'https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg?cs=srgb&dl=pexels-pixabay-60597.jpg&fm=jpg'
    // },
    // {
    //   'id': '113',
    //   'username':'User3',
    //   'image':'https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg?cs=srgb&dl=pexels-pixabay-60597.jpg&fm=jpg'
    // },
  ];
  bool sort = false;

  @override
  void initState() {
    title = 'Home Page';
    myList.add(MyUserModel(
      userId: '111',
      userName: 'Shahin',
      userImage: 'https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg?cs=srgb&dl=pexels-pixabay-60597.jpg&fm=jpg'
    ));
    myList.add(MyUserModel(
        userId: '112',
        userName: 'Kalam',
    ));
    myList.add(MyUserModel(
        userId: '113',
        userName: 'Abir',
        userImage: 'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__480.jpg'
    ));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Build Method Called');

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  print('Size of List: ${myList.length}');
                  // myList.add('Item');
                  myList.add(MyUserModel(
                      userId: '113',
                      userName: 'Abir',
                      userImage: 'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__480.jpg'
                  ));
                  Fluttertoast.showToast(msg: 'Item ${myList.length} added');
                  print('Size of List After Add: ${myList.length}');
                });
              },
              icon: Icon(Icons.add)
          ),
          IconButton(
              onPressed: (){
                setState(() {
                  myList.clear();
                  Fluttertoast.showToast(msg: 'All item deleted');

                });
              },
              icon: Icon(Icons.delete)
          ),
          IconButton(
              onPressed: (){
                setState(() {
                  print(sort);
                  sort =! sort;   /// bool type reverse
                  print(sort);
                  // if(sort == false) {
                  //   sort = true;
                  // } else {
                  //   sort = false;
                  // }

                });
              },
              icon: Icon(Icons.sort)
          ),
        ],
      ),
      body: _listViewBuilderOrDynamicListView(context),
    );
  }

  _listViewBuilderOrDynamicListView(BuildContext context) {
    return  ListView.builder(
      itemCount: myList.length,
      itemBuilder: (context, index) {
        return MyCustomTile(
          title: myList[index].userName ?? '',
          imageUrl: myList[index].userImage,
          onClickEvent: (){
            setState(() {
              myList.removeAt(index);
            });
            //Navigator.pop(context);
            Fluttertoast.showToast(msg: '${myList[index]} has been deleted');
          },
          subTitle: '30 min ago',
          trailing: '10',
          longPress: (){
            setState(() {
              // myList[index] = 'Updated Item';
            });
            Fluttertoast.showToast(msg: '${myList[index]} Long pressed');
          },
        );
      },
      reverse: sort,
    );
  }

}
