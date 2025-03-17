package com.example.project.service;

import com.example.project.model.FileEntity;
import com.example.project.repository.FileRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class FileService {
    private final FileRepository fileRepository;
    private final String uploadDir = "uploads/";

    public FileService(FileRepository fileRepository) {
        this.fileRepository = fileRepository;
    }

    @Transactional
    public FileEntity uploadFile(MultipartFile file) throws IOException {
        String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
        Path filePath = Paths.get(uploadDir + fileName);
        file.transferTo(filePath);

        FileEntity fileEntity = new FileEntity(fileName, filePath.toString());
        return fileRepository.save(fileEntity);
    }

    public List<FileEntity> getAllFiles() {
        return fileRepository.findAll();
    }

    public Optional<FileEntity> getFileById(Long id) {
        return fileRepository.findById(id);
    }

    @Transactional
    public void deleteFile(Long id) {
        Optional<FileEntity> fileEntity = fileRepository.findById(id);
        fileEntity.ifPresent(file -> {
            File fileOnDisk = new File(file.getFilePath());
            if (fileOnDisk.exists()) {
                fileOnDisk.delete();
            }
            fileRepository.deleteById(id);
        });
    }
}