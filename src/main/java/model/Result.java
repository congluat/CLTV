package model;

public class Result {
	boolean result;
	String cause;
	public Result() {
	}
	
	public Result(boolean result, String cause) {
		this.result=result;
		this.cause=cause;
	}

	public boolean getResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}
	
	
}
