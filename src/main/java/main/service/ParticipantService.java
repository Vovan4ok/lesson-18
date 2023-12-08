package main.service;

import main.dao.ParticipantRepo;
import main.domain.Participant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParticipantService {
    @Autowired
    private ParticipantRepo participantRepo;

    public Participant readById(int id) {
        return participantRepo.readById(id);
    }
    public List<Participant> readAll() {
        return participantRepo.readAll();
    }
    public void save(Participant participant) {
        participantRepo.save(participant);
    }
    public void delete(int id) {
        participantRepo.delete(id);
    }
}
