package pl.mgrz.licznik.exception;

@SuppressWarnings("serial")
public class UserAlreadyExistsException extends Exception {
	public UserAlreadyExistsException(String s) {
		super(s);
	}
}
