package com.example.demo.controller;

import com.example.demo.entity.Student;
import com.example.demo.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentRepository studentRepository;

    @GetMapping("/form")
    public String showStudentForm(Model model) {
        model.addAttribute("student", new Student());
        return "pages/index"; 
    }
   

    @PostMapping("/save")
    public String saveStudent(@ModelAttribute Student student) {
        studentRepository.save(student);
        return "redirect:/students/list"; 
    }

    // ✅ List all students
    @GetMapping("/list")
    public String listStudents(Model model) {
        List<Student> students = studentRepository.findAll();
        model.addAttribute("students", students);
        return "pages/student-list"; 
    }
    
    @GetMapping("/search")
    public String searchStudents(@RequestParam String keyword, Model model) {
        List<Student> students = studentRepository.findByNameContainingIgnoreCaseOrDepartmentContainingIgnoreCase(keyword, keyword);
        model.addAttribute("students", students);
        model.addAttribute("keyword", keyword); // optional, to retain keyword in input
        return "pages/student-list";
    }

    
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Student student = studentRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid student Id: " + id));
        model.addAttribute("student", student);
        return "pages/student-edit"; // return student-edit.jsp
    }

    @PostMapping("/update/{id}")
    public String updateStudent(@PathVariable Long id, @ModelAttribute Student student) {
        student.setId(id);
        studentRepository.save(student);
        return "redirect:/students/list";
    }


    
    @GetMapping("/delete/{id}")
    public String confirmDelete(@PathVariable Long id, Model model) {
        Student student = studentRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Student not found"));
        model.addAttribute("student", student);
        return "pages/student-delete";
    }

    @PostMapping("/delete/{id}")
    public String deleteStudent(@PathVariable Long id) {
        studentRepository.deleteById(id);
        return "redirect:/students/list";
    }
    
    @GetMapping("/login")
    public String showLoginForm() {
        return "pages/login"; // views/login.jsp
    }

    @PostMapping("/doLogin")
    public String handleLogin(@RequestParam String username,
                              @RequestParam String password,
                              Model model) {
        if ("admin".equals(username) && "admin123".equals(password)) {
            return "redirect:/students/form"; 
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "pages/login";
        }
    }

}
