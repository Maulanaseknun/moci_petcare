import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moci_petcare/src/constants/data/list_data.dart';
import 'package:moci_petcare/src/features/pemesanan/domain/pemesanan.dart';
import 'package:moci_petcare/src/utils/extension/string_extension.dart';

import '../../../../constants/constants.dart';

class PemesananDetailWidget extends StatelessWidget {
  final Pemesanan pemesanan;
  const PemesananDetailWidget({super.key, required this.pemesanan});

  @override
  Widget build(BuildContext context) {
    const listTambahanGrooming = ListData.listPemesananGrooming;
    const listTambahanKesehatan = ListData.listPemesananKesehatan;
    const listTambahanKonsultasi = ListData.listPemesananKonsultasi;

    return ListView(
      children: [
        Gap.h12,
        TitleAndValue(
          title: "Nama :".toUpperCase(),
          value: pemesanan.namaHewan.toUpperCase(),
        ),
        const Divider(
          color: ColorApp.purpleBlue,
        ),
        TitleAndValue(
          title: "Umur :".toUpperCase(),
          value: pemesanan.umurHewan.toUpperCase(),
        ),
        const Divider(
          color: ColorApp.purpleBlue,
        ),
        TitleAndValue(
          title: "Jenis Kelamin :".toUpperCase(),
          value: pemesanan.jenisKelaminHewan.toUpperCase(),
        ),
        const Divider(
          color: ColorApp.purpleBlue,
        ),
        TitleAndValue(
          title: "Kategori :".toUpperCase(),
          value: pemesanan.kategoriHewan.toUpperCase(),
        ),
        const Divider(
          color: ColorApp.purpleBlue,
        ),
        TitleAndValue(
          title: "Jenis Layanan :".toUpperCase(),
          value: pemesanan.jenisLayanan.toUpperCase(),
        ),
        const Divider(
          color: ColorApp.purpleBlue,
        ),
        TitleAndValue(
          title: "Tanggal :".toUpperCase(),
          value: "${pemesanan.tanggal}\nJam ${pemesanan.jam.displayJam}"
              .toUpperCase(),
        ),
        const Divider(
          color: ColorApp.purpleBlue,
        ),
        if (pemesanan.keluhan.trim() != '' || pemesanan.keluhan == "-") ...[
          TitleAndValue(
            title: "Keluhan :".toUpperCase(),
            value: pemesanan.keluhan.toUpperCase(),
          ),
          const Divider(
            color: ColorApp.purpleBlue,
          ),
        ],
        if (pemesanan.hasilKonsultasi.trim() != '' ||
            pemesanan.hasilKonsultasi == "-") ...[
          TitleAndValue(
            title: "Hasil Keluhan :".toUpperCase(),
            value: pemesanan.hasilKonsultasi.toUpperCase(),
          ),
          const Divider(
            color: ColorApp.purpleBlue,
          ),
        ],
        Gap.h12,
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Tambahan Pemesanan : ",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(
          color: ColorApp.purpleBlue,
        ),
        if (pemesanan.jenisLayanan.toUpperCase() == "GROOMING")
          for (var tambahan in listTambahanGrooming)
            ExpansionTile(
              title: Text(tambahan),
              trailing: const Icon(Icons.add),
              // children: [],
            ),
        if (pemesanan.jenisLayanan.toUpperCase() == "Kesehatan".toUpperCase())
          for (var tambahan in listTambahanKesehatan)
            ExpansionTile(
              title: Text(tambahan),
              trailing: const Icon(Icons.add),
              // children: [],
            ),
        if (pemesanan.jenisLayanan.toUpperCase() == "KONSULTASI")
          for (var tambahan in listTambahanKonsultasi)
            ExpansionTile(
              title: Text(tambahan),
              trailing: const Icon(Icons.add),
              // children: [],
            ),
      ],
    );
  }
}

class TitleAndValue extends StatelessWidget {
  const TitleAndValue({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: TypographyTheme.body2.copyWith(
                color: ColorApp.purpleDark,
                fontWeight: FontWeight.w500, // Color Primary,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              value,
              style: TypographyTheme.body2.copyWith(
                color: ColorApp.purpleDark,
                fontWeight: FontWeight.w600, // Color Primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
