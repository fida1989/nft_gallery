import 'package:flutter/material.dart';
import 'package:opensea_dart/pojo/collection_object.dart';

import 'main.dart';

class CollectionPage extends StatefulWidget {
  final Collection collection;

  const CollectionPage({Key? key, required this.collection}) : super(key: key);

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.collection.name!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Card(
                  child: widget.collection.largeImageUrl != null
                      ? Image.network(widget.collection.largeImageUrl!)
                      : Image.asset("assets/nft.png"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Created: " +
                        formatDate(widget.collection.createdDate!),
                    style: const TextStyle(fontSize: 17.5),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Description: " + (widget.collection.description ?? ""),
                    style: const TextStyle(fontSize: 17.5),
                  )),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Payout Address: " +
                        widget.collection.payoutAddress.toString(),
                    style: const TextStyle(fontSize: 17.5),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
