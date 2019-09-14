import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum LoadingState {none,loading}

class bookServer with ChangeNotifier{

  bookServer(){ getData();}

   LoadingState state = LoadingState.loading;
   List<Map<String,String>> dataList = [];
  _changeLoadingState(LoadingState NewState){
   state = NewState;
   notifyListeners();
   print("executed");
  }

   Future<List<Map<String,String>>> getData()async{
    _changeLoadingState(LoadingState.loading);
   List<Map<String,String>> list= [
    {
      'subName': 'Mathematics',
      'subCode': '0000000',
      'image': 'assets/download.jpg',
    },
    {
      'subName': 'Scince',
      'subCode': '1111111',
      'image': 'assets/download.jpg',
    },
    {
      'subName': 'Media',
      'subCode': '2222222',
      'image':'assets/bookcover.jpg'
    },
    {
      'subName': 'Politics',
      'subCode': '3333333',
      'image': 'assets/bookcover.jpg',
    },
    {
      'subName': 'Mobile Development',
      'subCode': '4444444',
      'image': 'assets/download.jpg',
    },
    {
      'subName': 'Web Development',
      'subCode': '5555555',
      'image': 'assets/bookcover.jpg',
    }
  ];
  
  await Future.delayed(Duration(seconds: 4));

    dataList=list;

   _changeLoadingState(LoadingState.none);

   return dataList;
 }
}