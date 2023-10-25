import 'package:flutter/material.dart';
import 'package:news_app_sas/model/news_data_model.dart';
import 'package:news_app_sas/view/car_screen/car_screen.dart';
import 'package:news_app_sas/view/health_screen/health_screen.dart';
import 'package:news_app_sas/view/news_screen.dart';
import 'package:news_app_sas/view/search_screen/search_screen.dart';
import 'package:news_app_sas/view/sports_screen/sports_screen.dart';
import 'package:news_app_sas/view/technology_screen/technology_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool load = false;
  Future<void> loading() async {
    setState(() {
      load=true;
    });
    await fetchapidatabreaking();
    setState(() {
      load=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    dynamic width = MediaQuery.sizeOf(context).width;
    dynamic height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Newsy",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        // leading: Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: Container(
        //     decoration: BoxDecoration(
        //         color: Colors.blue[100],
        //         borderRadius: BorderRadius.circular(10)),
        //     child: Icon(
        //       Icons.horizontal_split_outlined,
        //       color: Colors.blue,
        //     ),
        //   ),
        // ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Icon(
        //       Icons.person_sharp,
        //       color: Colors.blue,
        //       size: 33,
        //     ),
        //   )
        // ],
      ),
      body: RefreshIndicator(
        onRefresh: () => loading(),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Breaking News",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),)),
                      child: Icon(Icons.search)),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                load ? SizedBox(height: height * 0.6,child: Center(child: CircularProgressIndicator())) : SizedBox(
                  height: height * 0.6,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: responseDataBreaking?.articles?.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsScreen(
                                  response:
                                      responseDataBreaking?.articles?[index]),
                            )),
                        child: Container(
                          width: width * 0.7,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: NetworkImage(responseDataBreaking
                                          ?.articles?[index].urlToImage
                                          .toString() ??
                                      "https://media4.giphy.com/media/3oEjI6SIIHBdRxXI40/200w.gif?cid=6c09b952wv0yphvhi6m54h8bejydufv91sz2de5quondqyvm&ep=v1_gifs_search&rid=200w.gif&ct=g")),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                              )),
                              Expanded(
                                  child: Container(
                                child: SizedBox(
                                  width: width * 0.7,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (responseDataBreaking
                                                  ?.articles?[index].title)
                                              .toString(),
                                          maxLines: 4,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          (responseDataBreaking
                                                  ?.articles?[index]
                                                  .description)
                                              .toString(),
                                          maxLines: 4,
                                          style: TextStyle(
                                              color: Colors.grey[200]),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          (responseDataBreaking
                                                  ?.articles?[index]
                                                  .publishedAt)
                                              .toString(),
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.grey[200]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.zero,
                                        bottom: Radius.circular(30)),
                                    color: Colors.black38),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Category',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SportsScreen(),
                      )),
                  child: Container(
                    height: 70,
                    width: width,
                    decoration: BoxDecoration(
                        color: Color(0xFF8775fc),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sports',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '100 article about this',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HealthScreen(),
                      )),
                  child: Container(
                    height: 70,
                    width: width,
                    decoration: BoxDecoration(
                        color: Color(0xFF8775fc),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Health',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '100 article about this',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TechnologyScreen(),
                      )),
                  child: Container(
                    height: 70,
                    width: width,
                    decoration: BoxDecoration(
                        color: Color(0xFF8775fc),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Technology',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '100 article about this',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarSCreen(),
                      )),
                  child: Container(
                    height: 70,
                    width: width,
                    decoration: BoxDecoration(
                        color: Color(0xFF8775fc),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cars',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '100 article about this',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
