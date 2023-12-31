import 'package:flutter/material.dart';
import 'package:news_app_sas/controller/news_controller.dart';
import 'package:news_app_sas/widgets/news_screen.dart';
import 'package:news_app_sas/view/search_screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool load = false;
  final NewsController _newsController = NewsController();
  @override
  void initState() {
    getInitialData();
    setState(() {});
    super.initState();
  }

  void getInitialData() {
    setState(() {
      load = true;
    });
    _newsController.fetchapidatabbc(context);
    _newsController.fetchapidatasearch(context: context);
    setState(() {
      load = false;
    });
  }

  Future<void> loading() async {
    setState(() {
      load = true;
    });
    await _newsController.fetchapidatabbc(context);
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
        title: const Hero(
          tag: 'title',
          child: Text(
            "Newsy",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        backgroundColor: const Color(0xFF8775fc),
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
                  const Text(
                    "BBC News",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchScreen(),
                          )),
                      child: const Icon(Icons.search)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            (_newsController.responseDataBbc?.status == "error")
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text(
                                  'Oops!',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    loading();
                                  },
                                  child: Text("Retry"),
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0xFF8775fc))),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
                : load
                    ? const Expanded(
                        child: Center(child: CircularProgressIndicator()))
                    : Expanded(
                        child: ListView.builder(
                          itemCount:
                              _newsController.responseDataBbc?.articles?.length ?? 10,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsScreen(
                                        response: _newsController
                                            .responseDataBbc?.articles?[index]),
                                  )),
                              child: Container(
                                height: 200,
                                width: width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: NetworkImage(_newsController
                                                .responseDataBbc
                                                ?.articles?[index]
                                                .urlToImage
                                                .toString() ??
                                            "https://media4.giphy.com/media/3oEjI6SIIHBdRxXI40/200w.gif?cid=6c09b952wv0yphvhi6m54h8bejydufv91sz2de5quondqyvm&ep=v1_gifs_search&rid=200w.gif&ct=g")),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30)))),
                                    Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                (_newsController.responseDataBbc
                                                        ?.articles?[index].title)
                                                    .toString(),
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold),
                                              )
                                            ],
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
