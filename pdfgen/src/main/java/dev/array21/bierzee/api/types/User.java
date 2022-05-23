package dev.array21.bierzee.api.types;

import com.google.gson.annotations.SerializedName;
import dev.array21.classvalidator.annotations.Required;

public class User {
    @Required
    @SerializedName("login_id")
    public String loginId;
    @Required
    public String name;
    @Required
    public String id;
}
