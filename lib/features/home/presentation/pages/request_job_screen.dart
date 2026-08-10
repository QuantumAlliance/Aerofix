import 'dart:io';
import 'package:aerofix/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../../../core/base/appText.dart';
import '../../../../core/base/custom_app_bar.dart';
import '../../../../core/base/custom_app_button.dart';
import '../../../../core/base/custom_text_field.dart';
import '../../../../core/utils/app_colors.dart';

class RequestJobScreen extends StatefulWidget {
  const RequestJobScreen({super.key});

  @override
  State<RequestJobScreen> createState() => _RequestJobScreenState();
}

class JobDate {
  final DateTime date;
  final String time;
  JobDate(this.date, this.time);
}

class MediaItem {
  final File file;
  final TextEditingController captionController;
  MediaItem(this.file, this.captionController);
}

class _RequestJobScreenState extends State<RequestJobScreen> {
  int _currentStep = 0;
  List<JobDate> _selectedDates = [];
  List<MediaItem> _selectedMedia = [];

  Future<void> _pickMedia(ImageSource source) async {
    final picker = ImagePicker();
    
    if (source == ImageSource.camera) {
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          _selectedMedia.add(MediaItem(File(image.path), TextEditingController()));
        });
      }
    } else {
      final List<XFile> images = await picker.pickMultiImage();
      if (images.isNotEmpty) {
        setState(() {
          for (var img in images) {
            _selectedMedia.add(MediaItem(File(img.path), TextEditingController()));
          }
        });
      }
    }
  }

  void _showImageSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag handle
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 24),
                
                ListTile(
                  leading: const Icon(Icons.camera_alt, color: Color(0xFF3B82F6)),
                  title: AppText("Take a Photo", fontSize: 16, fontWeight: FontWeight.w500, color: const Color(0xFF0F172A)),
                  onTap: () {
                    Navigator.pop(context);
                    _pickMedia(ImageSource.camera);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.photo_library, color: Color(0xFF3B82F6)),
                  title: AppText("Choose from Gallery", fontSize: 16, fontWeight: FontWeight.w500, color: const Color(0xFF0F172A)),
                  onTap: () {
                    Navigator.pop(context);
                    _pickMedia(ImageSource.gallery);
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Request Job",
        isTransparent: true,
        onBackTap: () {
          if (_currentStep == 1) {
            setState(() {
              _currentStep = 0;
            });
          } else {
            Get.back();
          }
        },
      ),
      body: Stack(
        children: [
          // Background Image (Top)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFCCFBF1),
                    Color(0x00CCFBF1),
                  ],
                ),
              ),
              child: Transform.scale(
                scale: 1.8,
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/dotedTopImg.png',
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(),
                ),
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: _currentStep == 0 ? _buildStep1() : _buildStep2(),
                  ),
                ),
                _buildBottomBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep1() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "When should we send someone?",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 16),
          
          // Date List
          ..._selectedDates.map((jobDate) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildDateItem(
                DateFormat('E d, yyyy').format(jobDate.date), 
                jobDate.time,
                onRemove: () {
                  setState(() {
                    _selectedDates.remove(jobDate);
                  });
                }
              ),
            );
          }),
          
          // Add Date Button
          GestureDetector(
            onTap: _showDatePickerBottomSheet,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.add, size: 20, color: Color(0xFF3B82F6)), // Blue add icon
                  const SizedBox(width: 8),
                  Expanded(
                    child: AppText(
                      "Add date",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF3B82F6),
                    ),
                  ), 
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          AppText(
            "Timing Constraints",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 12),
          CustomTextField(
            textEditingController: TextEditingController(),
            hintText: "I will be available 3:30 PM to 6:00PM",
            fillColor: Colors.white,
            hintStyle: const TextStyle(
              fontFamily: 'SfPro-Regular',
              fontSize: 14,
              color: Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem(String date, String time, {required VoidCallback onRemove}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today_outlined, size: 20, color: Color(0xFF64748B)),
          const SizedBox(width: 12),
          AppText(
            date,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(width: 4),
          AppText(
            "($time)",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF94A3B8),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onRemove,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Color(0xFF64748B),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, size: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep2() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "What do you need done?",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 12),
          
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Need something fixed, installed etc.",
              hintStyle: const TextStyle(
                fontFamily: 'SfPro-Regular',
                fontSize: 14,
                color: Color(0xFF94A3B8),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.mainAppColor),
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          Row(
            children: [
              const Icon(Icons.auto_awesome, color: Color(0xFF3B82F6), size: 18),
              const SizedBox(width: 8),
              AppText(
                "Feature headline",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F172A),
              ),
            ],
          ),
          const SizedBox(height: 8),
          AppText(
            "Description content experience a unified...",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF64748B),
          ),
          const SizedBox(height: 24),
          
          AppText(
            "Photo & Video",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
          const SizedBox(height: 12),
          
          ..._selectedMedia.map((media) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          media.file,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: -6,
                        right: -6,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedMedia.remove(media);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                            ),
                            child: const Icon(Icons.close, size: 12, color: Color(0xFF0F172A)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: media.captionController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: "Add a short caption (optional)",
                        hintStyle: const TextStyle(
                          fontFamily: 'SfPro-Regular',
                          fontSize: 12,
                          color: Color(0xFF94A3B8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppColors.mainAppColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          
          GestureDetector(
            onTap: _showImageSourceBottomSheet,
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE2E8F0), style: BorderStyle.solid),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_photo_alternate_outlined, size: 24, color: Color(0xFF64748B)),
                      SizedBox(height: 4),
                      Text("Add Photo", style: TextStyle(fontSize: 8, color: Color(0xFF64748B))),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                AppText(
                  "Upload Photos & Videos",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF3B82F6), // Blue text
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6), // Blue progress
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: _currentStep == 1 ? const Color(0xFF3B82F6) : const Color(0xFFE2E8F0), // Gray if not step 2
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomAppButton(
            text: "Continue",
            onTap: () {
              if (_currentStep == 0) {
                setState(() {
                  _currentStep = 1;
                });
              } else {
                Get.toNamed(AppRoutes.confirmJobDetailsScreen);
              }
            },
          ),
        ],
      ),
    );
  }

  void _showDatePickerBottomSheet() {
    int selectedPill = 1; // Afternoon
    DateTime focusedDay = DateTime.now();
    List<DateTime> tempSelectedDates = _selectedDates.map((e) => e.date).toList();
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Drag handle
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2E8F0),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Close button
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close, color: Color(0xFF0F172A)),
                      ),
                    ),
                    
                    // Table Calendar
                    TableCalendar(
                      firstDay: DateTime.now(), // Prevent past dates
                      lastDay: DateTime.now().add(const Duration(days: 365)),
                      focusedDay: focusedDay,
                      selectedDayPredicate: (day) {
                        return tempSelectedDates.any((d) => isSameDay(d, day));
                      },
                      onDaySelected: (selectedDay, newFocusedDay) {
                        setModalState(() {
                          focusedDay = newFocusedDay;
                          if (tempSelectedDates.any((d) => isSameDay(d, selectedDay))) {
                            tempSelectedDates.removeWhere((d) => isSameDay(d, selectedDay));
                          } else {
                            tempSelectedDates.add(selectedDay);
                          }
                        });
                      },
                      onPageChanged: (newFocusedDay) {
                        focusedDay = newFocusedDay;
                      },
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        leftChevronIcon: Icon(Icons.chevron_left, color: Color(0xFF64748B)),
                        rightChevronIcon: Icon(Icons.chevron_right, color: Color(0xFF0F172A)),
                        titleTextStyle: TextStyle(
                          fontFamily: 'SfPro-Regular',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      calendarStyle: CalendarStyle(
                        selectedDecoration: const BoxDecoration(
                          color: Color(0xFF93C5FD), // Light blue
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        todayDecoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFF93C5FD)),
                        ),
                        todayTextStyle: const TextStyle(
                          color: Color(0xFF0F172A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Info Box
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0F2FE), // Light blue
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: AppText(
                        "Job added with multiple dates get accepted by pros faster! Add or remove dates by tapping on them.",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Select all available times
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Select all available times",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    
                    Row(
                      children: [
                        _buildTimePill("Morning", selectedPill == 0, () => setModalState(() => selectedPill = 0)),
                        const SizedBox(width: 8),
                        _buildTimePill("Afternoon", selectedPill == 1, () => setModalState(() => selectedPill = 1)),
                        const SizedBox(width: 8),
                        _buildTimePill("Evening", selectedPill == 2, () => setModalState(() => selectedPill = 2)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Choose Dates Button
                    CustomAppButton(
                      text: "Choose Dates(${tempSelectedDates.length})",
                      onTap: () {
                        setState(() {
                          String timeStr = selectedPill == 0 ? "Mor" : (selectedPill == 1 ? "Aft" : "Eve");
                          
                          // Remove dates that were unselected in the sheet
                          _selectedDates.removeWhere((existing) => !tempSelectedDates.any((d) => isSameDay(d, existing.date)));
                          
                          // Add new dates with the currently selected time
                          for (var d in tempSelectedDates) {
                            if (!_selectedDates.any((existing) => isSameDay(existing.date, d))) {
                               _selectedDates.add(JobDate(d, timeStr));
                            }
                          }
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }

  Widget _buildTimePill(String text, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? const Color(0xFF10B981) : const Color(0xFFE2E8F0),
            ),
          ),
          alignment: Alignment.center,
          child: AppText(
            text,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF0F172A),
          ),
        ),
      ),
    );
  }

  // _buildDummyCalendar() has been removed in favor of table_calendar
}
