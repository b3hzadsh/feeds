import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Database.dart';
import 'package:flutter_app/utils/news_model.dart';
import 'package:flutter_app/widgets/news_widget.dart';

class FavoritScreen extends StatefulWidget {
  @override
  _FavoritScreenState createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اخبار دلخواه"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
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
                    return NewsWidget(
                      isChecked: true,
                      desc: snapshot.data[index].desc,
                      title: snapshot.data[index].title,
                      url: snapshot.data[index].url,
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
    );
  }
}
