//import 'dart:html';
//import 'dart:io';

import 'package:flutter/cupertino.dart';
//import 'package:smaple_flutter1/db_page.dart';


//import 'db_page.dart';

import 'package:flutter/material.dart';
import 'employee.dart';
import 'dart:async';
import 'db_helper.dart';
import 'main.dart';





class UserNotesDemo extends StatefulWidget {
  final String title;

  UserNotesDemo({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DBTestPageState();
  }
}

class _DBTestPageState extends State<UserNotesDemo> {
  //
  Future<List<Employee>> employees;
  TextEditingController controller = TextEditingController();
  String name;
  int curUserId;

  final formKey = new GlobalKey<FormState>();
  var dbHelper;
  bool isUpdating;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    isUpdating = false;
    refreshList();
  }

  refreshList() {
    setState(() {
      employees = dbHelper.getEmployees();
    });
  }

  clearName() {
    controller.text = '';
  }

  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      if (isUpdating) {
        Employee e = Employee(curUserId, name);
        dbHelper.update(e);
        setState(() {
          isUpdating = false;
        });
      } else {
        Employee e = Employee(null, name);
        //print('print me 1');
        dbHelper.save(e);
         clearName();
        //print('print me 2');
      }
     
      refreshList();
    }
    refreshList();
  }

  form() {
   
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Notes'),
              validator: (val) => val.length == 0 ? 'Enter Notes' : null,
              onSaved: (val) => name = val,
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                   onPressed: validate,
                  child: Text(isUpdating ? 'Update' : 'Add Notes'),
                  //refreshList();
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isUpdating = false;
                    });
                    clearName();
                  },
                  child: Text('Cancel'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView dataTable(List<Employee> employees) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('NOTES'),
          ),
          DataColumn(
            label: Text('DELETE'),
          )
        ],
        rows: employees
            .map(
              (employee) => DataRow(cells: [
                    DataCell(
                      Text(employee.name),
                      onTap: () {
                        setState(() {
                          isUpdating = true;
                          curUserId = employee.id;
                        });
                        controller.text = employee.name;
                      },
                    ),
                    DataCell(IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        dbHelper.delete(employee.id);
                        refreshList();
                      },
                    )),
                  ]),
            )
            .toList(),
      ),
    );
  }

  list() {
    return Expanded(
      child: FutureBuilder(
        future: employees,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //return Text("aaaa");
            return dataTable(snapshot.data);
        }

          if ( snapshot.data==null || snapshot.data.length == 0) {
            return Text("No Data Found");
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('User Notes'),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            form(),
            list(),
        FlatButton(

                child: Text('Back', style: TextStyle(fontSize: 20.0),),  
                color: Colors.blueAccent,  
                
                textColor: Colors.white,  
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>new SecondRoute()));
                },  
          
      ),
          ],
        ),
        
      ),
    );
  }
}


