import 'package:flutter/material.dart';

class Zomato extends StatelessWidget {
  const Zomato({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.mic),
              border: OutlineInputBorder(),
              hintText: "Restaurant name or dish...",
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/50.jpg"),
                        fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://tse3.mm.bing.net/th/id/OIP.kImW3P0cnJSVmrBUDLkGNwHaE8?pid=Api&P=0&h=180"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Text("All")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://tse2.mm.bing.net/th/id/OIP.CO3A6Pqr-B1qdRQsvgaLpAHaHa?pid=Api&P=0&h=180"),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Text("Biryani")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://tse1.mm.bing.net/th/id/OIP.oAhtud_o6lLgdf2NoyccgwHaF9?pid=Api&P=0&h=180"),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    Text("Chicken")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://tse1.mm.bing.net/th/id/OIP.I-TrGXBK4GKD38-9qUXbNgHaHa?pid=Api&P=0&h=180"),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Text("Pizza")
                  ],
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      border: Border.all(),
                    ),
                  child: Column(
                    children: [
                      Container(
                        height:275,
                        width: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("https://tse1.mm.bing.net/th/id/OIP.6cetQxM_yNRkmkIWGC5qywHaFF?pid=Api&P=0&h=180"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Container(
                                    height: 20,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(),
                                      color: Colors.black,
                                    ),
                                    child: Center(
                                      child: Text("Hot Chicken Wings-4pc-₹185",style:
                                      TextStyle(color: Colors.white,fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.bookmark_border),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.remove_red_eye_outlined),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.timer_outlined),
                          Text("30-35 mins - 3.2km - ",style: TextStyle(fontSize: 12),),
                          Icon(Icons.directions_bike_outlined),
                          Text(" Free",style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("  KFC",style: TextStyle(
                              fontSize: 25,fontWeight: FontWeight.bold),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 25,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(),
                                  color: Colors.red,
                                ),
                                child: Row(
                                  children: [
                                    Text(" 3.9",style: TextStyle(
                                        fontSize: 10,color: Colors.white),),
                                    Icon(Icons.star,size: 12,color: Colors.white,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



