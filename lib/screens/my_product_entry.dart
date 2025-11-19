import 'package:flutter/material.dart';
import 'package:naiki_station/models/product_entry.dart';
import 'package:naiki_station/widgets/left_drawer.dart';
import 'package:naiki_station/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:naiki_station/screens/product_detail.dart';

class MyProductEntryPage extends StatefulWidget {
  const MyProductEntryPage({super.key});

  @override
  State<MyProductEntryPage> createState() => _MyProductEntryPageState();
}

class _MyProductEntryPageState extends State<MyProductEntryPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // Sesuaikan URL dengan environment Anda (localhost untuk Windows/Web, 10.0.2.2 untuk Android Emulator)
    // Pastikan endpoint ini benar
    final response = await request.get('http://localhost:8000/api/products/?filter=my');

    // // Debugging: Cek apa yang dikembalikan backend di konsol
    // print("Response API: $response");

    var data = response['data'];

    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          // 1. Cek apakah masih loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Cek apakah ada error saat fetch data
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Terjadi kesalahan: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // 3. Cek apakah data tidak ada atau list kosong
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Belum ada produk yang Anda buat.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            );
          }

          // 4. Jika data ada, tampilkan ListView
          else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => ProductEntryCard(
                product: snapshot.data![index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: snapshot.data![index],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}