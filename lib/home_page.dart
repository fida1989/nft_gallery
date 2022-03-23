import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nft_gallery/collection_page.dart';
import 'package:opensea_dart/pojo/collection_object.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Collection> collections = [];

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("NFT Gallery"),
      ),
      body: collections.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.only(top: 10),
              itemCount: collections.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    onTap: () {
                      if (collections[index].slug != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CollectionPage(
                              collection: collections[index],
                            ),
                          ),
                        );
                      }
                    },
                    leading: SizedBox(
                      height: 75,
                      width: 75,
                      child: collections[index].imageUrl != null
                          ? Image.network(collections[index].imageUrl!)
                          : Image.asset("assets/nft.png"),
                    ),
                    trailing: const Icon(Icons.navigate_next),
                    subtitle: Text( "Created: " +
                        formatDate(collections[index].createdDate!)),
                    title: Text(collections[index].name!));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadData,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _loadData() {
    setState(() {
      collections = [];
    });
    openSea.getCollections().then((value) {
      setState(() {
        collections = value.collections!;
      });
    });
  }
}
