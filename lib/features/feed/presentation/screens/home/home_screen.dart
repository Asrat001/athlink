
import 'package:athlink/shared/extensions/media_query_extension.dart';
import 'package:athlink/shared/widgets/logo_label.dart';
import 'package:flutter/material.dart';
import '../../../../../shared/constant/constants.dart';
import '../widgets/category_card.dart';
import '../widgets/feed_carousel.dart';
import '../widgets/podcast_card.dart';
import '../widgets/text_label.dart';

class FeedScreen extends StatelessWidget {

  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:LogoLabel(size: 20,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.white,))
          ,IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border_outlined,color: Colors.white,))
        ],
        bottom:PreferredSize(
            preferredSize: Size(double.infinity, 100),
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FeedCarousel(),
            ),
        ),
      ),
      body:LayoutBuilder(
          builder: (context, constraints){
            return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                spacing: 6,
               children: [
                 SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                   child: TextLabel(label: "Categories",noSeeMore: false,onSeeMore:(){

                   } ,),
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.width * 0.35,
                   child: ListView.separated(
                     scrollDirection: Axis.horizontal,
                     padding: const EdgeInsets.symmetric(horizontal: 16),
                     itemCount: categories.length,
                     separatorBuilder: (_, __) => const SizedBox(width: 16),
                     itemBuilder: (context, index) {
                       final category = categories[index];
                       return  CategoryCard(
                         imageUrl:category.imageUrl,
                         label: category.name

                       );
                     },
                   ),
                 )
                 ,
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                   child: TextLabel(label: "Podcasts",noSeeMore:false,onSeeMore:(){

                   } ,),
                 ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.65,
                      child: ListView.separated(
                         itemCount: podcasts.length,
                         scrollDirection: Axis.horizontal,
                         padding: const EdgeInsets.only(left: 16),
                         itemBuilder: (context,index) {
                           final podcast=podcasts[index];
                           return PodcastCard(
                               imageUrl: podcast.imageUrl,
                               title: podcast.title,
                               host: podcast.host,
                               duration: podcast.duration,
                               onPlay: (){

                               }
                           );
                         },
                       separatorBuilder: (context,index)=>const SizedBox(width: 16,),
                     ),
                   ),

                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16),
                   child: TextLabel(label: "Trending For You",onSeeMore:(){} ,),
                 ),
                 SizedBox(
                   height:context.screenWidth * 0.65,
                   child: ListView.separated(
                     itemCount: podcasts.length,
                     scrollDirection: Axis.horizontal,
                     padding: EdgeInsets.only(left: 16),
                     itemBuilder: (context,index) {

                       final podcast=podcasts[index];
                       return PodcastCard(
                           imageUrl: podcast.imageUrl,
                           title: podcast.title,
                           host: podcast.host,
                           duration: podcast.duration,
                           onPlay: (){

                           }
                       );
                     },
                     separatorBuilder: (context,index)=>const SizedBox(width: 16,),

                   ),
                 )

               ],
              )
            );
          }
      )
    );
  }
}
