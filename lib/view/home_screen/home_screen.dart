import 'package:flutter/material.dart';
import 'package:news_app_sas/model/news_data_model.dart';
import 'package:news_app_sas/widgets/news_screen.dart';
import 'package:news_app_sas/view/search_screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool load = false;
  Future<void> loading() async {
    setState(() {
      load = true;
    });
    await fetchapidatabbc();
    setState(() {
      load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Hero(
          tag: 'title',
          child: Text(
            "Newsy",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        backgroundColor: Color(0xFF8775fc),
        centerTitle: true,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () => loading(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "BBC News",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                          )),
                      child: Icon(Icons.search)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            (responseDataBbc?.status == "error")
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        height: 120,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: Text(
                                    'Oops!',
                                    style: TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                  child: ElevatedButton(onPressed: (){
                                    loading();
                                  }, child: Text("Retry"),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xFF8775fc))),),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
                : load
                    ? Expanded(
                        child: Center(child: CircularProgressIndicator()))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: responseDataBbc?.articles?.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsScreen(
                                        response:
                                            responseDataBbc?.articles?[index]),
                                  )),
                              child: Container(
                                height: 200,
                                width: width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: NetworkImage(responseDataBbc
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
                                                    BorderRadius.circular(
                                                        20)))),
                                    Expanded(
                                        child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              (responseDataBbc
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
      ),
    );
  }
}
