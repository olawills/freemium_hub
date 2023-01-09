import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freemium_hub/styles/colors.dart';

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
    await Future.delayed(const Duration(milliseconds: 4000));
    FirebaseFirestore.instance.collection('wallpapers').get().then((snapshot) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: getRefreshImage,
        child: SafeArea(
            child: StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemCount: widget.snapshot.data?.docs.length,
          itemBuilder: (BuildContext context, int index) {
            if (widget.snapshot.hasData &&
                widget.snapshot.connectionState == ConnectionState.active) {
              return InkResponse(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: ExtendedImage.network(
                    widget.snapshot.data!.docs.elementAt(index)['image_url'],
                    cache: true,
                    printError: true,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
            // else if (widget.snapshot.connectionState ==
            //     ConnectionState.none) {
            //   return const Center(
            //     child: Text(
            //       'Check your network and try again later...',
            //     ),
            //   );
            // }
            else {
              return Center(
                child: CircularProgressIndicator(
                  color: DarkThemeColors.selectedIconColor,
                ),
              );
            }
          },
          staggeredTileBuilder: (int index) {
            return StaggeredTile.count(1, index.isEven ? 1.3 : 1.3);
          },
        )),
      ),
    );
  }
}
