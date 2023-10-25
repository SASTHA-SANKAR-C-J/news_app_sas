import 'package:flutter/material.dart';
import 'package:news_app_sas/model/news_data_model.dart';
import 'package:news_app_sas/view/news_screen.dart';

class CarSCreen extends StatefulWidget {
  const CarSCreen({super.key});

  @override
  State<CarSCreen> createState() => _CarSCreenState();
}

class _CarSCreenState extends State<CarSCreen> {
  @override
  Widget build(BuildContext context) {
    dynamic width = MediaQuery.sizeOf(context).width;
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
          'Cars',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => fetchapidatacar(),
        child: ListView.builder(
          itemCount: responseDataCar?.articles?.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NewsScreen(response: responseDataCar?.articles?[index]),
                  )),
              child: Container(
                height: 200,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(responseDataCar
                                ?.articles?[index].urlToImage
                                .toString() ??
                            "https://media4.giphy.com/media/3oEjI6SIIHBdRxXI40/200w.gif?cid=6c09b952wv0yphvhi6m54h8bejydufv91sz2de5quondqyvm&ep=v1_gifs_search&rid=200w.gif&ct=g")),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)))),
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
                              (responseDataCar?.articles?[index].title)
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
    );
  }
}
