import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Detail extends StatefulWidget {
  Detail({Key key}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Size size;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }
  int _current;
  //body
  Widget _detailView(){
    return Container(
        height: size.height,
        child: SingleChildScrollView(
              child: Column(
                children: [
                  _makeSliderIMG(),
                  _sellerInfo(),
                  _productInfo(),
                  _selectMove(),
                  _detailInfo(),
                  _reviewInfo(),
                  _qnaInfo(),
                  _exchangeInfo(),
                  _recommendView(),
                  Container(
                    height: 50,
                    width: size.width,
                    color: Colors.black,
                    child: Text("FOOTER",style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
        ),
    );
  }
  //판매자 정보
  Widget _sellerInfo(){
    return Container(
      width: size.width,
      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("판매자명 〉"),
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: TextButton(onPressed: (){}, child: Text("스마트픽"))),
            ],
          ),
          Text("상품명 상품명 상품명 상품명", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          Container(
              padding: EdgeInsets.only(top: 10),
              child: Text("상품정보 상품정보 간단한정보")),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(Icons.star, color: Colors.yellowAccent[700], size: 30,),
              Icon(Icons.star, color: Colors.yellowAccent[700],size: 30),
              Icon(Icons.star, color: Colors.yellowAccent[700],size: 30),
              Icon(Icons.star, color: Colors.grey,size: 30),
              Icon(Icons.star, color: Colors.grey,size: 30),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("3.0" ,style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text("(좋아요)", style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold)),
            ],),

          Container(
            padding: EdgeInsets.only(top:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("원가넣는곳"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("할인%", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blueAccent),),
                        Text(" 할인가", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),)
                      ],
                    ),
                    TextButton(onPressed: (){}, child: Text("할인쿠폰보기"))
                 ],
                ),
              ],
            ),
          ),
          Divider(endIndent: 20,),
        ],
      ) ,
    );
  }
  //상품정보
  Widget _productInfo(){
    return Container(
      padding: EdgeInsets.fromLTRB(10,10,0,0),
      child: Column(
        children: [
             Container(
               padding: EdgeInsets.fromLTRB(20,10,0,0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("적립금"),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 100)),
                      Text("1,750",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(" 원")
                    ],
                  ),
                ],
              ),
             ),
          Container(
            padding: EdgeInsets.fromLTRB(20,10,0,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("배송비"),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 100)),
                    Text("2,500",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(" 원")
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20,10,0,20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("배송방법"),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 85)),
                    Text("오토바이\n스마트픽(스마트픽가능업소만)",),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20,10,0,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("원산지"),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 100)),
                    Text("대한민국",style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),
          //위까지 상품 정보
          Container(
            padding: EdgeInsets.fromLTRB(0,30,0,30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomCheckBoxGroup(
                  buttonTextStyle: ButtonTextStyle(
                    selectedColor: Colors.white,
                    unSelectedColor: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  unSelectedColor: Colors.grey[300],
                  buttonLables: [
                    "#tag1",
                    "#tag2",
                    "#tag3",
                    "#tag4",
                    "#tag5",
                    "#tag6",
                    "#tag7",
                  ],
                  buttonValuesList: [
                    "#tag1",
                    "#tag2",
                    "#tag3",
                    "#tag4",
                    "#tag5",
                    "#tag6",
                    "#tag7",
                  ],
                  checkBoxButtonValues: (values) {
                    print(values);
                  },
                  selectedColor: Colors.black,
                  padding: 10,
                )
              ),
            ),
        ],
      ),
    );
  }
  //슬라이드 생성
  Widget _makeSliderIMG(){
    return Stack(
      children: [
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
                height: size.width,
                initialPage: 0,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged: (index, reason){
                }
            ),
            items: List.generate(5, (index) {
              return Image.asset(
                "assets/images/sample.png",
                width: size.width,
                fit: BoxFit.fill, );}
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.4),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
  //선택이동창
  final GlobalKey detailKey = GlobalKey(); // 키 생성
  final GlobalKey reviewKey = GlobalKey(); // 키 생성
  final GlobalKey qnaKey = GlobalKey(); // 키 생성
  final GlobalKey exchangeKey = GlobalKey();

  void route(String page){
      switch(page){
        case "detailKey" : Scrollable.ensureVisible( detailKey.currentContext, duration: Duration(milliseconds: 600),curve: Curves.linear); break;
        case "reviewKey" : Scrollable.ensureVisible( reviewKey.currentContext, duration: Duration(milliseconds: 600),curve: Curves.linear); break;
        case "qnaKey" : Scrollable.ensureVisible( qnaKey.currentContext, duration: Duration(milliseconds: 600),curve: Curves.linear); break;
        case "exchangeKey" : Scrollable.ensureVisible( exchangeKey.currentContext, duration: Duration(milliseconds: 600), curve: Curves.linear); break;
      }
  }

  Widget _selectMove(){
    return Container(
      height: 100,
      padding: EdgeInsets.only(bottom: 30),
        child: CustomRadioButton(
          width: size.width/4,
          buttonTextStyle: ButtonTextStyle(
              selectedColor: Colors.black,
              unSelectedColor: Colors.black,
              textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          radioButtonValue: (value) {
            route(value);
          },
          autoWidth: false,
          absoluteZeroSpacing: true,
          padding: 10,
          elevation: 0,
          buttonLables: [
            "상새정보",
            "후기",
            "상품문의",
            "교환/반품",
          ],
          buttonValues: [
            "detailKey",
            "reviewKey",
            "qnaKey",
            "exchangeKey",
          ],
          selectedBorderColor: Colors.blueAccent,
          unSelectedColor: Colors.white.withOpacity(1.0),
          defaultSelected: "detailKey",
        )
    );
  }
  //상세정보
  Widget _detailInfo(){
    return Container(
      key: detailKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
            child: Text("상세정보", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Container(
            height: 100,
            width: size.width,
            color: Colors.grey,
            padding: EdgeInsets.all(30),
            child: Text("EditProgram"),
          )
        ],
      ),
    );
  }
  //후기
  Widget _reviewInfo(){
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
            child: Row(
              children: [
                Text("후기", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("(0)", style: TextStyle(fontSize: 15, color: Colors.grey),)
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Divider(thickness: 1.5,color: Colors.grey, endIndent: 20,)),
        Container(
          key: reviewKey,
          padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
          height: 100,
          width: size.width,
          child: Text("첫 리뷰를 작성해보세요\n적립금 3000원을 드립니다"),
        )
        ],
      ),
    );
  }
  //상품문의
  Widget _qnaInfo(){
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
            child: Row(
              children: [
                Text("상품문의", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("(0)", style: TextStyle(fontSize: 15, color: Colors.grey),)
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Divider(thickness: 1.5,color: Colors.grey, endIndent: 20,)),
          Container(
            key: qnaKey,
            padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
            height: 100,
            width: size.width,
            child: Text("이 상품에 궁금한점을 적어보세요\n친절히 답변드리겠습니다."),
          )
        ],
      ),
    );
  }
  //교환/반품
  Widget _exchangeInfo(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Text("교환/반품", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Container(
            key: exchangeKey,
            margin: EdgeInsets.all(10),
            height: 100,
            color: Colors.grey,
            width: size.width,
            child: Text("내용"),
          )
        ],
      ),
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

  //appbar
  AppBar _detailAppBar(){
    return AppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("BI",style: TextStyle(color: Colors.black),),
      centerTitle: true,
      actions: [
        IconButton(onPressed: (){},
          icon: Icon(Icons.doorbell_outlined), color: Colors.black,),
        IconButton(onPressed: (){},
            icon: Icon(Icons.favorite_border_outlined), color: Colors.black),
        IconButton(onPressed: (){},
            icon: Icon(Icons.shopping_cart), color: Colors.black),
      ],
    );
  }
  //바텀고정버튼
  Widget _bottomWidget(){
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), //모서리를 둥글게
          border: Border.all(color: Colors.black, width: 3),
          color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[600],
            offset: Offset(1.0, 2.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ), //테두리
      height: 55,
     width: size.width*8/10,
     child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Container(
               child: Row(
             children: [
               TextButton(onPressed: (){}, child: Icon(Icons.favorite_border, color: Colors.white,)),
               TextButton(onPressed: (){}, child: Icon(Icons.share, color: Colors.white,))
             ],
           )),
           Text("|", style: TextStyle(color: Colors.white, fontSize: 15)),
           Container(child: TextButton(onPressed: (){}, child: Text("구매하기", style: TextStyle(color: Colors.white, fontSize: 15),)))
         ],
       ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      extendBodyBehindAppBar: true,
      appBar: _detailAppBar(),
      body: Container(
        height: double.maxFinite,
        child: Stack(
          children:[
            _detailView(),
            Positioned(
              bottom: 20,
              left:  size.width/10,
                child: _bottomWidget()
            )
          ],
        ),
      ),

    );
  }
}
