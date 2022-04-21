
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/home_screen_controller.dart';


class HomeScreen extends StatelessWidget {
  static const routeName='/home_screen';

  // final HomeScreenController _controller=HomeScreenController();

  final HomeScreenController _controller=Get.put(HomeScreenController());

 // final HomeScreenController _controller2=Get.find<HomeScreenController>();


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Obx(()=>_controller.isLoading.value == false?_customScrollView(context):_shimmerEffect(context)),

    );
  }

  _customScrollView(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          floating: true,
          title: Text('Eshop'),
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.add_shopping_cart)
            )
          ],
        ),

        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            height: 200,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            height: 30,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Categories', style: TextStyle(fontSize: 18),),
                Text('View All', style: TextStyle(fontSize: 14),),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(5),
            height: 120,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (c,i) => Container(
                margin: EdgeInsets.all(5),
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(child: Text('$i')),
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            height: 30,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('New Arrival', style: TextStyle(fontSize: 18),),
                Visibility(
                    visible: false,
                    child: Text('View All', style: TextStyle(fontSize: 14),)),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(5),
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (c,i) => Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(child: Text('$i')),
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            height: 30,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Popular Products', style: TextStyle(fontSize: 18),),
                Visibility(
                    visible: false,
                    child: Text('View All', style: TextStyle(fontSize: 14),)),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                //scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (c,i) => Container(
                  margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                  height: 200,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(child: Text('$i')),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 5,
          ),
        )
      ],
    );
  }

  _shimmerEffect(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          floating: true,
          title: Text('Eshop'),
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.add_shopping_cart)
            )
          ],
        ),

        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            height: 200,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              height: 30,
              margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
              padding: EdgeInsets.only(left: 5, right: 5),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const [
              //     Text('Categories', style: TextStyle(fontSize: 18),),
              //     Text('View All', style: TextStyle(fontSize: 14),),
              //   ],
              // ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(5),
            height: 120,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (c,i) => Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  // child: Center(child: Text('$i')),
                ),
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              height: 30,
              margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
              padding: EdgeInsets.only(left: 5, right: 5),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const [
              //     Text('New Arrival', style: TextStyle(fontSize: 18),),
              //     Visibility(
              //         visible: false,
              //         child: Text('View All', style: TextStyle(fontSize: 14),)),
              //   ],
              // ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(5),
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (c,i) => Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  // child: Center(child: Text('$i')),
                ),
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              height: 30,
              margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
              padding: EdgeInsets.only(left: 5, right: 5),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const [
              //     Text('Popular Products', style: TextStyle(fontSize: 18),),
              //     Visibility(
              //         visible: false,
              //         child: Text('View All', style: TextStyle(fontSize: 14),)),
              //   ],
              // ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                //scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (c,i) => Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                    height: 200,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    // child: Center(child: Text('$i')),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 5,
          ),
        )
      ],
    );
  }
}

