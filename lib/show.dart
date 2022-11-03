import 'package:flutter/material.dart';

import 'package:tabeiku/sql_helper.dart';
import 'package:tabeiku/main.dart';
import 'package:url_launcher/link.dart';
class ShowPage extends StatelessWidget{
  ShowPage(this.journal);
  final Map<String, dynamic> journal;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('詳細ページ',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: Colors.orange),
      ),
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 24,),

                Text(journal['name'],textAlign:TextAlign.center,style: TextStyle(color:Colors.white,fontSize: 40,fontWeight: FontWeight.w900),),
                SizedBox(height: 24,),
                Center(
                  child:Container(

                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child:ListView(

                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 80,
                          ),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('住所',style: TextStyle(fontSize: 12,color: Colors.orange,decoration: TextDecoration.underline),),
                              SizedBox(height: 4,),
                              Row(
                                children: [
                                  SizedBox(width: 8,),
                                  Flexible(child: Text(journal['address'],),),
                                ],
                              ),
                            ],
                          ),
                        ),



                        SizedBox(height: 16,),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 80,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('メモ',style: TextStyle(fontSize: 12,color: Colors.orange,decoration: TextDecoration.underline),),
                              SizedBox(height: 4,),
                              Row(
                                children: [
                                  SizedBox(width: 8,),
                                  Flexible(child: Text(journal['description'],)),
                                ],
                              ),
                            ],
                          ),
                        ),



                        SizedBox(height: 16,),

                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 80,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('エリア/最寄り駅',style: TextStyle(fontSize: 12,color: Colors.orange,decoration: TextDecoration.underline),),
                              SizedBox(height: 4,),
                              Row(
                                children: [
                                  SizedBox(width: 8,),
                                  Flexible(child: Text(journal['station'],)),
                                ],
                              ),
                            ],
                          ),
                        ),



                        SizedBox(height:16,),
                        ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: 80,
                            ),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ジャンル',style: TextStyle(fontSize: 12,color: Colors.orange,decoration: TextDecoration.underline),),
                              SizedBox(height: 4,),
                              Row(
                                children: [
                                  SizedBox(width: 8,),
                                  Flexible(child: Text(journal['genre'],)),
                                ],
                              ),
                            ],
                          ),
                        ),


                        SizedBox(height: 16,),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 80,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('URL',style: TextStyle(fontSize: 12,color: Colors.orange,decoration: TextDecoration.underline),),
                              SizedBox(height: 4,),
                              Row(
                                children: [
                                  SizedBox(width: 8,),
                                  Flexible(child: Link(
                                    // 開きたいWebページのURLを指定
                                    uri: Uri.parse(journal['url']),
                                    // targetについては後述
                                    target: LinkTarget.blank,
                                    builder: (BuildContext ctx, FollowLink? openLink) {
                                      return TextButton(
                                        onPressed: openLink,
                                        child: Text(
                                          journal['url'],
                                        ),
                                      );
                                    },
                                  ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                        ),


                      ],
                    ),
                  ) ,
                ),
              ],
            )
          ],
        ),
    );
  }
}