import '../model/game_model.dart';

class Repository {

  int index = 0;
  var list = <GameModel>[];

  int getIndex() {
    return index;
  }

  void load() {
    list.add(GameModel(image1: "assets/photos/animal1.jpg", image2: "assets/photos/animal2.jpg", image3: "assets/photos/animal3.jpg", image4: "assets/photos/animal4.jpg", str8: "ANIMAL", str16: "QILDNAMWIDLRMALM"));
    list.add(GameModel(image1: "assets/photos/apple1.jpg", image2: "assets/photos/apple2.jpg", image3: "assets/photos/apple3.jpg", image4: "assets/photos/apple4.jpg", str8: "APPLE", str16: "MYDLCGEPGADPZDPI"));
    list.add(GameModel(image1: "assets/photos/art1.jpg", image2: "assets/photos/art2.jpg", image3: "assets/photos/art3.jpg", image4: "assets/photos/art4.jpg", str8: "ART", str16: "QZTDRTIROPMACDET"));
    list.add(GameModel(image1: "assets/photos/bird1.jpg", image2: "assets/photos/bird2.jpg", image3: "assets/photos/bird3.jpg", image4: "assets/photos/bird4.jpg", str8: "BIRD", str16: "UECIWORAWBEMDACB"));
    list.add(GameModel(image1: "assets/photos/book1.jpg", image2: "assets/photos/book2.jpg", image3: "assets/photos/book3.jpg", image4: "assets/photos/book4.jpg", str8: "BOOK", str16: "QWEOZXKCVBOMLBPI"));
    list.add(GameModel(image1: "assets/photos/bread1.jpg", image2: "assets/photos/bread2.jpg", image3: "assets/photos/bread3.jpg", image4: "assets/photos/bread4.jpg", str8: "BREAD", str16: "PRSJBZELAQDWDMBI"));
    list.add(GameModel(image1: "assets/photos/build1.jpg", image2: "assets/photos/build2.jpg", image3: "assets/photos/build3.jpg", image4: "assets/photos/build4.jpg", str8: "BUILDING", str16: "FBOIENGHLAULDIAN"));
    list.add(GameModel(image1: "assets/photos/cap1.jpg", image2: "assets/photos/cap2.jpg", image3: "assets/photos/cap3.jpg", image4: "assets/photos/cap4.jpg", str8: "CAP", str16: "ZWAIRPDBCHDARPNA"));
    list.add(GameModel(image1: "assets/photos/car1.jpg", image2: "assets/photos/car2.jpg", image3: "assets/photos/car3.jpg", image4: "assets/photos/car4.jpg", str8: "CAR", str16: "EQWATBYRZMOPCDKJ"));
    list.add(GameModel(image1: "assets/photos/cherry1.jpg", image2: "assets/photos/cherry2.jpg", image3: "assets/photos/cherry3.jpg", image4: "assets/photos/cherry4.jpg", str8: "CHERRY", str16: "IURMIYOCARLOHWEP"));
    list.add(GameModel(image1: "assets/photos/color1.jpg", image2: "assets/photos/color2.jpg", image3: "assets/photos/color3.jpg", image4: "assets/photos/color4.jpg", str8: "COLOR", str16: "KECPROALROJDLHRC"));
    list.add(GameModel(image1: "assets/photos/cotton1.jpg", image2: "assets/photos/cotton2.jpg", image3: "assets/photos/cotton3.jpg", image4: "assets/photos/cotton4.jpg", str8: "COTTON", str16: "QUZONTMCWTACDIOX"));
    list.add(GameModel(image1: "assets/photos/cup1.jpg", image2: "assets/photos/cup2.jpg", image3: "assets/photos/cup3.jpg", image4: "assets/photos/cup4.jpg", str8: "CUP", str16: "ZUAIRPDBCHDARPNA"));
    list.add(GameModel(image1: "assets/photos/dog1.jpg", image2: "assets/photos/dog2.jpg", image3: "assets/photos/dog3.jpg", image4: "assets/photos/dog4.jpg", str8: "DOG", str16: "YFBQXDCTOUMGKFAH"));
    list.add(GameModel(image1: "assets/photos/game1.jpg", image2: "assets/photos/game2.jpg", image3: "assets/photos/game3.jpg", image4: "assets/photos/game4.jpg", str8: "GAME", str16: "TRMOBSGWILACZELF"));
    list.add(GameModel(image1: "assets/photos/garden1.jpg", image2: "assets/photos/garden2.jpg", image3: "assets/photos/garden3.jpg", image4: "assets/photos/garden4.jpg", str8: "GARDEN", str16: "TNDJESTGQWAMIRZN"));
    list.add(GameModel(image1: "assets/photos/hand1.jpg", image2: "assets/photos/hand2.jpg", image3: "assets/photos/hand3.jpg", image4: "assets/photos/hand4.jpg", str8: "HAND", str16: "QHVMSHAUIONXWDYI"));
    list.add(GameModel(image1: "assets/photos/light1.jpg", image2: "assets/photos/light2.jpg", image3: "assets/photos/light3.jpg", image4: "assets/photos/light4.jpg", str8: "LIGHT", str16: "JLSAGQWHZAIMTQTZ"));
    list.add(GameModel(image1: "assets/photos/lion1.jpg", image2: "assets/photos/lion2.jpg", image3: "assets/photos/lion3.jpg", image4: "assets/photos/lion4.jpg", str8: "LION", str16: "VOHAIDQWLZNSOFNQ"));
    list.add(GameModel(image1: "assets/photos/mountain1.jpg", image2: "assets/photos/mountain2.jpg", image3: "assets/photos/mountain3.jpg", image4: "assets/photos/mountain4.jpg", str8: "MOUNT", str16: "DMAIDAKODTZUQNEN"));
    list.add(GameModel(image1: "assets/photos/mouse1.jpg", image2: "assets/photos/mouse2.jpg", image3: "assets/photos/mouse3.jpg", image4: "assets/photos/mouse4.jpg", str8: "MOUSE", str16: "TOIEUZXEWOMKLSUE"));
    list.add(GameModel(image1: "assets/photos/music1.jpg", image2: "assets/photos/music2.png", image3: "assets/photos/music3.jpg", image4: "assets/photos/music4.jpg", str8: "MUSIC", str16: "QWMERUTYSUIIOPCZ"));
    list.add(GameModel(image1: "assets/photos/phone1.jpg", image2: "assets/photos/phone2.jpg", image3: "assets/photos/phone3.jpg", image4: "assets/photos/phone4.jpg", str8: "PHONE", str16: "UPOTHFEHNALQPOFI"));
    list.add(GameModel(image1: "assets/photos/road1.jpg", image2: "assets/photos/road2.jpg", image3: "assets/photos/road3.jpg", image4: "assets/photos/road4.jpg", str8: "ROAD", str16: "YOSWDMRZQOCBDTAU"));
    list.add(GameModel(image1: "assets/photos/sun1.jpg", image2: "assets/photos/sun2.jpg", image3: "assets/photos/sun3.jpg", image4: "assets/photos/sun4.jpg", str8: "SUN", str16: "WONFJEUVNWASLMNI"));
    list.add(GameModel(image1: "assets/photos/room1.jpg", image2: "assets/photos/room2.jpg", image3: "assets/photos/room3.jpg", image4: "assets/photos/room4.jpg", str8: "ROOM", str16: "QZRXEROTVBMRTYOU"));
    list.add(GameModel(image1: "assets/photos/sleep1.jpg", image2: "assets/photos/sleep2.jpg", image3: "assets/photos/sleep3.jpg", image4: "assets/photos/sleep4.jpg", str8: "SLEEP", str16: "QWSERLTYEUIEOPPZ"));
    list.add(GameModel(image1: "assets/photos/table1.jpg", image2: "assets/photos/table2.jpg", image3: "assets/photos/table3.jpg", image4: "assets/photos/table4.jpg", str8: "TABLE", str16: "GEYHTMWBAOPZLRVAOB"));
    list.add(GameModel(image1: "assets/photos/tree1.jpg", image2: "assets/photos/tree2.jpg", image3: "assets/photos/tree3.jpg", image4: "assets/photos/tree4.jpg", str8: "TREE", str16: "QWZEXCVRMOPEYVTM"));
    list.add(GameModel(image1: "assets/photos/water1.jpg", image2: "assets/photos/water2.jpg", image3: "assets/photos/water3.jpg", image4: "assets/photos/water4.jpg", str8: "WATER", str16: "QWZHTXBRMZVHAOEP"));
    list.shuffle();
  }

  GameModel getItem() {
    return list[index++];
  }

}