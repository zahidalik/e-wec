import consumer from "./consumer"

// THE FOLLOWING IS THE DEFAULT CODE:
// consumer.subscriptions.create("LiveSessionChannel", {
//   connected() {
//     // Called when the subscription is ready for use on the server
//   },
//
//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },
//
//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//   }
// });



//   // Broadcast Types
//   const JOIN_ROOM = "JOIN_ROOM";
//   const EXCHANGE = "EXCHANGE";
//   const REMOVE_USER = "REMOVE_USER";
//
//   // DOM Elements
//   let currentUser;
//   let localVideo;
//   let remoteVideoContainer;
//
//   // Objects
//   let pcPeers = {};
//   let localstream;
//
//   document.addEventListener('click', async (event) => {
//     if (event.target.id === 'start') {
//       startChat();
//     }
//   });
//
//   window.onload = () => {
//     currentUser = document.getElementById("current-user").innerHTML;
//     localVideo = document.getElementById("local-video");
//     remoteVideoContainer = document.getElementById("remote-video-container");
//   };
//
//   // Ice Credentials
//   const ice = { iceServers: [{ urls: "stun:stun.l.google.com:19302" }] };
//
//   // Initialize user's own video
//   document.onreadystatechange = () => {
//     if (document.readyState === "interactive") {
//       navigator.mediaDevices
//         .getUserMedia({
//           audio: false,
//           video: true
//         })
//         .then(stream => {
//           localstream = stream;
//           localVideo.srcObject = stream;
//           localVideo.muted = true;
//         })
//         .catch(logError);
//     }
//   };
//
//   const startChat = async () => {
//     consumer.subscriptions.create("LiveSessionChannel", {
//       connected: () => {
//         broadcastData({
//           type: JOIN_ROOM,
//           from: currentUser
//         });
//       },
//       received: data => {
//         console.log("received", data);
//         if (data.from === currentUser) return;
//         switch (data.type) {
//           case JOIN_ROOM:
//             return joinRoom(data);
//           case EXCHANGE:
//             if (data.to !== currentUser) return;
//             return exchange(data);
//           case REMOVE_USER:
//             return removeUser(data);
//           default:
//             return;
//         }
//       }
//     });
//   };
//
//   const handleLeaveSession = () => {
//     for (user in pcPeers) {
//       pcPeers[user].close();
//     }
//     pcPeers = {};
//
//     consumer.unsubscribe();
//
//     remoteVideoContainer.innerHTML = "";
//
//     broadcastData({
//       type: REMOVE_USER,
//       from: currentUser
//     });
//   };
//
//   const joinRoom = data => {
//     createPC(data.from, true);
//   };
//
//   const removeUser = data => {
//     console.log("removing user", data.from);
//     let video = document.getElementById(`remoteVideoContainer+${data.from}`);
//     video && video.remove();
//     delete pcPeers[data.from];
//   };
//
//   const createPC = (userId, isOffer) => {
//     let pc = new RTCPeerConnection(ice);
//     pcPeers[userId] = pc;
//     pc.addStream(localstream);
//
//     isOffer &&
//       pc
//         .createOffer()
//         .then(offer => {
//           pc.setLocalDescription(offer);
//           broadcastData({
//             type: EXCHANGE,
//             from: currentUser,
//             to: userId,
//             sdp: JSON.stringify(pc.localDescription)
//           });
//         })
//         .catch(logError);
//
//     pc.onicecandidate = event => {
//       event.candidate &&
//         broadcastData({
//           type: EXCHANGE,
//           from: currentUser,
//           to: userId,
//           candidate: JSON.stringify(event.candidate)
//         });
//     };
//
//     pc.onaddstream = event => {
//       const element = document.createElement("video");
//       element.id = `remoteVideoContainer+${userId}`;
//       element.autoplay = "autoplay";
//       element.srcObject = event.stream;
//       remoteVideoContainer.appendChild(element);
//     };
//
//     pc.oniceconnectionstatechange = event => {
//       if (pc.iceConnectionState == "disconnected") {
//         console.log("Disconnected:", userId);
//         broadcastData({
//           type: REMOVE_USER,
//           from: userId
//         });
//       }
//     };
//
//     return pc;
//   };
//
//   const exchange = data => {
//     let pc;
//
//     if (!pcPeers[data.from]) {
//       pc = createPC(data.from, false);
//     } else {
//       pc = pcPeers[data.from];
//     }
//
//     if (data.candidate) {
//       pc
//         .addIceCandidate(new RTCIceCandidate(JSON.parse(data.candidate)))
//         .then(() => console.log("Ice candidate added"))
//         .catch(logError);
//     }
//
//     if (data.sdp) {
//       sdp = JSON.parse(data.sdp);
//       pc
//         .setRemoteDescription(new RTCSessionDescription(sdp))
//         .then(() => {
//           if (sdp.type === "offer") {
//             pc.createAnswer().then(answer => {
//               pc.setLocalDescription(answer);
//               broadcastData({
//                 type: EXCHANGE,
//                 from: currentUser,
//                 to: data.from,
//                 sdp: JSON.stringify(pc.localDescription)
//               });
//             });
//           }
//         })
//         .catch(logError);
//     }
//   };
//
//   const broadcastData = data => {
//     fetch("live-sessions", {
//       method: "POST",
//       body: JSON.stringify(data),
//       headers: { "content-type": "application/json" }
//     });
//   };
//
//   const logError = error => console.warn("Whoops! Error:", error);
//














