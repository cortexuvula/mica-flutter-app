import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/video_page.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({super.key});

  @override
  ResourcePageState createState() => ResourcePageState();
}

class ResourcePageState extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Video Resource",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: app_data.videos.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  NavigationHelper.navigateTo(
                      context,
                      VideoPage(
                        videoTitle: app_data.videos[index]["title"] ?? "",
                        videoURL: app_data.videos[index]["video"] ?? "",
                      ));
                },
                title: Text(app_data.videos[index]["title"] ?? ""),
              ),
            );
          }),
    );
  }
}
