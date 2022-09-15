import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test913/View/detail.dart';
import 'package:test913/repository/contents.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size size;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }
  /*//AppBar
  AppBar _homeAppBar(){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, size: 30, color: Colors.black,),
        onPressed: (){
          print("back");
        },
      ),
      centerTitle: true,
      title: Text("BI", style: TextStyle(color: Colors.black),),
      actions: [
        IconButton(onPressed: (){},
            icon: Icon(Icons.doorbell_outlined), color: Colors.black,),
        IconButton(onPressed: (){},
            icon: Icon(Icons.favorite_border_outlined), color: Colors.black),
        IconButton(onPressed: (){},
            icon: Icon(Icons.shopping_cart), color: Colors.black),
      ],
    );
  }*/
  //BodyWidget
  Widget _homeBody(){
    return SingleChildScrollView(
              child: Column(
                children: [
                  _tabBarView(),
                  _bannerView(),
                  _recommendView(),
                  _homeListView(),
                ],
        ),
    );
  }
  //TabBar

  Widget _tabBarView(){
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: CustomRadioButton(
          buttonTextStyle: ButtonTextStyle(
              selectedColor: Colors.white,
              unSelectedColor: Colors.black,
              textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          radioButtonValue: (value) {
            print(value);
          },
          autoWidth: true,
          padding: 10,
          elevation: 0,
          buttonLables: [
            "생화",
            "꽃다발",
            "바구니",
            "프리저브드",
            "다육이"
          ],
          buttonValues: [
            "FLESHFLOWER",
            "BOUQUET",
            "BASKET",
            "PRESERVED",
            "FLESHY"
          ],
          unSelectedColor: Colors.grey[300],
          selectedColor: Colors.black,
          customShape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        )
      ),
    );
  }

  //Banner
  Widget _bannerView(){
    return Container(
      width: double.infinity,
      color: Colors.black12,
      child: Text("PROMOTION BANNER", textAlign: TextAlign.center,),
      height: 150,
    );
  }

  //MDrecommend
  Widget _recommendView(){
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                child: Text("오다줌 추천상품", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("MD가 선정한 어쩌고 저쩌고...", style: TextStyle(fontSize: 18, color: Colors.grey),)),
            Container(
              height: 230,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context){
                                return Detail();
                              }));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/sample.png",
                                    width: 150,
                                    height: 150,
                                  ),
                                ],
                              ),
                              Text("상품명", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              Text("대충", style: TextStyle(fontSize: 13, color: Colors.grey),),
                              Text("상품설명", style: TextStyle(fontSize: 13, color: Colors.grey),),
                              Row(
                                children: [
                                  Text("원가 넣는곳", style: TextStyle(fontSize: 13),),
                                  Text("할인가 넣는곳", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 8,
                        color: Colors.white.withOpacity(0.6),
                      );
                    },
                  ),
                ),
          ],
        )
    );
  }

  //ListView
  int data = 0;
  String _currentSort;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = [isGrid, isList];
    _currentSort = "best";
  }

  final Map<String, String> sortType = {
    "best" : "인기상품순",
    "expansive" : "가격높은순",
    "cheep" : "가격낮은순",
    "comment" : "댓글많은순",
    "good" : "별점높은순",
  };

  //toggle fun
  List<bool> isSelected;
  bool isGrid = true;
  bool isList = false;

  void toggleSelect(value){
    if(value == 0){
      isGrid = true;
      isList = false;
    }else{
      isGrid = false;
      isList = true;
    }
    setState(() {
      isSelected = [isGrid, isList];
    });
  }

  Widget _homeListView() {
    return  Container(
            height: size.height,
            padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
            child:  Column(
            children: [
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("5 개"),
                    //SortCheck
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: PopupMenuButton<String>(
                              offset: Offset(0, 25),
                              shape: ShapeBorder.lerp(
                                  RoundedRectangleBorder(borderRadius: BorderRadius
                                      .circular(10.0)),
                                  RoundedRectangleBorder(borderRadius: BorderRadius
                                      .circular(10.0)), 1),
                              onSelected: (String sortT) {
                                print("click");
                                setState(() {
                                  _currentSort = sortT;
                                });
                              },
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem(value: "best", child: Text("인기상품순"),),
                                  PopupMenuItem(
                                    value: "expansive", child: Text("가격높은순"),),
                                  PopupMenuItem(
                                    value: "cheep", child: Text("가격낮은순"),),
                                  PopupMenuItem(
                                    value: "comment", child: Text("댓글많은순"),),
                                  PopupMenuItem(value: "good", child: Text("별점높은순"),),
                                ];
                              },
                              child: Row(
                                children: [
                                  Text(
                                    sortType[_currentSort],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ToggleButtons(
                            borderWidth: 0,
                            children: [
                            Padding(
                              padding: EdgeInsets.all(3),
                              child: Icon(Icons.grid_4x4, size: 20,),
                            ),
                            Padding(padding: EdgeInsets.all(3),
                              child: Icon(Icons.list, size: 20,),
                            ),
                          ]
                            , isSelected: isSelected,
                            onPressed: toggleSelect
                            ,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _toggleOption(),
            ],
      ),
    );
  }

  //toggleOption
  Widget _toggleOption() {
    if(isGrid){
      return Container(
        child: Expanded(
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 30,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10 ),
              itemBuilder: (BuildContext context, int index) {
                return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "assets/images/sample.png",
                          width: 200,
                          height: 200,
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text("상품명", style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),),
                    Text("대충",
                      style: TextStyle(fontSize: 13, color: Colors.grey),),
                    Text("상품설명",
                      style: TextStyle(fontSize: 13, color: Colors.grey),),
                    Row(
                      children: [
                        Text("원가 넣는곳", style: TextStyle(fontSize: 13),),
                        Text("할인가 넣는곳", style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),)
                      ],
                    )
                  ],
                );
              }
          ),
        ),
      );
    }else{
      return Container(
          child: Expanded(
            child: ListView.separated(
              physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext _context, int index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context){
                            return Detail();
                          }));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Image.asset(
                                "assets/images/sample.png",
                                width: 100,
                                height: 100,
                              ),
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text("상품명", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                Text("대충", style: TextStyle(fontSize: 13, color: Colors.grey),),
                                Text("상품설명", style: TextStyle(fontSize: 13, color: Colors.grey),),
                                Row(
                                  children: [
                                    Text("원가 넣는곳 →", style: TextStyle(fontSize: 13, color: Colors.grey),),
                                    Align (
                                        alignment: Alignment.centerRight,
                                        child: Text(" 할인가 넣는곳", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
                                  ],
                                )
                              ],
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 5,
                separatorBuilder: (BuildContext _context, int index) {
                  return Container(
                    width: 8,
                    color: Colors.white.withOpacity(0.6),
                  );
                },
              ),
            ),
      );
    }
  }

  //BottomNavi
  int _currentpageIndex = 0;
  BottomNavigationBar _bottomNavi() {
    return BottomNavigationBar(
      elevation: 6,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 10,
      currentIndex: _currentpageIndex,
      onTap: (int index) {
        setState(() {
          _currentpageIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "홈",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          label: "검색",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.commute_outlined),
          label: "커뮤니티",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.store_rounded),
            label: "스마트픽"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "마이오다줌"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              primary: true,
              floating: true,
              foregroundColor: Colors.white,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.black,
                  )),
              centerTitle: true,
              title: Text(
                "BI",
                style: TextStyle(color: Colors.black),
              ),
              expandedHeight: 40,
              actions: [
                IconButton(
                  icon: Icon(Icons.doorbell_outlined),
                  color: Colors.black,
                ),
                IconButton(
                    icon: Icon(Icons.favorite_border_outlined),
                    color: Colors.black),
                IconButton(icon: Icon(Icons.shopping_cart), color: Colors.black),
              ],
            )
          ];
        },
        body: _homeBody(),
      ),
      bottomNavigationBar: _bottomNavi()
    );
  }
}

class BottomBarVisibilityProvider extends ChangeNotifier {
  bool isVisible = true;

  void show() {
    if (!isVisible) {
      isVisible = true;
      notifyListeners();
    }
  }

  void hide() {
    if (isVisible) {
      isVisible = false;
      notifyListeners();
    }
  }
}
