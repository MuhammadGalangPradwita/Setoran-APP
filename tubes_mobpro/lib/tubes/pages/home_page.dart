import 'package:flutter/material.dart';
import 'package:tubes_mobpro/tubes/pages/notification_page.dart';
import 'package:tubes_mobpro/tubes/pages/search_result_page.dart';
import 'package:tubes_mobpro/tubes/services/motor.dart';
import 'package:tubes_mobpro/tubes/services/motor_service.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeContent();
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: const HomeBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning,',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'Michael',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert_rounded),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotificationPage()),
            );
          },
        ),
      ],
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchSection(),
            SizedBox(height: 24),
            RecommendationSection(),
            SizedBox(height: 24),
            VoucherSection(),
            SizedBox(height: 24),
            MostPopularSection(),
            SizedBox(height: 24),
            DiscountSection(),
            SizedBox(height: 24),
            LastViewedSection(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

enum MotorType { Matic, Manual }

List<String> models = [''];

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  _SearchSectionState createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  MotorType? _selectedTransmission;
  DateTimeRange? _selectedDateRange;
  final String _selectedModel = 'Search the models';
  List<String> models = [];
  int index = 0;

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
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Rental Period'),
          GestureDetector(
            onTap: _showDateRangePicker,
            child: _buildSearchField(
                _getDateRangeText(), Icons.calendar_month_rounded),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              onChanged: () {
                Form.of(primaryFocus!.context!)!.save();
                if (Form.of(primaryFocus!.context!) != null) {
                  Form.of(primaryFocus!.context!)!.save();
                }
              },
              child: const Column(
                children: [
                  // TextFormField(
                  //   onSaved: (String? value) {
                  //     if (value != null) {
                  //       setState(() {
                  //         models.add(value);
                  //       });
                  //     }
                  //   },
                  // ),
                  TextfieldWidget(hintText: "models"),
                ],
              ),
            ),
          ),
          const Text('Models'),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SearchResultPage()),
              );
            },
            child: _buildSearchField(_selectedModel, Icons.motorcycle),
          ),
          const SizedBox(height: 12),
          const Text('Transmission'),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: const Text('Matic'),
                  leading: Radio<MotorType>(
                    value: MotorType.Matic,
                    groupValue: _selectedTransmission,
                    onChanged: (MotorType? value) {
                      setState(() {
                        _selectedTransmission = value;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Manual'),
                  titleTextStyle:
                      const TextStyle(fontSize: 12, color: Colors.black),
                  leading: Radio<MotorType>(
                    value: MotorType.Manual,
                    groupValue: _selectedTransmission,
                    onChanged: (MotorType? value) {
                      setState(() {
                        _selectedTransmission = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField(String hint, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 12),
          Text(
            hint,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommendation',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MotorcycleCard(name: 'BeAT', price: 30000),
              SizedBox(width: 16),
              MotorcycleCard(name: 'NMAX', price: 50000),
            ],
          ),
        ),
      ],
    );
  }
}

class VoucherSection extends StatelessWidget {
  const VoucherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Member',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'SALE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              '60% OFF',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most Popular',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: MotorcycleCard(name: 'BeAT', price: 30000)),
            SizedBox(width: 16),
            Expanded(child: MotorcycleCard(name: 'NMAX', price: 50000)),
          ],
        ),
      ],
    );
  }
}

class DiscountSection extends StatefulWidget {
  const DiscountSection({super.key});

  @override
  State<DiscountSection> createState() => _DiscountSectionState();
}

class _DiscountSectionState extends State<DiscountSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: MotorService().fetchAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No motors available'));
        } else {
          final motors = snapshot.data!;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: motors.length,
            itemBuilder: (context, index) {
              final Motor motor = motors[index];
              return MotorcycleCard(
                name: motor.model, // Use model as the name
                price: (motor.hargaHarian).toInt(), // Convert price
              );
            },
          );
        }
      },
    );
  }
}

class LastViewedSection extends StatelessWidget {
  const LastViewedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Last Viewed',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        MotorcycleCard(name: 'BeAT', price: 30000),
      ],
    );
  }
}

class MotorcycleCard extends StatelessWidget {
  final String name;
  final int price;

  const MotorcycleCard({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
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
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(
                Icons.motorcycle,
                size: 48,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Transmission: Matic',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rp ${price.toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.amber,
                  ),
                  Text('4.8'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
