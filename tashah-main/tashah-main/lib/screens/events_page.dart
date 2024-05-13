import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Events : ',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 226, 205, 255),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 0, 0),
      ),
      body: Container(alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 141, 23, 14),
              Color.fromARGB(255, 223, 161, 153)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        
        child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView(padding: const EdgeInsets.symmetric(vertical: 50 , horizontal: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return ListTile(contentPadding: const EdgeInsets.symmetric(vertical: 25),
                      leading: Image.network(
                      data['postUrl'],
                      cacheHeight: 150,
                      cacheWidth: 150,
                    ),
                    title: Text(data['description']),
                    subtitle: Text(data['postId']),

                    // Add more widgets to display other data as needed
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}


// import 'package:eventro/pages/event/event_details.dart';
// import 'package:flutter/material.dart';

// class CreatedEventTile extends StatelessWidget {
//   final String imageUrl;
//   final String eventName;
//   final String eventID;
//   final String status;
//   final String rejectionReason;
//   final VoidCallback onDelete;
//   final IconData icon;

//   const CreatedEventTile(
//       {super.key,
//       required this.imageUrl,
//       required this.eventName,
//       required this.status,
//       required this.onDelete,
//       required this.eventID,
//       required this.icon,
//       this.rejectionReason = ''});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigate to the EventDetails page when the card is tapped
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => EventDetails(eventId: eventID),
//           ),
//         );
//       },
//       child: Card(
//         child: ListTile(
//           leading: imageUrl.isNotEmpty
//               ? CircleAvatar(
//                   backgroundImage: NetworkImage(imageUrl),
//                   radius: 30,
//                 )
//               : const Placeholder(), // Placeholder for image if imageUrl is empty
//           title: Text(eventName),
//           subtitle: status == 'rejected'
//               ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Status: $status'),
//                     const SizedBox(height: 5),
//                     Text(
//                       'Rejection Reason: $rejectionReason',
//                       style: const TextStyle(color: Colors.red),
//                     ),
//                   ],
//                 )
//               : Text('Status: $status'),
//           trailing: Container(
//             decoration: const BoxDecoration(
//               color: Color(0xffEC6408),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12),
//                 bottomRight: Radius.circular(12),
//               ),
//             ),
//             child: IconButton(
//               onPressed: onDelete,
//               icon: Icon(
//                 icon,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



//   void _updateEventStatus(int price,String s) {
//     FirebaseFirestore.instance
//         .collection('your collection')
//         .doc()
//         .update({
//       'price': price,
//       'rejectionReason':
//           s, // Save the rejection reason in Firestore
//     });
//   }
// 

// await FirebaseFirestore.instance
//             .collection('your collection')
//             .doc(id)
//             .delete();