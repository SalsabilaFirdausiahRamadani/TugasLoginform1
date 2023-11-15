import 'package:flutter/material.dart';

class ListDataPage extends StatefulWidget {
  @override
  _ListDataPageState createState() => _ListDataPageState();
}

class _ListDataPageState extends State<ListDataPage> {
  final List<Map<String, String>> barang = [
    {
      'title': 'LipStick',
      'harga': 'Rp. 70.000',
    },
    {
      'title': 'LipMatte',
      'harga': 'Rp. 89.000',
    },
    {
      'title': 'LipBalm',
      'harga': 'Rp. 39.000',
    },
    {
      'title': 'LipSemimatte',
      'harga': 'Rp. 54.000',
    },
    {
      'title': 'LipLiner',
      'harga': 'Rp. 67.000',
    },
    {
      'title': 'LipCrayon',
      'harga': 'Rp. 77.000',
    },
    {
      'title': 'LipCream',
      'harga': 'Rp. 70.000',
    },
    {
      'title': 'LipTint',
      'harga': 'Rp. 55.000',
    },
    {
      'title': 'LipGloss',
      'harga': 'Rp. 59.000',
    },
    {
      'title': 'LipOil',
      'harga': 'Rp. 49.000',
    },

    // Add more barang as needed
  ];

  // Function to show a delete confirmation dialog
  Future<void> showDeleteConfirmationDialog(int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Product'),
          content: Text('Are you sure you want to delete this Product?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // Perform the delete operation
                setState(() {
                  barang.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Product List',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(237, 255, 49, 0),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Tambahkan logika pencarian di sini
              // Misalnya, munculkan dialog pencarian atau navigasi ke halaman pencarian
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Search',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 24,
                      ),),
                    content: TextField(
                      // Tambahkan controller atau logika pencarian
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel',
                          style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(237, 255, 49, 0),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Logika pencarian
                          Navigator.of(context).pop();
                        },
                        child: Text('Search',
                          style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontSize: 15),),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(237, 255, 49, 0),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(237, 255, 49, 0,),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shop With Me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Product List'),
              onTap: () {
                Navigator.pop(context);
                // Ganti sesuai kebutuhan, misalnya: Navigator.pushNamed(context, '/list_barang');
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),

      body: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: barang.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              contentPadding: EdgeInsets.all(6),
              title: Text(
                '${index + 1}. ${barang[index]['title']}',
                style: TextStyle(fontSize:14, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Price: \$${barang[index]['harga']}', style: TextStyle(fontSize: 12)),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  showDeleteConfirmationDialog(index);
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailFilmPage(
                      filmTitle: barang[index]['title']!,
                      description: barang[index]['description']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFilmPage(),
            ),
          );

          // Check if a new film was added
          if (result != null && result is Map<String, String>) {
            setState(() {
              barang.add(result);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(237, 255, 49, 0),
      ),
    );
  }
}

class AddFilmPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: const Color.fromARGB(237, 255, 49, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'title'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _ratingController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Validate and save the new film data
                if (_titleController.text.isNotEmpty &&
                    _ratingController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty) {
                  Navigator.pop(
                    context,
                    {
                      'title': _titleController.text,
                      'harga': _ratingController
                          .text, // Use 'harga' instead of 'Price'
                      'description': _descriptionController.text,
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please fill in all fields.'),
                        actions: [
                          TextButton(

                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Add Product'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(237, 255, 49, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailFilmPage extends StatelessWidget {
  final String filmTitle;
  final String description; // Tambahkan variabel description

  DetailFilmPage({
    required this.filmTitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
        backgroundColor: const Color.fromARGB(237, 255, 49, 0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Product Name: $filmTitle',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Deskripsi: $description', // Tampilkan deskripsi di sini
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}