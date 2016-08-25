package pl.mgrz.licznik.service;

import pl.mgrz.licznik.model.Refill;

import java.util.List;


public interface RefillService {

    Refill getRefill(int id);
    List<Refill> getRefillList();
    void addRefill(Refill refill, int id);
    void removeRefill(int id);
    Refill getLastRefill(int id);
}