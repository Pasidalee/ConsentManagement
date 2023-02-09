import ballerina/http;

type Details record{
    string clientId;
    string consentId;
};

service /consent on new http:Listener(9090) {

    resource function post initiate(@http:Payload Details details) returns string|error {
        if details.clientId is "" {
            return error("A valid client ID must be provided");
        }
        return "Consent with consent ID " + details.consentId + " succesfully initiated";
    }

    resource function get [string consentId]() returns string|error {
        if consentId is "" {
            return error("A Consent ID must be given");
        }
        return "Consent resource";
    }
}
