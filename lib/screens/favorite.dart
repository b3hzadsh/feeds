import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Database.dart';
import 'package:flutter_app/utils/bloc.dart';
import 'package:flutter_app/utils/news_model.dart';
import 'package:flutter_app/widgets/news_widget.dart';
import 'dart:async';

class FavoritScreen extends StatefulWidget {
  @override
  _FavoritScreenState createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.9,
        backgroundColor: Color.fromRGBO(37, 68, 65, 1),
        title: Text("اخبار دلخواه"),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: "پاک کردن تمام اخبار برگزیده",
            icon: Icon(Icons.delete),
            onPressed: () async {
              await DBProvider.db.deleteAll();
              setState(() {});
            },
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: bloc.fstream,
          builder: (context, snapshot) => Container(
            color: Color.fromRGBO(37, 68, 65, 1),
            // padding: EdgeInsets.all(15),

            child: FutureBuilder<List<NewsModel>>(
              future: DBProvider.db.getAllClients(),
              builder: (context, AsyncSnapshot<List<NewsModel>> snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    /* NewsWidget(snapshot.data[index].); */
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          NewsWidget(
                            isChecked: true,
                            desc: snapshot.data[index].desc,
                            title: snapshot.data[index].title,
                            url: snapshot.data[index].url,
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    }
                    return Container();
                  },
                  padding: EdgeInsets.all(8),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
