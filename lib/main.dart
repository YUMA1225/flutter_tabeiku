import 'package:flutter/material.dart';
import 'package:tabeiku/sql_helper.dart';
import 'package:tabeiku/show.dart';
import 'package:sqflite/sqflite.dart' as sql;
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '食べイク',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {
  List<Map<String,dynamic>> _journals=[];
  bool _isLoading = true;

  void _refreshJournals() async{
    final data = await SQLHelper.getItems();
    setState((){
      _journals=data;
      _isLoading = false;
    });
  }
  @override
  void initState(){
    super.initState();
    _refreshJournals();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _stationController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  void _showForm(int? id) async{
    var databasesPath = await sql.getDatabasesPath();
    print(databasesPath);
    if (id != null) {
      final existingJournal = _journals.firstWhere((element) => element['id'] == id);
      _nameController.text = existingJournal['name'];
      _addressController.text = existingJournal['address'];
      _descriptionController.text = existingJournal['description'];
      _stationController.text = existingJournal['station'];
      _genreController.text = existingJournal['genre'];
      _urlController.text = existingJournal['url'];
    }
    if (id == null) {
      _nameController.text ='';
      _addressController.text ='';
      _descriptionController.text ='';
      _stationController.text ='';
      _genreController.text ='';
      _urlController.text ='';
    }


    showModalBottomSheet(
        context: context,
        // elevation: 2,
        isScrollControlled: true,
        builder: (BuildContext context){
          return Padding(padding: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Container(
            height: 599,
            child:Column(
            children: [
              Flexible(
                child: ListView(
                  children: [
                    // SizedBox(height: 100,),
                    Center(
                      child: Padding(
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.orange),
                            // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            labelText: '店名',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(left: 20,top: 40,right: 20,bottom: 16),
                      ),
                    ),
                    Center(
                      child: Padding(
                        child: TextField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.orange,
                                fontSize: 16),
                            // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            labelText: '住所',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                            ),

                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                      ),
                    ),
                    Center(
                      child: Padding(
                        child: TextField(
                          controller: _descriptionController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 5,

                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.orange),
                            // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            labelText: 'メモ',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                            ),

                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                      ),
                    ),
                    Center(
                      child: Padding(
                        child: TextField(
                          controller: _stationController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.orange),
                            // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            labelText: 'エリア/最寄り駅',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                            ),

                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                      ),
                    ),
                    Center(
                      child: Padding(
                        child: TextField(
                          controller: _genreController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.orange),
                            // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            labelText: 'ジャンル',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                            ),

                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                      ),
                    ),
                    Center(
                      child: Padding(
                        child: TextField(
                          controller: _urlController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.orange),
                            // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            labelText: 'url',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                            ),

                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text('保存せずに戻る'),
                    ),
                  ),

                  SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                      onPressed: () async {
                        if (id == null){
                          await _addItem();
                        }
                        if (id != null){
                          await _updateItem(id);
                        }
                        _nameController.text ='';
                        _addressController.text ='';
                        _descriptionController.text ='';
                        _stationController.text ='';
                        _genreController.text ='';
                        _urlController.text ='';

                        Navigator.of(context).pop();

                      },
                      child: Text(id == null ? '新しく作成する':'保存する'),
                    ),
                  )

                ],
              ))

            ],
          ),
          ),
          );
        },
    );
  }

  Future<void> _updateItem(int id) async{
    await SQLHelper.updateItem(
        id, _nameController.text, _addressController.text, _descriptionController.text, _stationController.text, _genreController.text, _urlController.text);
    _refreshJournals();
  }

  Future<void> _addItem() async {
    await SQLHelper.createItem(
      _nameController.text, _addressController.text,_descriptionController.text,_stationController.text,_genreController.text,_urlController.text);
    _refreshJournals();
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    _refreshJournals();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('食べイク',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body:Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),),
          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.center,
            width: 360,
            height: 88,
            child: Column(
              children: [
                SizedBox(height: 8,),
                Text('ココイク!!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text('行きたい飲食店をクリップしよう！',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator(),)
              :Flexible(
              child: ListView.builder(

                itemCount: _journals.length,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      SizedBox(height: 8,),
                      InkWell(
                        onTap: (){
                          final journal = _journals[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ShowPage(journal)),);
                        },
                        child:Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            height: 88,
                            width: 1000,
                            decoration: BoxDecoration(
                              color: Colors.white60,
                              border: Border.all(color: Colors.orange, width: 1),
                              borderRadius: BorderRadius.circular(4),
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Text(_journals[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),overflow: TextOverflow.ellipsis,),
                                      SizedBox(height: 4,),
                                      Row(
                                          children: [
                                            Icon(Icons.location_on,size: 14,color: Colors.orange,),
                                            Text(' '),
                                            Flexible(child: Text(_journals[index]['station'], overflow: TextOverflow.ellipsis,maxLines: 1),
                                            ),
                                          ],
                                        ),


                                      Row(
                                        children: [
                                          Icon(Icons.dining,size: 14,color: Colors.orange,),
                                          Text(' '),
                                          Flexible(child: Text(_journals[index]['genre'],overflow: TextOverflow.ellipsis,),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),



                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        _showForm(_journals[index]['id']);
                                      },

                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () => _deleteItem(_journals[index]['id']),
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                      ),
                    ],
                  );

                },
              )
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                SizedBox(
                  width: 320,
                  child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: (){


                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) =>  DetailPage()),);
                      // print('d');
                      _showForm(null);
                    },
                    child: Text('行きたいお店を追加する'),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


