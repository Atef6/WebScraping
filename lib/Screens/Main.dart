import 'package:flutter/material.dart';
import 'package:web_scraping/Services/Scraping.dart';
import 'package:web_scraping/Services/Services.dart';
import 'package:web_scraping/model/model.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  bool loading = true;
  List<Models> list = [];

  @override
  void initState() {
    super.initState();
    getPackages(); // Load data when the widget initializes
  }

  Future<void> getPackages() async {
    setState(() {
      loading = true; // Set loading to true while fetching data
    });

    list.clear();
    final html = await Services.getBost();
    if (html != null) {
      list = Scraping.run(html);
    }

    setState(() {
      loading = false; // Set loading to false after data retrieval
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (loading)
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 2,
              ),
            )
          : (list.isEmpty)
              ? Center(
                  child: Text('No data available'),
                )
              : ListView.separated(
                  itemCount: list.length,
                  separatorBuilder: ((context, index) {
                    return Divider(
                      indent: 8,
                      endIndent: 8,
                    );
                  }),
                  itemBuilder: ((context, index) {
                    return ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              list[index].title,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.green),
                            ),
                          ),
                          Text('likes ${list[index].likes}'),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(list[index].discraption),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            list[index].version,
                            style: TextStyle(color: Colors.amberAccent),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Wrap(
                            spacing: 4,
                            children: list[index]
                                .tags
                                .map((e) => OutlinedButton(
                                      onPressed: () {},
                                      child: Text(e),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                      isThreeLine: false,
                    );
                  }),
                ),
      
    );
  }
}
