package dev.array21.bierzee.api.types;

import com.google.gson.annotations.SerializedName;
import dev.array21.bierzee.pdf.Listable;
import dev.array21.classvalidator.annotations.Required;

public class Beer implements Listable {
    @Required
    @SerializedName("consumed_by")
    public User consumedBy;
    @Required
    @SerializedName("consumed_at")
    public long consumedAt;

    @Override
    public String getName() {
        return "Beer";
    }

    @Override
    public String getAuthorName() {
        return this.consumedBy.name;
    }

    @Override
    public long getDate() {
        return this.consumedAt;
    }
}
