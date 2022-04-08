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

  var myList = [];
  bool sort = false;

  @override
  void initState() {
    title = 'Home Page';
    print('initState Method Called');
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
                  myList.add('Item');
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
          title: '${myList[index]}-${index+1}',
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
              myList[index] = 'Updated Item';
            });
            Fluttertoast.showToast(msg: '${myList[index]} Long pressed');
          },
        );
      },
      reverse: sort,
    );
  }

}
