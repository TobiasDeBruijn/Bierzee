package dev.array21.bierzee.api;

import java.util.HashMap;

public class Common {

    public static HashMap<String, String> getDefaultHeaders(String authorization) {
        HashMap<String, String> map = new HashMap<>();
        map.put("Authorization", authorization);
        map.put("Accepts", "application/json");
        map.put("Content-Type", "application/json");
        map.put("User-Agent", "Bierzee PDF Generator");

        return map;
    }

}
