class Contents{
  Map<String, dynamic> data = {
    "꽃" : [
      {
        "cid" : "1",
        "image": "assets/images/sample.png",
        "title": "샘플1",
        "seller": "울산 남구",
        "price": "10000",
        "likes": "2",
      },
    ],
    "나무" : [
      {
        "cid" : "2",
        "image": "assets/images/sample.png",
        "title": "샘플2",
        "seller": "양산 물금읍",
        "price": "12000",
        "likes": "3",
      },
    ],
    "드라이플라워" : [
      {
        "cid" : "3",
        "image": "assets/images/sample.png",
        "title": "샘플3",
        "seller": "부산 사상구",
        "price": "18000",
        "likes": "4",
      },
    ],
    "조화" : [
      {
        "cid" : "4",
        "image": "assets/images/sample.png",
        "title": "샘플4",
        "seller": "대구 수성구",
        "price": "20000",
        "likes": "5",
      },
    ],
    "야호": [
      {
        "cid" : "5",
        "image": "assets/images/sample.png",
        "title": "샘플5",
        "seller": "서울 강남",
        "price": "30000",
        "likes": "6",
      },
    ]
  };

  Future<List<Map<String,String>>> loadContentsFromLocation(String flowertype) async{
    await Future.delayed(Duration(milliseconds: 500));
    return data[flowertype];
  }
}