import 'dart:async';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:app/classes/dependencies.dart';
import 'package:flutter/rendering.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key, this.stream,this.semanaqta,this.proximoExer}) : super(key: key);
  //String uid;
  int semanaqta;
  int proximoExer;
  String stream;
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();

 
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  int _playBackTime;

  int exercicio=1;
  int aux;
 
  Dependencies dependencies = Dependencies();

  //The values that are passed when changing quality
  Duration newCurrentPosition;

  String stream1 =
                      'https://archive.org/download/Damas_BB_28F8B535_D_406/DaMaS.mp4';//mulheres
  String stream2 = 'https://archive.org/download/cCloud_20151126/cCloud.mp4';//diversos
  String stream3 = 'https://archive.org/download/mblbhs/mblbhs.mp4';//celular
  String streamdefault = 'videos/butterfly.mp4';

  @override
  void initState() {
    
    //(widget.stream ==null)? _controller = VideoPlayerController.network(stream1):
    if(widget.stream == null){
      _controller = VideoPlayerController.asset(streamdefault);
    }else{
      _controller = VideoPlayerController.network(widget.stream);
      print('entrei aqui');
    }
    
    
    _controller.addListener(() {
      setState(() {
        _playBackTime = _controller.value.position.inSeconds;
      });
    });
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _initializeVideoPlayerFuture = null;
    _controller?.pause()?.then((_) {
      _controller.dispose();
    });
    super.dispose();
  }

  Future<bool> _clearPrevious() async {
    await _controller?.pause();
    return true;
  }

  Future<void> _initializePlay(String videoPath) async {
    _controller = VideoPlayerController.network(videoPath);
    _controller.addListener(() {
      setState(() {
        _playBackTime = _controller.value.position.inSeconds;
      });
    });
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      _controller.seekTo(newCurrentPosition);
      _controller.play();
    });
  }

  _getValuesAndPlay(String videoPath) {
    newCurrentPosition = _controller.value.position;
    _startPlay(videoPath);
    print(newCurrentPosition.toString());
  }

  Future<void> _startPlay(String videoPath) async {
    setState(() {
      _initializeVideoPlayerFuture = null;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      _clearPrevious().then((_) {
        _initializePlay(videoPath);
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: <Widget>[

              Container(
                
                height: 250, //altura do container
                width: 430, 
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  
                  child: VideoPlayer(_controller),
                  
                ),
              ),
              //Align(
               // alignment: Alignment.bottomCenter,
                Positioned(
                  top:250,
                  //height:300,
                 // color: Colors.black54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: FloatingActionButton(
                          onPressed: () {
                            // Wrap the play or pause in a call to `setState`. This ensures the
                            // correct icon is shown.
                            setState(() {
                              // If the video is playing, pause it.
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                                
                              } else {
                                // If the video is paused, play it.
                                _controller.play();
                              }
                            });
                          },
                          // Display the correct icon depending on the state of the player.
                          child: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                        ),
                      ),
                    
                    
                      /* Container(
                        child: FlatButton(
                          color: Colors.yellow,
                          onPressed: () {
                            _getValuesAndPlay(defaultStream);
                          },
                          child: Text('Default Stream'),
                        ),
                      ),        */              
                    ],
                  ),
                )
             
              


            /* Container(
              //alignment: Alignment(0.21,0.976),//movimenta o container inteiro 
              //padding: EdgeInsets.all(10.0),
              child:  MainScreenPortrait(dependencies: dependencies,semanaqta:widget.semanaqta,proximoExer:widget.proximoExer)
                  //: MainScreenLandscape(dependencies: dependencies)
            )  
            ]
            )
          ); */
          
            ]
            );
          
          
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Center(child: CircularProgressIndicator());
        }
      },
    );
              
        
          
    
        }
  }


/* class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key,this.semanaqta}) : super(key: key);
  //String uid;
  final int semanaqta;

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();

  /* void recebe(int semanaqta) {
    semanaqta = semanaqta;
     print(semanaqta);
  } */
}


class Clip {
  final String fileName;
  final String title;
  final int runningTime;
  Clip(this.fileName, this.title, this.runningTime);

  String videoPath() {
    return "embed/$fileName.mp4";
  }

  String thumbPath() {
    return "embed/$fileName.png";
  }
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  //FirebaseUser currentUser; 
  int exercicio=1;
  int aux =1;
 
  Dependencies dependencies = new Dependencies();

  List<Clip> _clips = [
    new Clip("small", "small", 6),
    new Clip("earth", "earth", 13),
    new Clip("giraffe", "giraffe", 18),
    new Clip("particle", "particle", 11),
    new Clip("summer", "summer", 8)
  ];


  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    //_controller = VideoPlayerController.asset('videos/prancha.mp4');
  
    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(false);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    

    super.dispose();
  }

   
  void escolheVideo(){
    
  if (aux==1){
  //(widget.semanaqta==1|| widget.semanaqta==2) {
    print('estou aqui');
    
      if (exercicio == 1){
        dispose(); 
        _controller = VideoPlayerController.asset('videos/butterfly.mp4');
      }else if (exercicio == 2){
        dispose();
        _controller= VideoPlayerController.asset('videos/prancha.mp4');
      }
  }

  if (widget.semanaqta==3||widget.semanaqta==4) {
    
  }
    
  }
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: Stack(
        children: <Widget>[
       
        
              Container(
                //alignment: Alignment.topCenter,
                height: 290, //altura do container
                width: 400, 

                
                child:FutureBuilder(
                  
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the VideoPlayerController has finished initialization, use
                      // the data it provides to limit the aspect ratio of the video.
                      return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        // Use the VideoPlayer widget to display the video.
                        child: VideoPlayer(_controller),
                      );
                    } else {
                      // If the VideoPlayerController is still initializing, show a
                      // loading spinner.
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
                  
              
              Container(
                alignment: Alignment(-0.8,-0.2),


                child:FloatingActionButton(
                  
                  onPressed: () {
                    // Wrap the play or pause in a call to `setState`. This ensures the
                    // correct icon is shown.
                    setState(() {
                      // If the video is playing, pause it.
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                        exercicio=1+exercicio;
                        escolheVideo();
                        print('semana q ta ${widget.semanaqta}');
                      } else {
                        // If the video is paused, play it.
                        _controller.play();
                      }
                    });
                  },
                  // Display the correct icon depending on the state of the player.
                  child: Icon(
                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                ),
              ),
            

            Container(
              alignment: Alignment(0.21,0.976),//movimenta o container inteiro 
              padding: EdgeInsets.all(20.0),
              child:  MainScreenPortrait(dependencies: dependencies,semanaqta:widget.semanaqta)
                  //: MainScreenLandscape(dependencies: dependencies)
            ) 
        ]
      )
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
 /*  void recebe(int semanaqta){
    semanaqta = semanaqta;
     print(semanaqta);
  } */
}
 */