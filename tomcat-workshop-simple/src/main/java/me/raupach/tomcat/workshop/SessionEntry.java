package me.raupach.tomcat.workshop;

import java.io.Serializable;

public final class SessionEntry implements Serializable {
    
    private final String key;
    private final Object value;

    public SessionEntry(String key, Object value) {
        this.key = key;
        this.value = value;
    }

    public String getKey() {
        return key;
    }

    public Object getValue() {
        return value;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 53 * hash + (this.key != null ? this.key.hashCode() : 0);
        hash = 53 * hash + (this.value != null ? this.value.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final SessionEntry other = (SessionEntry) obj;
        if ((this.key == null) ? (other.key != null) : !this.key.equals(other.key)) {
            return false;
        }
        return !((this.value == null) ? (other.value != null) : !this.value.equals(other.value));
    }
    
}