// const stream = await window.navigator.mediaDevices.getUserMedia(
//   {
//     video: true,
//     audio: true,
//   },
// );

// stream.getAudioTracks();
// stream.getVideoTracks();

// Alice creates a RTCPeerConnection object in her browser. It is a JavaScript interface, part of the WebRTC API, that represents the connection between the local browser and the remote peer.

// const peerConnection = new RTCPeerConnection({
//   iceServers: [{ urls: 'stun:stun.test.com:19000' }],
// });

// Alice adds the tracks (audio and video) that she wants to share over the connection to her RTCPeerConnection object.

// const stream = await navigator.mediaDevices.getUserMedia({
//   audio: true,
//   video: true,
// });

// stream.getTracks().forEach(track => peerConnection.addTrack(
//   track,
//   stream,
// ));

// Alice creates a SDP offer. SDP stands for Session Description Protocol.

// const offer = await peerConnection.createOffer();

// Alice sets the local description of the connection to be this SDP by calling setLocalDescription().

// await peerConnection.setLocalDescription(offer);

// Alice sends this offer to Bob over the signaling server.

// signaling.send(JSON.stringify({
//   message_type: MESSAGE_TYPE.SDP,
//   content: offer,
// }));

// Bob receives Alice’s offer and sets it as the remote description in his RTCPeerConnection object calling setRemoteDescription().

// await peerConnection.setRemoteDescription(offerFromAlice);

// Bob creates a SDP answer, containing the same kind of information as the SDP offer Alice sent.

// const answer = await peerConnection.createAnswer();

// Bob sets the local description of the connection to be this SDP by calling setLocalDescription().

// await peerConnection.setLocalDescription(answerFromBob);

// Bob sends this answer to Alice over the signaling mechanism.

// signaling.send(JSON.stringify({
//   message_type: MESSAGE_TYPE.SDP,
//   content: answerFromBob,
// }));

// We are now back at Alice. She receives Bob’s answer and sets it as the remote description in her RTCPeerConnection object calling setRemoteDescription().

// await peerConnection.setRemoteDescription(answerFromBob);

// The server has to be given as a parameter to the RTCPeerConnection as well.

// const peerConnection = new RTCPeerConnection({
//   iceServers: [
//     { urls: 'stun:stun.test.com:19000' },
//     { urls: 'turn:turn:19001' },
//   ],
// });

// Alice and Bob only have to listen to the event icecandidate of the RTCPeerConnection. It is triggered every time a ICE candidate is found. They should then send their candidates to each other.

// peerConnection.onicecandidate = (iceEvent) => {
//   signaling.send(JSON.stringify({
//     message_type: MESSAGE_TYPE.CANDIDATE,
//     content: iceEvent.candidate,
//   }));
// };

