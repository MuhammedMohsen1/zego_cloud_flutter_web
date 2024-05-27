// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';

class ZegoJavaScript {
  //consts
  static const String viewIdLocal = 'zego-meet-container';

  static void buildIframeContent() async {
    debugPrint('Building IFRAME');
    // Create a Blob from the HTML content

    String screenScript = _IframeContentScript();
    final blob = html.Blob([screenScript], 'text/html');
    final blobUrl = html.Url.createObjectUrlFromBlob(blob);
    print(blobUrl);
    ui_web.platformViewRegistry.registerViewFactory(viewIdLocal, (int viewId) {
      final element = html.IFrameElement()
        ..src = blobUrl
        ..style.border = 'none'
        ..allow = "microphone; camera;"
        ..allowFullscreen = true;

      element.onLoad.listen((_) {
        debugPrint('BUILD is DONE');
      });
      // // Clean up the Blob URL when it's no longer needed
      // element.onLoad.listen((_) {
      //   html.Url.revokeObjectUrl(blobUrl);
      // });
      return element;
    });
  }

  // ignore: non_constant_identifier_names
  static String _IframeContentScript() {
    return ''' <html>
    <head>
     <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Zego Cloud Video Call</title>
          <style>
          html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow: hidden; /* Prevent scrolling */
          }
          #root {
            width: 100vw;
            height: 100vh;
          }
        </style>
<body>  
  <div id="root"></div>

  
 <script src="https://unpkg.com/@zegocloud/zego-uikit-prebuilt/zego-uikit-prebuilt.js"></script>
  <script>
        // Function to generate a random user ID
        function generateRandomUserId(length) {
      var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
      var result = '';
      for (var i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * characters.length));
      }
      return result;
    }
    var zp;
    document.addEventListener('DOMContentLoaded', function() {
      const roomID = "roomId"; // Replace with your room ID
      const userID = generateRandomUserId(20); // Replace with your user ID logic
      const userName = "Muhammed12"; // Replace with user's display name
      const appID = 1588161922;
      const serverSecret = "70b700b662f12e892602c841ce7d648a"; 

      // Generate a Kit Token by calling a method.
      const kitToken = ZegoUIKitPrebuilt.generateKitTokenForTest(appID, serverSecret, roomID, userID, userName);

       zp = ZegoUIKitPrebuilt.create(kitToken);
      zp.joinRoom({
        container: document.querySelector("#root"),
       
        scenario: {
          mode: ZegoUIKitPrebuilt.VideoConference,
        },
        showRoomTimer: true,
        showPreJoinView: false,
        turnOnCameraWhenJoining: true,
        showMyCameraToggleButton: true,
        showAudioVideoSettingsButton: true,
        showScreenSharingButton: true,
        screenSharingConfig: {
          resolution: ZegoUIKitPrebuilt.ScreenSharingResolution_720P
        },
          
      showLeavingView: false,
      showLeaveRoomConfirmDialog:false,
      onJoinRoom: () => {
        console.log("Joined the room");
        
      },
      onLeaveRoom: () => {
        console.log("Left the room");
      
       
      },
      
         onUserJoin: () => {
        
        
      },
      onUserLeave: () => {
         console.log("onUserLeave");
      
        
      },

      });
    });


  </script>
</body>
</head>
</html>
          ''';
  }
}
