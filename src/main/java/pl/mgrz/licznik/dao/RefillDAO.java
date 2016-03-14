package pl.mgrz.licznik.dao;

import pl.mgrz.licznik.model.Refill;

public interface RefillDAO {

    void addRefill(Refill refill, int id);
    void removeRefill(int id);
    Refill getRefillById(int id);
}