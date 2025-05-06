import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  final String doctorId;
  final String doctorName;
  final String specialty;
  final String location;
  final double consultingFee;

  const BookingPage({
    super.key,
    required this.doctorId,
    required this.doctorName,
    required this.specialty,
    required this.location,
    required this.consultingFee,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Book Now'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DoctorInfoSection(
              doctorName: doctorName,
              specialty: specialty,
              location: location,
              consultingFee: consultingFee,
            ),
            const _DateSelectionSection(),
            const _TimeSlotSection(),
            const _TermsSection(),
          ],
        ),
      ),
      bottomNavigationBar: _ProceedButton(doctorId: doctorId),
    );
  }
}

class _DoctorInfoSection extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String location;
  final double consultingFee;

  const _DoctorInfoSection({
    required this.doctorName,
    required this.specialty,
    required this.location,
    required this.consultingFee,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doctorName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(specialty),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16),
              const SizedBox(width: 4),
              Text(location),
            ],
          ),
          const SizedBox(height: 4),
          Text('Consulting Fee: ₹$consultingFee'),
        ],
      ),
    );
  }
}

class _DateSelectionSection extends StatelessWidget {
  const _DateSelectionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Choose A Date',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 7,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _DateCard(
                  isSelected: index == 0,
                  date: DateTime.now().add(Duration(days: index)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _DateCard extends StatelessWidget {
  final bool isSelected;
  final DateTime date;

  const _DateCard({required this.isSelected, required this.date});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? Colors.blue : Colors.blue.shade100,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          // Handle date selection
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _getDayName(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 12,
                ),
              ),
              Text(
                date.day.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDayName() {
    switch (date.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }
}

class _TimeSlotSection extends StatelessWidget {
  const _TimeSlotSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '9 Slots Available',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            '4 PM - 6 PM',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return _TimeSlotCard(
                time: DateTime(2023, 1, 1, 16, index * 15),
                isSelected: index == 0,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TimeSlotCard extends StatelessWidget {
  final DateTime time;
  final bool isSelected;

  const _TimeSlotCard({required this.time, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? Colors.blue : Colors.blue.shade100,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          // Handle time slot selection
        },
        borderRadius: BorderRadius.circular(8),
        child: Center(
          child: Text(
            '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

class _TermsSection extends StatelessWidget {
  const _TermsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Terms And Conditions',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'The Document Governing The Contractual Relationship Between The Provider Of A Service And Its User. On The Web, This Document Is Often Also Called "Terms Of Service" (ToS).',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {
                  // Handle terms acceptance
                },
              ),
              Expanded(
                child: Text(
                  'Share All Previous Medicals Files With The Doctor',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProceedButton extends StatelessWidget {
  final String doctorId;

  const _ProceedButton({required this.doctorId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle booking confirmation
        },
        style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
        child: const Text('Proceed'),
      ),
    );
  }
}
