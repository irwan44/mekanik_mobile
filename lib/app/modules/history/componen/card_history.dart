import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mekanik/app/componen/color.dart';
import '../../../data/data_endpoint/history.dart';
import 'detail_sheet.dart';

class HistoryList extends StatelessWidget {
  final DataHistory items;
  final VoidCallback onTap;

  const HistoryList({Key? key, required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color statusColor = StatusColor.getColor(items.status ?? '');

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tipe Service
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tipe Service'),
                    Text(
                      items.tipeSvc ?? "-",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // Status
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        items.status.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(color: Colors.grey),
            // Menampilkan tanggal-tanggal dengan GridView
            _buildDateGrid(context),
            const SizedBox(height: 10),
            // Pelanggan dan Kode Estimasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Pelanggan'),
                    Text(
                      items.nama ?? "-",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Kode estimasi'),
                    Text(
                      items.kodeEstimasi.toString(),
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            // PIC Estimasi
            const Text('PIC Estimasi'),
            Text(
              items.createdBy ?? "-",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // Helper function untuk membuat grid tanggal
  Widget _buildDateGrid(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount = width > 600 ? 12 : 4; // Menyesuaikan jumlah kolom berdasarkan lebar layar

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 10,
      mainAxisSpacing: 9,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildDateContainer('Tgl Estimasi', items.tglEstimasi ?? 'Tgl Estimasi', context),
        _buildDateContainer('Tgl PKB', items.tglPkb ?? 'Tgl PKB Tidak ada', context),
        _buildDateContainerblue('Tgl Kembali', items.tglKembali ?? 'Tgl Kembali Tidak ada', context),
        _buildDateContainergreen('Tgl Keluar', items.tglKeluar ?? 'Tgl Keluar Tidak ada', context),
        _buildDateContainerred('Tgl Tutup', items.tglTutup ?? 'Tgl Tutup Tidak ada', context),
      ],
    );
  }

  // Helper function untuk membuat kontainer tanggal
  Widget _buildDateContainer(String label, String value, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double containerHeight;

    // Menyesuaikan tinggi kontainer berdasarkan lebar layar
    if (width < 600) {
      // Untuk mobile, beri tinggi lebih besar agar terlihat lebih jelas
      containerHeight = 100;
    } else {
      // Untuk tablet/desktop, beri tinggi lebih kecil
      containerHeight = 20;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      height: containerHeight, // Menyesuaikan height berdasarkan device
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centerkan konten di dalam container
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
Widget _buildDateContainerblue(String label, String value, BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double containerHeight;

  // Menyesuaikan tinggi kontainer berdasarkan lebar layar
  if (width < 600) {
    // Untuk mobile, beri tinggi lebih besar agar terlihat lebih jelas
    containerHeight = 100;
  } else {
    // Untuk tablet/desktop, beri tinggi lebih kecil
    containerHeight = 20;
  }

  return Container(
    padding: const EdgeInsets.all(10),
    height: containerHeight, // Menyesuaikan height berdasarkan device
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, // Centerkan konten di dalam container
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),
        ),
      ],
    ),
  );
}
Widget _buildDateContainerred(String label, String value, BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double containerHeight;

  // Menyesuaikan tinggi kontainer berdasarkan lebar layar
  if (width < 600) {
    // Untuk mobile, beri tinggi lebih besar agar terlihat lebih jelas
    containerHeight = 100;
  } else {
    // Untuk tablet/desktop, beri tinggi lebih kecil
    containerHeight = 20;
  }

  return Container(
    padding: const EdgeInsets.all(10),
    height: containerHeight, // Menyesuaikan height berdasarkan device
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, // Centerkan konten di dalam container
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),
        ),
      ],
    ),
  );
}
Widget _buildDateContainergreen(String label, String value, BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double containerHeight;

  // Menyesuaikan tinggi kontainer berdasarkan lebar layar
  if (width < 600) {
    // Untuk mobile, beri tinggi lebih besar agar terlihat lebih jelas
    containerHeight = 100;
  } else {
    // Untuk tablet/desktop, beri tinggi lebih kecil
    containerHeight = 20;
  }

  return Container(
    padding: const EdgeInsets.all(10),
    height: containerHeight, // Menyesuaikan height berdasarkan device
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, // Centerkan konten di dalam container
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),
        ),
      ],
    ),
  );
}

class StatusColor {
  static Color getColor(String status) {
    switch (status.toLowerCase()) {
      case 'diproses':
        return Colors.orange;
      case 'estimasi':
        return Colors.lime;
      case 'dikerjakan':
        return Colors.orange;
      case 'invoice':
        return Colors.blue;
      case 'pkb':
        return Colors.green;
      case 'ditolak':
        return Colors.red;
      case 'selesai dikerjakan':
        return Colors.green;
      default:
        return Colors.transparent;
    }
  }
}
