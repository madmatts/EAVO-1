package pl.mgrz.licznik.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.mgrz.licznik.dao.RefillDAO;
import pl.mgrz.licznik.model.Refill;

import java.util.List;

@Service
@Transactional
public class RefillServiceImpl implements RefillService {

    @Autowired
    RefillDAO refillDAO;


    public Refill getRefill(int id) {
        return refillDAO.getRefillById(id);
    }

    public List<Refill> getRefillList() {
        return getRefillList();
    }

    public void addRefill(Refill refill, int id) {
        refillDAO.addRefill(refill,id);
    }

    public void removeRefill(int id) {
        refillDAO.removeRefill(id);
    }
}