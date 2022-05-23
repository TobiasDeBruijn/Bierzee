package dev.array21.bierzee.api.organization;

import com.google.gson.Gson;
import dev.array21.bierzee.api.Common;
import dev.array21.bierzee.exceptions.ApiException;
import dev.array21.classvalidator.ClassValidator;
import dev.array21.classvalidator.Pair;
import dev.array21.httplib.Http;

import java.io.IOException;

public class Beer {

    private static class GetListBeerResponse {
        dev.array21.bierzee.api.types.Beer[] beers;
    }

    public static dev.array21.bierzee.api.types.Beer[] list(String authorization) throws ApiException, IOException {
        Http.ResponseObject responseObject = new Http().makeRequest(Http.RequestMethod.GET, "https://bierzee-v2.k8s.array21.dev/api/v1/organization/beer/list", null, null, null, Common.getDefaultHeaders(authorization));

        switch (responseObject.getResponseCode()) {
            case 200 -> {
                final Gson gson = new Gson();
                GetListBeerResponse getListBeerResponse = gson.fromJson(responseObject.getMessage(), GetListBeerResponse.class);
                Pair<Boolean, String> validationResult = ClassValidator.validateType(getListBeerResponse);
                if(validationResult.getA() == null || !validationResult.getA()) {
                    throw new ApiException(validationResult.getB(), ApiException.Type.OTHER);
                }
                return getListBeerResponse.beers;
            }
            case 401 -> throw new ApiException(ApiException.Type.UNAUTHORIZED);
            case 429 -> throw new ApiException(ApiException.Type.RATE_LIMIT);
            default -> throw new ApiException(responseObject.getConnectionMessage(), ApiException.Type.OTHER);
        }
    }
}
