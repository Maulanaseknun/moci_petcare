import '../data/response/pemesanan_response.dart';
import '/src/services/remote/config/config.dart';

import '../../../utils/extension/string_extension.dart';
import '../domain/pemesanan.dart';

class PemesananMapper {
  PemesananMapper._();

  static Result<Pemesanan> mapToPemesanan(Result<PemesananResponse> response) {
    return response.when(
      success: (data) {
        return Result.success(
          Pemesanan(
            id: data.id.toEmpty,
            tanggal: data.tanggal.toEmpty,
            jam: data.jam.toEmpty,
            jenisKelaminHewan: data.jenisKelaminHewan.toEmpty,
            jenisLayanan: data.jenisLayanan.toEmpty,
            kategoriHewan: data.kategoriHewan.toEmpty,
            keluhan: data.keluhan.toEmpty,
            hasilKonsultasi: data.hasilKonsultasi.toEmpty,
            namaHewan: data.namaHewan.toEmpty,
            status: data.status.toEmpty,
            umurHewan: data.umurHewan.toEmpty,
          ),
        );
      },
      failure: (error, stacktrace) {
        return Result.failure(error, stacktrace);
      },
    );
  }

  static Result<ListPemesanan> mapToListPemesanan(
      Result<ListPemesananResponse> response) {
    return response.when(
      success: (data) {
        final list = (data.list ?? [])
            .map(
              (e) => Pemesanan(
                id: e.id.toEmpty,
                jenisLayanan: e.jenisLayanan.toEmpty,
                namaHewan: e.namaHewan.toEmpty,
                kategoriHewan: e.kategoriHewan.toEmpty,
                umurHewan: e.umurHewan.toEmpty,
                jenisKelaminHewan: e.jenisKelaminHewan.toEmpty,
                keluhan: e.keluhan.toEmpty,
                hasilKonsultasi: e.hasilKonsultasi.toEmpty,
                tanggal: e.tanggal.toEmpty,
                jam: e.jam.toEmpty,
                status: e.status.toEmpty,
              ),
            )
            .toList();
        return Result.success(
          ListPemesanan(values: list),
        );
      },
      failure: (error, stacktrace) {
        return Result.failure(error, stacktrace);
      },
    );
  }
}
