

// class SearchSection extends StatefulWidget {
//   const SearchSection({super.key});

//   @override
//   _SearchSectionState createState() => _SearchSectionState();
// }

// enum MotorType { Matic, Manual }
// List<String> models=[
//   ''
// ];

import 'package:flutter/material.dart';

class DateRangeSection extends StatefulWidget {
  const DateRangeSection({super.key});

  @override
  _DateRangeSectionState createState() => _DateRangeSectionState();
}

class _DateRangeSectionState extends State<DateRangeSection> {
  DateTimeRange? _selectedDateRange;

  // Menampilkan Date Range Picker
  Future<void> _showDateRangePicker() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            colorScheme: const ColorScheme.light(primary: Colors.blue),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    // Jika user memilih rentang tanggal, simpan nilai rentang tersebut
    if (picked != null) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  // Mendapatkan teks untuk menampilkan rentang tanggal yang dipilih
  String _getDateRangeText() {
    if (_selectedDateRange == null) {
      return 'Select rental dates';
    }
    return '${_selectedDateRange!.start.day}/${_selectedDateRange!.start.month} - ${_selectedDateRange!.end.day}/${_selectedDateRange!.end.month}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Rental Period'),  // Judul
          GestureDetector(
            onTap: _showDateRangePicker,  // Tampilkan DateRangePicker saat diklik
            child: TextfieldWidget(
              label: 'Select Date',
              prefixIcon: const Icon(Icons.date_range_rounded),
              hintText: _getDateRangeText(),
            ),
          ),
        ],
      ),
    );
  }
}

// TextfieldWidget untuk digunakan dalam tampilan
class TextfieldWidget extends StatelessWidget {
  final String label;
  final Icon prefixIcon;
  final String hintText;

  const TextfieldWidget({
    Key? key,
    required this.label,
    required this.prefixIcon,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true, // Membuat field ini hanya bisa dibaca, tidak bisa diubah langsung
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
