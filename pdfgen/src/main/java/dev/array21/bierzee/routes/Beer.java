package dev.array21.bierzee.routes;

import dev.array21.bierzee.exceptions.ApiException;
import dev.array21.bierzee.pdf.ListItem;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@RequestMapping("/beer")
public class Beer {

    @CrossOrigin(origins = {"*"})
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody ResponseEntity<byte[]> list(@RequestHeader(value = "Authorization") String authorization) {
        dev.array21.bierzee.api.types.Beer[] beers;
        try {
            beers = dev.array21.bierzee.api.organization.Beer.list(authorization);
        } catch (IOException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        } catch (ApiException e) {
            switch (e.getType()) {
                case UNAUTHORIZED: return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
                case RATE_LIMIT: return new ResponseEntity<>(HttpStatus.TOO_MANY_REQUESTS);
                case OTHER: {
                    e.printStackTrace();
                    return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
                }
                default:
                    return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }

        byte[] pdfDocument;
        try {
            pdfDocument = ListItem.createPdf(beers);
        } catch (IOException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

        HttpHeaders pdfHeaders = new HttpHeaders();
        pdfHeaders.add("Content-Type", "application/pdf");
        return new ResponseEntity<>(pdfDocument, pdfHeaders, HttpStatus.OK);
    }
}