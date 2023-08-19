import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/NewsApi/controller/news_controller.dart';
import 'package:news_api/NewsApi/model/news_model.dart';
import 'package:news_api/Utils/api_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("NewsAPi"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.download,
                color: Colors.green.shade300,
              ))
        ],
      ),
      body: FutureBuilder(
        future: newsController.getdata(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            NewsModel? n1 = snapshot.data;
            return ListView.builder(
              itemCount: n1!.articles!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${n1!.articles![index].title}"),
                  // subtitle: ,
                  leading: CircleAvatar(
                    radius: 50,
                    backgroundImage:NetworkImage!= null?NetworkImage("${n1.articles![index].urlToImage}"):NetworkImage("https://t4.ftcdn.net/jpg/03/21/09/93/240_F_321099386_tVrhDASXZ9Z4xEOyBboypQeFnht5j1wS.jpg"),
                  ),
                  // trailing: ,
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
