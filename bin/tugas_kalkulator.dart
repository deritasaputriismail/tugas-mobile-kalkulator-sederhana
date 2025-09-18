import 'dart:io';
import 'dart:math' as math;

double add(double a, double b) => a + b;
double subtract(double a, double b) => a - b;
double multiply(double a, double b) => a * b;

double divide(double a, double b) {
  if (b == 0) throw ArgumentError('Pembagian dengan nol tidak diperbolehkan.');
  return a / b;
}

double power(double a, double b) => a == 0 && b == 0
    ? double.nan
    : a == 0
        ? 0
        : a == 1
            ? 1
            : double.parse(a.toString()) == a
                ? powInt(a, b)
                : mathPow(a, b);

double mathPow(double a, double b) => math.pow(a, b).toDouble();

double powInt(double a, double b) => math.pow(a, b).toDouble();

double modulus(double a, double b) {
  if (b == 0) throw ArgumentError('Modulo dengan nol tidak diperbolehkan.');
  return a % b;
}

String readLine() {
  final line = stdin.readLineSync();
  if (line == null) {
    stdout.writeln('\nInput EOF, keluar.');
    exit(0);
  }
  return line.trim();
}

double? readNumber(String prompt) {
  while (true) {
    stdout.write(prompt);
    final input = readLine();
    final value = double.tryParse(input);
    if (value != null) return value;
    stdout.writeln('Input tidak valid. Masukkan angka (mis. 12 atau 3.14).');
  }
}

void showMenu() {
  stdout.writeln('\n=== KALKULATOR DART ===');
  stdout.writeln('1) Tambah (a + b)');
  stdout.writeln('2) Kurang (a - b)');
  stdout.writeln('3) Kali (a * b)');
  stdout.writeln('4) Bagi (a / b)');
  stdout.writeln('5) Pangkat (a ^ b)');
  stdout.writeln('6) Modulus (a % b)');
  stdout.writeln('7) Keluar');
}

void main() {
  while (true) {
    showMenu();
    stdout.write('\nPilih operasi (1-7): ');
    final choice = readLine();

    try {
      switch (choice) {
        case '1':
          final a = readNumber('Masukkan angka pertama: ');
          final b = readNumber('Masukkan angka kedua: ');
          stdout.writeln('Hasil: ${add(a!, b!)}');
          break;
        case '2':
          final a = readNumber('Masukkan angka pertama: ');
          final b = readNumber('Masukkan angka kedua: ');
          stdout.writeln('Hasil: ${subtract(a!, b!)}');
          break;
        case '3':
          final a = readNumber('Masukkan angka pertama: ');
          final b = readNumber('Masukkan angka kedua: ');
          stdout.writeln('Hasil: ${multiply(a!, b!)}');
          break;
        case '4':
          final a = readNumber('Masukkan angka pertama: ');
          final b = readNumber('Masukkan angka kedua: ');
          try {
            stdout.writeln('Hasil: ${divide(a!, b!)}');
          } catch (e) {
            stdout.writeln('Error: ${e}');
          }
          break;
        case '5':
          final a = readNumber('Masukkan basis (a): ');
          final b = readNumber('Masukkan eksponen (b): ');
          stdout.writeln('Hasil: ${mathPow(a!, b!)}');
          break;
        case '6':
          final a = readNumber('Masukkan angka pertama: ');
          final b = readNumber('Masukkan angka kedua: ');
          try {
            stdout.writeln('Hasil: ${modulus(a!, b!)}');
          } catch (e) {
            stdout.writeln('Error: ${e}');
          }
          break;
        case '7':
          stdout.writeln('Keluar. Terima kasih!');
          return;
        default:
          stdout.writeln('Pilihan tidak dikenali. Silakan pilih 1 sampai 7.');
      }
    } catch (e) {
      stdout.writeln('Terjadi error: $e');
    }
  }
}
