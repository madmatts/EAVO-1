package pl.mgrz.licznik.exception;

@SuppressWarnings("serial")
public class EmailTakenException extends Exception {
	public EmailTakenException(String s) {
		super(s);
	}
}
