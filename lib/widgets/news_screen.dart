import 'package:flutter/material.dart';
import 'package:news_app_sas/model/news_data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({required this.response});
  final Article? response;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic width = MediaQuery.sizeOf(context).width;
    dynamic height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(widget.response?.urlToImage
                              .toString() ??
                          "https://www.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373244122.jpg")),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.zero, bottom: Radius.circular(30))),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 20,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
                  Expanded(child: Container()),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.zero, bottom: Radius.circular(30))),
                    child: SizedBox(
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              (widget.response?.author).toString(),
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[200]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              (widget.response?.title).toString(),
                              maxLines: 4,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text((widget.response?.description).toString(),style: TextStyle(fontSize: 16,),),
                  SizedBox(height: 10,),
                  Text((widget.response?.content).toString(),style: TextStyle(fontSize: 16,),),
                  SizedBox(height: 15,),
                  InkWell(
                    onTap: () => launchUrl(Uri.parse((widget.response?.url).toString())),
                    child: Container(height: 40,width: 120,child: Center(child: Text("Read More",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
