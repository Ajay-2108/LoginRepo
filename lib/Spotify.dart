import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Spotify extends StatefulWidget {
  const Spotify({super.key});

  @override
  State<Spotify> createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  NestedScrollView(
          headerSliverBuilder: (BuildContext,bool)
        {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 400,
                          width: 375,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                                end: Alignment(-1, 2),
                                colors: <Color> [
                                  Colors.brown,
                                  Colors.black54,
                                  Colors.black,
                                  Colors.brown
                                ],
                              tileMode: TileMode.mirror
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 250,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("https://tse4.mm.bing.net/th/id/OIP.Z80OgcBvpXhaLtPcpbOGwgAAAA?pid=Api&P=0&h=180"),
                                  ),
                                ),
                              ),
                              Text(" Step up for the Yuvan hits",style:
                              TextStyle(height: 2),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage("https://tse2.mm.bing.net/th/id/OIP.R4RlF8nCTv__QaesfwAZmAAAAA?pid=Api&P=0&h=180"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(" Spotify",style:
                                  TextStyle(fontSize: 21,
                                  color: Colors.white,height: 3),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("140,384 saves - 4h 17min",style:
                                    TextStyle(color: Colors.white,
                                    fontSize: 12),

                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage("https://tse4.mm.bing.net/th/id/OIP.Z80OgcBvpXhaLtPcpbOGwgAAAA?pid=Api&P=0&h=180"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.add_circle_outline,color: Colors.white60,),
                                    ),
                                    SizedBox(
                                      width: 210,
                                      child: Row(
                                        children: [
                                          Icon(Icons.arrow_circle_down_outlined, color: Colors.white60),
                                          Icon(Icons.more_vert_outlined,color: Colors.white60),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.shuffle_rounded,color: Colors.green),
                                    Icon(Icons.play_circle,color: Colors.green,size: 47,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
          body: ListView.builder(
            scrollDirection: Axis.vertical,
              itemCount: 30,
              itemBuilder: (BuildContext, index) {
              return ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://tse4.mm.bing.net/th/id/OIP.Z80OgcBvpXhaLtPcpbOGwgAAAA?pid=Api&P=0&h=180"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                title: Text("Thuli Thuli",
                style: TextStyle(color: Colors.white60),
                ),
                subtitle: Text("Yuvan Shankar Raja",
                style: TextStyle(color: Colors.white60),
                ),
                trailing: Icon(Icons.more_vert_outlined),
              );
          }
          ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}


