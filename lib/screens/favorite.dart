import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Database.dart';
import 'package:flutter_app/utils/bloc.dart';
import 'package:flutter_app/utils/news_model.dart';
import 'dart:async';
import 'package:flutter_app/widgets/favarite_widget.dart';

class FavoritScreen extends StatefulWidget {
  @override
  _FavoritScreenState createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text(
          "اخبار دلخواه",
          style: TextStyle(fontFamily: "D"),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: "پاک کردن تمام اخبار برگزیده",
            icon: Icon(Icons.delete),
            onPressed: () async {
              try {
                await DBProvider.db.deleteAll();
                // setState(() {});
                bloc.fchange(1);
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
      body: Container(
        child: SafeArea(
          child: StreamBuilder<Object>(
              stream: bloc.fstream,
              builder: (context, _) {
                return FutureBuilder<List<NewsModel>>(
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
                              FavoriteWidget(
                                isChecked: true,
                                desc: snapshot.data[index].desc,
                                title: snapshot.data[index].title,
                                url: snapshot.data[index].url,
                              ),
                            ],
                          );
                        }
                        return Container();
                      },
                      padding: EdgeInsets.only(top: 8),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
