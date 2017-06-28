package pl.mgrz.licznik.model.abstractModel;

import javax.persistence.*;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Matts on 01.04.2017.
 */
public abstract class CarPart {

    public static final int ONE_YEAR = 365;


    protected int id;
    protected long replaceAtMileage;
    protected Date replaceDate;
    protected long replaceAfterDistance;
    protected int replaceInDays;

    public CarPart(long replaceAtMileage, Date replaceDate, long replaceAfterDistance, int replaceInDays, long mileage) {
        this.replaceAtMileage = replaceAtMileage;
        this.replaceDate = replaceDate;
        this.replaceAfterDistance = replaceAfterDistance;
        this.replaceInDays = replaceInDays;
    }

    @Id
    @GeneratedValue
    @Column(name = "id")
    public int getId() {
        return id;
    }

    @Column(name = "replaceAtMilage")
    public long getReplaceAtMileage() {
        return replaceAtMileage;
    }

    public void setReplaceAtMileage(long replaceAtMileage) {
        this.replaceAtMileage = replaceAtMileage;
    }

    @Column(name = "replaceDate")
    public Date getReplaceDate() {
        return replaceDate;
    }

    public void setReplaceDate(Date replaceDate) {
        this.replaceDate = replaceDate;
    }

    @Column(name = "replaceAfterDistance")
    public long getReplaceAfterDistance() {
        return replaceAfterDistance;
    }

    public void setReplaceAfterDistance(long replaceAfterDistance) {
        this.replaceAfterDistance = replaceAfterDistance;
    }

    @Column(name = "replaceInDays")
    public int getReplaceInDays() {
        return replaceInDays;
    }

    public void setReplaceInDays(int replaceInDays) {
        this.replaceInDays = replaceInDays;
    }

    public boolean isReplaceable() {
        Date today = new Date();
        long diff = today.getTime() - this.replaceDate.getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);

        Date todayDate = Calendar.getInstance().getTime();
        return diffDays > replaceInDays * 0.85;
    }

    public boolean isReplaceable(long vehicleMileage) {
        return ((this.replaceAtMileage + this.replaceAfterDistance) * 0.85) > vehicleMileage ? true : false;
    }


}
