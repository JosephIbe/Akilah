import 'package:akilah/utils/strings.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class AkilahVideoPlayer extends StatefulWidget {
  @override
  _AkilahVideoPlayerState createState() => _AkilahVideoPlayerState();
}

class _AkilahVideoPlayerState extends State<AkilahVideoPlayer> {

  BetterPlayerDataSource _dataSource;
  BetterPlayerController _controller;

  final _playerKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        sampleVideoOne,
        notificationConfiguration: BetterPlayerNotificationConfiguration(
          showNotification: true,
          title: 'Big Buck Bunny',
          // imageUrl: 'assets/big_buck_bunny.jpg',
          author: 'Akilah',
        )
    );

    _controller = BetterPlayerController(
        BetterPlayerConfiguration(
          fit: BoxFit.cover,
          aspectRatio: 4/3,
          autoPlay: false,
          showPlaceholderUntilPlay: true,
          controlsConfiguration: BetterPlayerControlsConfiguration(
              enableMute: true,
              enableOverflowMenu: true,
              overflowMenuIcon: const IconData(0xe146, fontFamily: 'MaterialIcons',),
              showControlsOnInitialize: false,
              playerTheme: BetterPlayerTheme.material,
            enableProgressText: true
          ),
          placeholder: Image.asset('assets/big_buck_bunny.jpg', fit: BoxFit.cover,),
        ),
        betterPlayerDataSource: _dataSource
    );

    _controller.enablePictureInPicture(_playerKey);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BetterPlayer(
        key: _playerKey,
        controller: _controller,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}