// When receiving the candidate of the other, Alice and Bob should pass it to the ICE agent of their RTCPeerConnection object.

// await peerConnection.addIceCandidate(content);


// When the connection is established, the tracks data start being exchanged
// over the connection. You can implement the ontrack event handler to
// display them:

// peerConnection.ontrack = (event) => {
//   const video = document.getElementById('remote-view');
//   if (!video.srcObject) {
//     video.srcObject = event.streams[0];
//   }
// };





// (function () {
//   "use strict";

//   document.addEventListener('click', async event => {
//     if (event.target.id === 'button') {
//       const stream = await window.navigator.mediaDevices.getUserMedia({ video: true, audio: true });
//       const video = document.getElementById('video');
//       video.srcObject = stream;
//       video.play();
//     }
//   });

// })();

// document.addEventListener('click', async event => {
// if (event.target.id === 'start') {
//   setupWebSocketConnection();
// } else if (event.target.id === 'say-hello') {
//   connection.send('Hello!');
// } else if (event.target.id === 'close') {
//   closeConnection();
// }
// });

/***************************************

****************************************/



(function () {
  "use strict";

  const MESSAGE_TYPE = {
    SDP: 'SDP',
    CANDIDATE: 'CANDIDATE',
  }

  document.addEventListener('click', async (event) => {
    if (event.target.id === 'start') {
      startChat();
    }
  });

  const startChat = async () => {
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true, video: true });
      showChatRoom();

      const signaling = consumer.subscriptions.create("LiveSessionChannel")
      const peerConnection = createPeerConnection(signaling);

      addMessageHandler(signaling, peerConnection);

      stream.getTracks().forEach(track => peerConnection.addTrack(track, stream));
      document.getElementById('self-view').srcObject = stream;

    } catch (err) {
      console.error(err);
    }
  };

  const createPeerConnection = (signaling) => {
    const peerConnection = new RTCPeerConnection({
      iceServers: [{ urls: 'stun:stun.l.test.com:19000' }],
    });

    peerConnection.onnegotiationneeded = async () => {
     await createAndSendOffer();
    };

    peerConnection.onicecandidate = (iceEvent) => {
      if (iceEvent && iceEvent.candidate) {
        signaling.send(JSON.stringify({
          message_type: MESSAGE_TYPE.CANDIDATE,
          content: iceEvent.candidate,
        }));
      }
    };

    peerConnection.ontrack = (event) => {
      const video = document.getElementById('remote-view');
      if (!video.srcObject) {
        video.srcObject = event.streams[0];
      }
    };

    return peerConnection;
  };

  const addMessageHandler = (signaling, peerConnection) => {
    signaling.onmessage = async (message) => {
      const data = JSON.parse(message.data);

      if (!data) {
        return;
      }

      const { message_type, content } = data;
      try {
        if (message_type === MESSAGE_TYPE.CANDIDATE && content) {
          await peerConnection.addIceCandidate(content);
        } else if (message_type === MESSAGE_TYPE.SDP) {
          if (content.type === 'offer') {
            await peerConnection.setRemoteDescription(content);
            const answer = await peerConnection.createAnswer();
            await peerConnection.setLocalDescription(answer);
            signaling.send(JSON.stringify({
              message_type: MESSAGE_TYPE.SDP,
              content: answer,
            }));
          } else if (content.type === 'answer') {
            await peerConnection.setRemoteDescription(content);
          } else {
            console.log('Unsupported SDP type.');
          }
        }
      } catch (err) {
        console.error(err);
      }
    };
  };

  const createAndSendOffer = async (signaling, peerConnection) => {
    const offer = await peerConnection.createOffer();
    await peerConnection.setLocalDescription(offer);

    signaling.send(JSON.stringify({ message_type: MESSAGE_TYPE.SDP, content: offer }));
  };

  const showChatRoom = () => {
    document.getElementById('start').style.display = 'none';
    document.getElementById('stop').style.display = 'block';
    document.getElementById('chat-room').style.display = 'block';
  };
})();


//  There is a similar function to access the user’s screen: getDisplayMedia

// const stream = await navigator.mediaDevices.getDisplayMedia();

// see the downloads for this action. I have downloaded it there.
