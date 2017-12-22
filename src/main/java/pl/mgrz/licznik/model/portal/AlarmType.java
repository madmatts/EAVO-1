package pl.mgrz.licznik.model.portal;

/**
 * Created by MadMattz on 23.08.2016.
 */
public enum AlarmType {
    SUCCESS("success"),
    INFO("info"),
    WARNING("warning"),
    DANGER("danger");

    private final String alert;

    private AlarmType(String s) {
        alert = s;
    }

    public String toString() {
        return this.alert;
    }
}
