import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skillfree/user/bookconform.dart';

// class booknow  extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//      body: ListView(
//        children: [
//          Text('Have a nice day'),
//
//        ],
//      ),
//    );
//   }
//
// }

class BookingConsole extends StatefulWidget {
  @override
  _BookingConsoleState createState() => _BookingConsoleState();
}

class _BookingConsoleState extends State<BookingConsole> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Console'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text("Select Date"),
            subtitle: Text("${selectedDate.toLocal()}".split(' ')[0]),
            onTap: () => _selectDate(context),
          ),
          ListTile(
            title: Text("Select Time"),
            subtitle: Text("${selectedTime.format(context)}"),
            onTap: () => _selectTime(context),
          ),

          Center(child: Text('RS 500/-')),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>brentbus()));
          }, child: Text('Pay Now'))
          // Add payment options UI and logic here
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: BookingConsole(),
//   ));
// }
