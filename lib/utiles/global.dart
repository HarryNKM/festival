
import '../modal/modal.dart';

Global g1 = Global();



class Global {

  String? name;
  String? phone;
  String? email;
  String? img;


  List<Map> Fname = [
    {"festival":'Holi',"image":"assets/images/holi.jpg"},
    {"festival":'Ganesh Chaturthi',"image":"assets/images/ganesh.jpg"},
    {"festival":'Uttrayan',"image":"assets/images/utrayan.jpg"},
    {"festival":'Diwali',"image":"assets/images/divali.jpg"},
    {"festival":'Republic Day',"image":"assets/images/republicday.jpg"},

  ];
  List<Map> allimg  =[];
  List<Map> Holi = [
    {"wishes":"Wishing you and your family a very colorful and happy Holi"},
    {"wishes":"May your life be as bright and colorful as Holi! ..."},
    {"wishes":"Wishing you a Holi filled with laughter and happiness! ..."},
    {"wishes":"May your Holi be as bright as the colors in the sky!"},
  ];
  List<Map> Diwali = [
    {"wishes":"Wishing you a very happy and prosperous Diwali! "},
    {"wishes":"May the festival of Diwali bring you new beginnings, new hopes, and new dreams"},
    {"wishes":"May the light of Diwali guide you on your path to success and happiness"},
    {"wishes":"On this auspicious occasion of Diwali, I wish you good health, wealth, and prosperity"},
  ];
  List<Map> Utrayan = [
    {"wishes":"May this harvest festival help you reap a lot of success and happiness in your life. Happy Makar Sankranti!"},
    {"wishes":"On this special day dedicated to Sun, I hope you are blessed "},
    {"wishes":"Wishing you a very happy Makar Sankranti, from our family to yours"},
    {"wishes":"Have a beautiful Pongal and Uttarayan"},
  ];
  List<Map> Ganesh = [
    {"wishes":"May Lord Ganesha bless you with happiness, prosperity, and success on this auspicious day"},
    {"wishes":"Wishing you a wonderful Ganesh Chaturthi filled with love, laughter, and endless blessings from Lord Ganesha"},
    {"wishes":"May the divine blessings of Lord Ganesha fill your life with joy and prosperity"},
    {"wishes":"Happy Ganesh Chaturthi"},
  ];
  List<Map> Republic = [
    {"wishes":"Happy Republic day"},
    {"wishes":"May the vibrant hues of the tricolor illuminate the path to a brighter, more inclusive India"},
    {"wishes":"Happy Republic Day! Let the echoes of freedom resonate through every corner of our nation"},
    {"wishes":"inspiring every citizen to contribute to its progress"},
  ];

  List<String> holimage = [
    "assets/bgimages/holi1.jpg",
    "assets/bgimages/holi2.jpg",
    "assets/bgimages/holi3.jpg",
    "assets/bgimages/holi4.jpg",
  ];
  List<String> Diwalimage = [
    "assets/bgimages/diwali1.jpg",
    "assets/bgimages/diwali2.jpg",
    "assets/bgimages/diwali3.jpg",
    "assets/bgimages/diwali4.jpg",
  ];
  List<String> Ganeshimage = [
    "assets/bgimages/ganesh1.jpg",
    "assets/bgimages/ganesh2.jpg",
    "assets/bgimages/ganesh3.jpg",
    "assets/bgimages/ganesh4.jpg",
  ];
  List<String> Republicimage = [
    "assets/bgimages/r1.jpg",
    "assets/bgimages/r2.jpg",
    "assets/bgimages/r3.jpg",
    "assets/bgimages/r4.jpg",
  ];
  List<String> Utrayanimage = [
    "assets/bgimages/utrayan1.jpg",
    "assets/bgimages/utrayan2.jpg",
    "assets/bgimages/utrayan3.jpg",
    "assets/bgimages/utryan3.jpg",
  ];



  List<MaptoModel> festivaldetail = [];


  void create() {
    festivaldetail = Fname.map((e) => MaptoModel.festival(e)).toList();
  }



}
