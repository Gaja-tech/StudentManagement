package com.example.demo.controller;

import com.example.demo.entity.Attendance;
import com.example.demo.entity.Student;
import com.example.demo.repository.AttendanceRepository;
import com.example.demo.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/attendance")
public class AttendanceController {

    @Autowired
    private StudentRepository studentRepo;

    @Autowired
    private AttendanceRepository attendanceRepo;

    // Mark attendance for a student
    @PostMapping("/{studentId}")
    public Attendance markAttendance(@PathVariable Long studentId, @RequestBody Attendance attendance) {
        Optional<Student> studentOpt = studentRepo.findById(studentId);
        if (studentOpt.isPresent()) {
            attendance.setStudent(studentOpt.get());
            return attendanceRepo.save(attendance);
        } else {
            throw new RuntimeException("Student not found");
        }
    }

    // Get all attendance records
    @GetMapping
    public List<Attendance> getAllAttendance() {
        return attendanceRepo.findAll();
    }
}
