import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pregister extends StatefulWidget{
  @override
  State<pregister> createState() => _registerState();
}

class _registerState extends State<pregister> {
  var name_controller=TextEditingController();
  var id=TextEditingController();
  var function_controller=TextEditingController();
  var locality_controller=TextEditingController();
  var description_controller=TextEditingController();
  var dwage_controller=TextEditingController();
  late CollectionReference _painterCollection;

  @override
  void initState() {
    _painterCollection=FirebaseFirestore.instance.collection('painters');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration'),),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text('Worker Registration')),
            TextField(
              controller: id,
              decoration: InputDecoration(labelText: 'RegisterNumber',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            TextField(
              controller: name_controller,
              decoration: InputDecoration(labelText: 'Name',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            TextField(
              controller:function_controller,
              decoration: InputDecoration(labelText: 'Function',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            TextField(
              controller: locality_controller,
              decoration: InputDecoration(labelText: 'Location',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            TextField(
              controller: dwage_controller,
              decoration: InputDecoration(labelText: 'Daily Wages',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            Container(height: 100,
              margin: const EdgeInsets.symmetric(horizontal:5,vertical: 5),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.0),

              ),
              child: TextField(
                controller: description_controller,
                decoration: InputDecoration(
                    hintText: "Overview",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.edit)
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: (){
              addUser();
            }, child: Text('Add Worker')),
            StreamBuilder<QuerySnapshot>(stream: getUser(),
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Text('Error${snapshot.error}');
                  }
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  final painters=snapshot.data!.docs;
                  return Expanded(child: ListView.builder(itemCount: painters.length,itemBuilder: (context,index){
                    final painter=painters[index];
                    final paintersId=painter.id;
                    final painterspId=painter['pid'];
                    final paintersfunction=painter['function'];
                    final paintersname=painter['pname'];
                    final painterslocality=painter['locality'];
                    final paintersdwage=painter['dwage'];
                    // final paintersdescription=painter['description'];

                    return ListTile(
                      leading: CircleAvatar(backgroundImage: AssetImage('assets/icon/person.png'),),
                      title: Text('$paintersname',style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('$painterspId'),
                            Text('$paintersfunction',style: TextStyle(fontWeight: FontWeight.bold),),
                            Text('Daily Wage:$paintersdwage\/-',style: TextStyle(color:Colors.blueGrey )),
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Icon(Icons.location_on),
                                Text('$painterslocality')
                              ],
                            ),

                          ]),
                      trailing: Wrap(
                        children: [
                          IconButton(onPressed: (){
                            editUser(paintersId);
                          }, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){
                            deleteUser(paintersId);
                          }, icon: Icon(Icons.delete))
                        ],
                      ),
                    );
                  }));
                }),
          ],
        ),
      ),
    );
  }
  void editUser(var id){
    showDialog(context: context, builder: (context){
      final newname_controller=TextEditingController();
      final newfunction_controller=TextEditingController();
     final newlocality_controller=TextEditingController();
      final newdescription_controller=TextEditingController();
      final  newdwage_controller=TextEditingController();
      return AlertDialog(
        title:Text('Update Worker'),
        content: Column(mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newname_controller,
              decoration: InputDecoration(labelText: 'Name',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            TextField(
              controller:newfunction_controller,
              decoration: InputDecoration(labelText: 'Function',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            TextField(
              controller: newlocality_controller,
              decoration: InputDecoration(labelText: 'Location',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            TextField(
              controller: newdwage_controller,
              decoration: InputDecoration(labelText: 'Daily Wages',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            Container(height: 100,
              margin: const EdgeInsets.symmetric(horizontal:5,vertical: 5),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20.0),

              ),
              child: TextField(
                controller: newdescription_controller,
                decoration: InputDecoration(
                    hintText: "Overview",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.edit)
                ),
              ),
            )
          ],
        ),
        actions: [
          TextButton(onPressed: (){
            updateUser(id,newname_controller.text,newdwage_controller.text,newdescription_controller.text,newdwage_controller.text,newlocality_controller.text).then((value){
              Navigator.pop(context);
            });
          }, child: Text('update'))
        ],
      );
    });
  }
  ///create user
  Future<void>addUser()async{
    return _painterCollection.add({
      'pname':name_controller.text,
      'pid':id.text,
      'function':function_controller.text,
      'locality':locality_controller.text,
      'dwage':dwage_controller.text,
      'description':description_controller.text,

    }).then((value) {
      print('User Added Succesfully');
      name_controller.clear();
      id.clear();
      function_controller.clear();
      dwage_controller.clear();
      description_controller.clear();
      locality_controller.clear();

    }).catchError((error){
      print('Failed To add User$error');
    });
  }
  ///read user
  Stream<QuerySnapshot> getUser(){
    return _painterCollection.snapshots();
  }
  ///update user
  Future<void>updateUser(var id,String newname,String newdailywage,String newfunction,String newlocality,String newdescription)async{
    return _painterCollection
        .doc(id)
        .update({'pname':newname,'dwage':newdailywage,'function':newfunction,'locality':newlocality,'description':newdescription}).then((value){
      print('user update Succcesfully');
    }).catchError((error){
      print('user data update failed$error');
    });
  }
  ///delete user
  Future<void>deleteUser(var id)async{
    return _painterCollection.doc(id).delete().then((value) {
      print('user delete Successfuly');
    }).catchError((error){
      print('user delet failed$error');
    });
  }
}