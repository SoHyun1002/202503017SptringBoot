package com.example.project.controller;

import com.example.project.model.FileEntity;
import com.example.project.service.FileService;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/files")
public class FileController {
    private final FileService fileService;

    public FileController(FileService fileService) {
        this.fileService = fileService;
    }

    @GetMapping
    public String listFiles(Model model) {
        List<FileEntity> files = fileService.getAllFiles();
        model.addAttribute("files", files);
        return "fileList";
    }

    @GetMapping("/upload")
    public String showUploadForm() {
        return "fileUpload";
    }

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file) throws IOException {
        fileService.uploadFile(file);
        return "redirect:/files";
    }

    @GetMapping("/download/{id}")
    public ResponseEntity<Resource> downloadFile(@PathVariable Long id) throws MalformedURLException {
        Optional<FileEntity> fileEntity = fileService.getFileById(id);
        if (fileEntity.isPresent()) {
            Path filePath = Paths.get(fileEntity.get().getFilePath());
            Resource resource = new UrlResource(filePath.toUri());
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileEntity.get().getFileName() + "\"")
                    .body(resource);
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping("/delete/{id}")
    public String deleteFile(@PathVariable Long id) {
        fileService.deleteFile(id);
        return "redirect:/files";
    }
}