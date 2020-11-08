import 'package:flutter/material.dart';
import 'package:votaciones_flutter/models/band.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
    Band(id: '1', name: 'Billy Talent', votes: 5),
    Band(id: '2', name: 'Breaking Benjamin', votes: 1),
    Band(id: '3', name: 'Sick Puppies', votes: 4),
    Band(id: '4', name: 'Twenty One Pilote', votes: 3)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Band Names', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) => bandTile(bands[index])
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: addNewBand,
      ),
    );
  }

  Widget bandTile(Band band) {
    return Dismissible(
        key: Key(band.id),
        direction: DismissDirection.startToEnd,
        background: Container(
          padding: EdgeInsets.only(left: 8),
          color: Colors.red,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Delete band', style: TextStyle(color: Colors.white)),
          )
        ),
        child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0,2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}'),
      ),
    );
  }

  addNewBand(){

    final textController = new TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('New band name'),
          content: TextField(
            controller: textController,
          ),
          actions: [
            MaterialButton(
              child: Text('Add'),
              elevation: 5,
              textColor: Colors.blue,
              onPressed: () => addBandtoList(textController.text)
            )
          ],
        );
      }
    );
  }
  void addBandtoList(String name){
    print(name);
    if(name.length > 1){

    }
    Navigator.pop(context);
  }
}