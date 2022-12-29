import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freemium_hub/styles/colors.dart';
import 'package:freemium_hub/widgets/widget_extensions.dart';

class NewWallPaperScreen extends StatefulWidget {
  final AsyncSnapshot<QuerySnapshot> snapshot;
  const NewWallPaperScreen({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  State<NewWallPaperScreen> createState() => _NewWallPaperScreenState();
}

class _NewWallPaperScreenState extends State<NewWallPaperScreen> {
  Future<void> getRefreshImage() async {
    var newData =
        await FirebaseFirestore.instance.collection('image_url').get();
    var refreshData = newData.docs;

    setState(() {
      refreshData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: getRefreshImage,
        child: SafeArea(
          child: GridView.builder(
            itemCount: widget.snapshot.data?.docs.length,
            itemBuilder: (BuildContext context, int index) {
              if (widget.snapshot.hasData) {
                return InkResponse(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl: widget.snapshot.data!.docs
                            .elementAt(index)['image_url'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: DarkThemeColors.selectedIconColor,
                  ),
                );
              }
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        ),
      ),
    );
  }
}
