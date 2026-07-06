import 'package:flutter/material.dart';

class WeatherDemoPage extends StatelessWidget {
  const WeatherDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ผลการทดลอง Prompt (3.4)'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🧪 การเปรียบเทียบผลลัพธ์จาก AI Prompting',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'การทดลองเขียน Flutter Widget แสดงสภาพอากาศ (Weather Card) ด้วย StatelessWidget ระหว่างคำสั่งแบบ Simple และ Detailed',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // 1. Simple Prompt Section
            _buildSectionHeader(
              '1. ผลลัพธ์จาก Simple Prompt',
              '“ช่วยเขียน Flutter Widget สำหรับแสดงสภาพอากาศ (Weather Card) ด้วย StatelessWidget ให้หน่อย”',
              Colors.orange,
            ),
            const SizedBox(height: 12),
            const Center(child: SimpleWeatherCard()),
            const SizedBox(height: 8),
            const Text(
              '💡 ข้อสังเกต: ดีไซน์ธรรมดา โครงสร้างโค้ดแบบกลางๆ ไม่ได้กำหนดตัวแปรรับค่าเฉพาะเจาะจง ต้องนำมาปรับแก้ต่ออีกมาก',
              style: TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 32),

            // 2. Detailed Prompt Section
            _buildSectionHeader(
              '2. ผลลัพธ์จาก Detailed Prompt',
              'ระบุชื่อ Widget (WeatherCard), รับค่าตัวแปร city/temp/condition/humidity, เปลี่ยนไอคอนตามเงื่อนไข และตกแต่ง UI แบบ Premium (Gradient, Shadow, Radius 25, Translucent Container)',
              Colors.blue.shade700,
            ),
            const SizedBox(height: 12),
            const DetailedWeatherCard(
              city: 'กรุงเทพมหานคร',
              temperature: 32.5,
              condition: 'sunny',
              humidity: 65,
            ),
            const SizedBox(height: 16),
            const DetailedWeatherCard(
              city: 'เชียงใหม่',
              temperature: 24.0,
              condition: 'rainy',
              humidity: 85,
            ),
            const SizedBox(height: 8),
            const Text(
              '💡 ข้อสังเกต: ดีไซน์สวยงามระดับ Premium ตัวแปรและเงื่อนไขครบถ้วน สามารถนำโค้ดไปประกอบใช้ในโปรเจกต์ได้ทันที',
              style: TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border(left: BorderSide(color: color, width: 4)),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

/// Widget สภาพอากาศจาก Simple Prompt
class SimpleWeatherCard extends StatelessWidget {
  const SimpleWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.wb_sunny, size: 48, color: Colors.orange),
            SizedBox(height: 8),
            Text(
              'กรุงเทพมหานคร',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('32°C', style: TextStyle(fontSize: 32)),
            Text(
              'ท้องฟ้าแจ่มใส',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget สภาพอากาศจาก Detailed Prompt
class DetailedWeatherCard extends StatelessWidget {
  final String city;
  final double temperature;
  final String condition; // 'sunny', 'cloudy', 'rainy'
  final int humidity;

  const DetailedWeatherCard({
    super.key,
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
  });

  IconData _getWeatherIcon() {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return Icons.wb_sunny;
      case 'cloudy':
        return Icons.cloud;
      case 'rainy':
        return Icons.water_drop;
      default:
        return Icons.wb_sunny;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.blue.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(_getWeatherIcon(), size: 48, color: Colors.amber),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '${temperature.toStringAsFixed(0)}°C',
              style: const TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              condition == 'sunny'
                  ? 'ท้องฟ้าแจ่มใส (Sunny)'
                  : condition == 'cloudy'
                  ? 'มีเมฆมาก (Cloudy)'
                  : 'ฝนตก (Rainy)',
              style: const TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.water_drop, color: Colors.lightBlueAccent),
                  const SizedBox(width: 8),
                  Text(
                    'ความชื้น: $humidity%',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
