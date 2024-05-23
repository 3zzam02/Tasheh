// TextEditingController fullName = TextEditingController();                    ADD
//   TextEditingController address = TextEditingController();
//   NumberEditingTextController phoneNumber =
//       NumberEditingTextController.integer();
//   NumberEditingTextController balance = NumberEditingTextController.integer();
//   FormState formState = FormState();
//   CollectionReference users = FirebaseFirestore.instance.collection('users');
//   adduserinfo() {
//     users
//         .add({
//           'Email': FirebaseAuth.instance.currentUser!.email,
//           'Userid': FirebaseAuth.instance.currentUser!.uid,
//           'full name': fullName.text,
//           'address': address.text,
//           'phone number': phoneNumber.number,
//           'balance': balance.number = 0,
//         })
//         .then((value) => print('User Added'))
//         .catchError((error) => print('Failed to Add User $error'));
//     Navigator.of(context).pushReplacementNamed('HomeScreen');
//   }
















// void checkmaxattendees (){
  // if (data['maxattendees'] == null){
                    //   SnackBar
                    // } 
                    // else
                    // Text('Max Number of Attendees : ${data['maxattendees']}'), 
//}
                    


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

// Stream<int> _getPendingEventCountStream() {
//     return FirebaseFirestore.instance
//         .collection('eventsCollection')
//         .where('status', isEqualTo: 'pending')
//         .snapshots()
//         .map((snapshot) => snapshot.size);
//   }

 //   child: InkWell(                             Deleting account Info
                  // onTap: () {
                  //   AwesomeDialog(
                  //     context: context,
                  //     dialogType: DialogType.warning,
                  //     animType: AnimType.rightSlide,
                  //     title: 'Warning',
                  //     desc: 'Delete this Account ?',
                  //     descTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  //     titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  //     btnCancelOnPress: () {
                  //       print('cancel');
                  //     },
                  //     btnOkOnPress: () async {
                  //       await FirebaseFirestore.instance
                  //           .collection('users')
                  //           .doc(data[i].id)
                  //           .delete();
                  //     },
                  //   ).show();
                  // },