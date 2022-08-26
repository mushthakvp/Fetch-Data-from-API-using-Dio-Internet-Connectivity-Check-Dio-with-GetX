import 'package:demo_api/app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controller/post_controller.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  //final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Restful Api Dio'),
      ),
      body: GetBuilder<PostController>(
          init: PostController(),
          builder: (obj) {
            return obj.isLoading
                ? Center(
                    child: Lottie.asset(
                      'assets/loading.json',
                      width: 150,
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () {
                      return obj.getPosts();
                    },
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: obj.posts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            leading: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(color: MyColors.greyColor),
                              child: Center(
                                child: Text('${index + 1}'),
                              ),
                            ),
                            title: Text(
                              obj.posts[index].title,
                              style: const TextStyle(fontSize: 18),
                              maxLines: 2,
                            ),
                            subtitle: Text(
                              obj.posts[index].body,
                              style: const TextStyle(
                                letterSpacing: 1,
                              ),
                              maxLines: 4,
                            ),
                          ),
                        );
                      },
                    ),
                  );
          }),
    );
  }
}
