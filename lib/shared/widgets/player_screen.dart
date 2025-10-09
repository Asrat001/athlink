import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF152238),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.arrow_back, color: Colors.white), onPressed: () {}),
                Text(
                  'PLAYING FROM YOUR LIERARY\nLiked Songs',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                IconButton(icon: Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/300'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Text(
                        'I hate being\nBi-Polar\nit\'s awesome',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Wouldn\'t Leave',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.check_circle, color: Colors.green, size: 20),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.explicit, color: Colors.grey, size: 16),
                    SizedBox(width: 5),
                    Text(
                      'Kanye West, PARTYNEXTDOOR',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
                Slider(
                  value: 20,
                  max: 205,
                  onChanged: (value) {},
                  activeColor: Colors.green,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0:20', style: TextStyle(color: Colors.white)),
                    Text('3:25', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(icon: Icon(Icons.shuffle, color: Colors.green), onPressed: () {}),
                    IconButton(icon: Icon(Icons.skip_previous), onPressed: () {}),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.pause, size: 30),
                    ),
                    IconButton(icon: Icon(Icons.skip_next), onPressed: () {}),
                    IconButton(icon: Icon(Icons.repeat, color: Colors.green), onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}