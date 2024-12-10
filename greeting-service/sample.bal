import ballerina/http;

type Greeting record {
    string 'from;
    string to;
    string message;
};

configurable CallbackEndpoint[] externalCallbacks = ?;

type CallbackEndpoint record {|   
 string name;   
 string url;    
 string msgType = "application/json";   
 string certPath = "";
 |};

service / on new http:Listener(8090) {
    resource function get .(string name) returns Greeting {
        Greeting greetingMessage = {"from" : "Choreo", "to" : name, "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }
}
