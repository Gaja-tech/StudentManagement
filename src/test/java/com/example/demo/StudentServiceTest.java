package com.example.demo;

import com.example.demo.entity.Student;
import com.example.demo.repository.StudentRepository;
import com.example.demo.services.StudentService;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.*;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.*;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@SpringBootTest
public class StudentServiceTest {

    @InjectMocks
    private StudentService studentService;

    @Mock
    private StudentRepository studentRepository;

    private Student student;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
        student = new Student();
        student.setId(1L);
        student.setName("Gejendran");
        student.setDepartment("CSE");
    }

    @Test
    public void testSaveStudent() {
        when(studentRepository.save(student)).thenReturn(student);
        Student saved = studentService.save(student);
        assertEquals("Gejendran", saved.getName());
    }

    @Test
    public void testGetAllStudents() {
        when(studentRepository.findAll()).thenReturn(List.of(student));
        List<Student> result = studentService.getAllStudents();
        assertEquals(1, result.size());
    }

    @Test
    public void testGetStudentById() {
        when(studentRepository.findById(1L)).thenReturn(Optional.of(student));
        Optional<Student> found = studentService.getStudentById(1L);
        assertTrue(found.isPresent());
        assertEquals("Gejendran", found.get().getName());
    }

    @Test
    public void testDeleteById() {
        studentService.deleteById(1L);
        verify(studentRepository, times(1)).deleteById(1L);
    }

    @Test
    public void testSearchStudents() {
        when(studentRepository.findByNameContainingIgnoreCaseOrDepartmentContainingIgnoreCase("Gej", "Gej"))
            .thenReturn(List.of(student));
        List<Student> result = studentService.searchStudents("Gej");
        assertEquals(1, result.size());
    }
}
