
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
  List<Map> Holi = [
    {"image":"assets/images/holi1.jpg"},
    {"image":"assets/images/holi2.jpg"},
    {"image":"assets/images/holi3.jpg"},
    {"image":"assets/images/holi4.jpg"},

  ];

  List<MaptoModel> festivaldetail = [];
  List<Map> l1 = [
    {
      'wishes': "The colors of your life may never fade, Happy Holi",

    },
    {
      'wishes':
      "May every color of Holi bring happiness and love into your life",

    },
    {
      'wishes':
      "Holi is a time to forget and forgive and make a new beginning with happiness and love",

    },
    {
      'wishes': "The colors of your life may never fade, Happy Holi",

    },
    {
      'wishes':
      "May every color of Holi bring happiness and love into your life",

    },
    {
      'wishes':
      "Holi is a time to forget and forgive and make a new beginning with happiness and love",

    },
    {
      'wishes': "The colors of your life may never fade, Happy Holi",

    },
    {
      'wishes':
      "May every color of Holi bring happiness and love into your life",

    },
    {
      'wishes':
      "Holi is a time to forget and forgive and make a new beginning with happiness and love",

    },
    {
      'wishes': "The colors of your life may never fade, Happy Holi",

    },
    {
      'wishes':
      "May every color of Holi bring happiness and love into your life",

    },
    {
      'wishes':
      "Holi is a time to forget and forgive and make a new beginning with happiness and love",

    },

  ];


  void create() {
    festivaldetail = l1.map((e) => MaptoModel.festival(e)).toList();
  }



}
