package com.example.tpfinalmmerosacrmgroupe2.entity.repository;

import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProspectRepository extends CrudRepository<Prospect, Long> {

    @Query(value = "SELECT p FROM Prospect p WHERE p.userById = :id")
    List<Prospect> findAllProspectsByUserById_Id(long id);
}
