import 'package:flutter/material.dart';

class PhotosCard extends StatefulWidget {
  const PhotosCard({Key? key}) : super(key: key);

  @override
  _PhotosCardState createState() => _PhotosCardState();
}

class _PhotosCardState extends State<PhotosCard> {
  Map<int, List<String>> _lista = {
    1: ['Titulo', 'Descricao', 'Hora', 'Path da img', 'latitude', 'longitude']
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.all(20.0),
              elevation: 5.0,
              child: InkWell(
                onTap: () => {},
                child: Column(
                  children: [
                    Image.network(
                        'https://media.discordapp.net/attachments/638159401873702932/867158964781187123/unknown.png'),
                    ListTile(
                      title: const Text('Titulo da foto'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              ));
        },
        itemCount: 10);
  }
}




// ButtonBar(
//                 alignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Colors.blue),
//                         foregroundColor:
//                             MaterialStateProperty.all<Color>(Colors.white)),
//                     onPressed: () {
//                       // Perform some action
//                     },
//                     child: const Text('Remover'),
//                   ),
//                 ],
//               )