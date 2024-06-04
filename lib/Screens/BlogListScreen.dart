import 'package:blog_stream/Screens/BlogPostTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'BlogDetailScreen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
class BlogListScreen extends StatefulWidget {
  @override
  _BlogListScreenState createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink;

    final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;
    if (deepLink != null) {
      final postId = deepLink.queryParameters['postId'];
      if (postId != null) {
        final postDoc = await FirebaseFirestore.instance.collection('blogPosts').doc(postId).get();
        if (postDoc.exists) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlogDetailScreen(blogPost: postDoc),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A3A3A).withOpacity(.5),
      appBar: AppBar(
        title: Text('Blog Posts'),
        backgroundColor: Color(0xFF3A3A3A),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('blogPosts').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var blogPost = snapshot.data!.docs[index];
              return BlogPostTile(blogPost: blogPost);
            },
          );
        },
      ),
    );
  }
}
