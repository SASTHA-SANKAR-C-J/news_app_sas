import 'package:flutter/material.dart';
import 'package:news_app_sas/model/news_data_model.dart';

import '../../widgets/news_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
   bool load = false;
  void search(value) async {
      setState(() {
        load = true;
      });
      await fetchapidatasearch(searchquery: value);
      setState(() {
        load = false;
      });
    }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8775fc),
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: TextField(
              onChanged: (value) => search(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search here",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          load
              ? Expanded(child: Center(child: CircularProgressIndicator()))
              : Expanded(
                  child: ListView.builder(
                    itemCount: responseDataSearch?.articles?.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsScreen(
                                  response:
                                      responseDataSearch?.articles?[index]),
                            )),
                        child: Container(
                          height: 200,
                          width: width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage(responseDataSearch
                                          ?.articles?[index].urlToImage
                                          .toString() ??
                                      "https://media4.giphy.com/media/3oEjI6SIIHBdRxXI40/200w.gif?cid=6c09b952wv0yphvhi6m54h8bejydufv91sz2de5quondqyvm&ep=v1_gifs_search&rid=200w.gif&ct=g")),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              Expanded(
                                  child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        (responseDataSearch
                                                ?.articles?[index].title)
                                            .toString(),
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
