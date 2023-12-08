package main.dao;

import main.domain.Participant;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ParticipantRepo {
    private List<Participant> participants = new ArrayList<>();

    @PostConstruct
    public void init() {
        Participant participant1 = new Participant(1, "Volodymyr", "vladimirzganiaiko@gmail.com", "L1", "Attack");
        Participant participant2 = new Participant(2, "Nastya", "nastya@gmail.com", "L3", "Defend");
        Participant participant3 = new Participant(3, "Ivan", "ivan@gmail.com", "L2", "Support");

        participants.add(participant1);
        participants.add(participant2);
        participants.add(participant3);
    }
    public Participant readById(int id) {
        return participants.stream().filter(x -> x.getId() == id).findFirst().orElse(null);
    }
    public List<Participant> readAll() {
        return participants;
    }
    public void save(Participant participant) {
        if(participant.getId() != null) {
            Participant participantForUpdate = readById(participant.getId());
            participantForUpdate.setName(participant.getName());
            participantForUpdate.setEmail(participant.getEmail());
            participantForUpdate.setLevel(participant.getLevel());
            participantForUpdate.setPrimarySkill(participant.getPrimarySkill());
            participants.set(participants.indexOf(participant), participantForUpdate);
        } else {
            participant.setId(participants.size() + 1);
            participants.add(participant);
        }
    }
    public void delete(int id) {
        participants.removeIf(participant -> participant.getId() == id);
    }
}
