import 'package:flutter/material.dart';
import 'package:restapi/model/user.dart';
import 'package:restapi/services/user_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


@override
void initState(){
  super.initState();
  fetchusers();
}

  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API',),
        centerTitle: true,
        backgroundColor: Colors.blue
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
        final user = users[index];
        return
            Padding(
              padding: const EdgeInsets.only(top:5, left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 210, 142, 142)),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(3),
                child: ListTile(
                  leading: CircleAvatar(
                 backgroundImage: NetworkImage(user.picture.large),
                  ),
                  title: Text(user.fullName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gender: ${user.gender}'),
                      Text('Email: ${user.email}'),
                      Text('Phone: ${user.phone}'),
                      Text('Cell: ${user.cell}'),
                      Text('Nationality: ${user.nat}'),
                      Text('Date of Birth: ${user.dob}'),
                      Text('Location: ${user.location.city}, ${user.location.state}, ${user.location.country}'),
                    ],
                  ),
                        ),
              ),
            );
      }),
      
    );
  }


  Future<void> fetchusers()  async{
  final response = await UserApi.fetchUsers();

  setState(() {
    users = response;
  });
}
}


