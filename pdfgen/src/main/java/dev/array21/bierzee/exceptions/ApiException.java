package dev.array21.bierzee.exceptions;

public class ApiException extends Exception {

    public enum Type {
        UNAUTHORIZED,
        RATE_LIMIT,
        OTHER,
    }

    private final Type type;

    public ApiException(String msg, Type type) {
        super(msg);

        this.type = type;
    }

    public ApiException(Type type) {
        this.type = type;
    }

    public Type getType() {
        return this.type;
    }

}
