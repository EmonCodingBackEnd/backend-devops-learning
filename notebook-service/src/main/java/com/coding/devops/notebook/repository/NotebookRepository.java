package com.coding.devops.notebook.repository;

import com.coding.devops.notebook.entity.Notebook;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NotebookRepository extends CrudRepository<Notebook, Long> {

    List<com.coding.devops.notebook.entity.Notebook> findByName(String name);
}
