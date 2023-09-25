import ballerina/grpc;
import ballerina/protobuf;

public const string LIBRARY_DESC = "0A0D6C6962726172792E70726F746F12076C696272617279228C010A0E416464426F6F6B5265717565737412140A057469746C6518012001280952057469746C6512190A08617574686F725F311802200128095207617574686F723112190A08617574686F725F321803200128095207617574686F7232121A0A086C6F636174696F6E18042001280952086C6F636174696F6E12120A046973626E18052001280952046973626E22250A0F416464426F6F6B526573706F6E736512120A046973626E18012001280952046973626E228F010A11557064617465426F6F6B5265717565737412120A046973626E18012001280952046973626E12140A057469746C6518022001280952057469746C6512190A08617574686F725F311803200128095207617574686F723112190A08617574686F725F321804200128095207617574686F7232121A0A086C6F636174696F6E18052001280952086C6F636174696F6E222E0A12557064617465426F6F6B526573706F6E736512180A076D65737361676518012001280952076D65737361676522270A1152656D6F7665426F6F6B5265717565737412120A046973626E18012001280952046973626E223D0A1252656D6F7665426F6F6B526573706F6E736512270A05626F6F6B7318012003280B32112E6C6962726172792E426F6F6B496E666F5205626F6F6B73221A0A184C697374426F72726F776564426F6F6B735265717565737422440A194C697374426F72726F776564426F6F6B73526573706F6E736512270A05626F6F6B7318012003280B32112E6C6962726172792E426F6F6B496E666F5205626F6F6B73221B0A194C697374417661696C61626C65426F6F6B735265717565737422450A1A4C697374417661696C61626C65426F6F6B73526573706F6E736512270A05626F6F6B7318012003280B32112E6C6962726172792E426F6F6B496E666F5205626F6F6B7322270A114C6F63617465426F6F6B5265717565737412120A046973626E18012001280952046973626E224E0A124C6F63617465426F6F6B526573706F6E7365121A0A086C6F636174696F6E18012001280952086C6F636174696F6E121C0A09617661696C61626C651802200128085209617661696C61626C6522400A11426F72726F77426F6F6B5265717565737412170A07757365725F6964180120012809520675736572496412120A046973626E18022001280952046973626E22480A12426F72726F77426F6F6B526573706F6E736512180A077375636365737318012001280852077375636365737312180A076D65737361676518022001280952076D657373616765225C0A11437265617465557365725265717565737412170A07757365725F69641801200128095206757365724964122E0A09757365725F7479706518022001280E32112E6C6962726172792E55736572547970655208757365725479706522480A1243726561746555736572526573706F6E736512180A077375636365737318012001280852077375636365737312180A076D65737361676518022001280952076D65737361676522A4010A08426F6F6B496E666F12140A057469746C6518012001280952057469746C6512190A08617574686F725F311802200128095207617574686F723112190A08617574686F725F321803200128095207617574686F7232121A0A086C6F636174696F6E18042001280952086C6F636174696F6E12120A046973626E18052001280952046973626E121C0A09617661696C61626C651806200128085209617661696C61626C65224F0A045573657212170A07757365725F69641801200128095206757365724964122E0A09757365725F7479706518022001280E32112E6C6962726172792E5573657254797065520875736572547970652A260A085573657254797065120B0A0753545544454E541000120D0A094C494252415249414E100132F9040A0E4C69627261727953657276696365123D0A086164645F626F6F6B12172E6C6962726172792E416464426F6F6B526571756573741A182E6C6962726172792E416464426F6F6B526573706F6E736512460A0B7570646174655F626F6F6B121A2E6C6962726172792E557064617465426F6F6B526571756573741A1B2E6C6962726172792E557064617465426F6F6B526573706F6E736512460A0B72656D6F76655F626F6F6B121A2E6C6962726172792E52656D6F7665426F6F6B526571756573741A1B2E6C6962726172792E52656D6F7665426F6F6B526573706F6E7365125C0A136C6973745F626F72726F7765645F626F6F6B7312212E6C6962726172792E4C697374426F72726F776564426F6F6B73526571756573741A222E6C6962726172792E4C697374426F72726F776564426F6F6B73526573706F6E7365125F0A146C6973745F617661696C61626C655F626F6F6B7312222E6C6962726172792E4C697374417661696C61626C65426F6F6B73526571756573741A232E6C6962726172792E4C697374417661696C61626C65426F6F6B73526573706F6E736512460A0B6C6F636174655F626F6F6B121A2E6C6962726172792E4C6F63617465426F6F6B526571756573741A1B2E6C6962726172792E4C6F63617465426F6F6B526573706F6E736512460A0B626F72726F775F626F6F6B121A2E6C6962726172792E426F72726F77426F6F6B526571756573741A1B2E6C6962726172792E426F72726F77426F6F6B526573706F6E736512490A0C6372656174655F7573657273121A2E6C6962726172792E43726561746555736572526571756573741A1B2E6C6962726172792E43726561746555736572526573706F6E73652801620670726F746F33";

public isolated client class LibraryServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, LIBRARY_DESC);
    }

    isolated remote function add_book(AddBookRequest|ContextAddBookRequest req) returns AddBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        AddBookRequest message;
        if req is ContextAddBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/add_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <AddBookResponse>result;
    }

    isolated remote function add_bookContext(AddBookRequest|ContextAddBookRequest req) returns ContextAddBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        AddBookRequest message;
        if req is ContextAddBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/add_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <AddBookResponse>result, headers: respHeaders};
    }

    isolated remote function update_book(UpdateBookRequest|ContextUpdateBookRequest req) returns UpdateBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        UpdateBookRequest message;
        if req is ContextUpdateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/update_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <UpdateBookResponse>result;
    }

    isolated remote function update_bookContext(UpdateBookRequest|ContextUpdateBookRequest req) returns ContextUpdateBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        UpdateBookRequest message;
        if req is ContextUpdateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/update_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <UpdateBookResponse>result, headers: respHeaders};
    }

    isolated remote function remove_book(RemoveBookRequest|ContextRemoveBookRequest req) returns RemoveBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        RemoveBookRequest message;
        if req is ContextRemoveBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/remove_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <RemoveBookResponse>result;
    }

    isolated remote function remove_bookContext(RemoveBookRequest|ContextRemoveBookRequest req) returns ContextRemoveBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        RemoveBookRequest message;
        if req is ContextRemoveBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/remove_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <RemoveBookResponse>result, headers: respHeaders};
    }

    isolated remote function list_borrowed_books(ListBorrowedBooksRequest|ContextListBorrowedBooksRequest req) returns ListBorrowedBooksResponse|grpc:Error {
        map<string|string[]> headers = {};
        ListBorrowedBooksRequest message;
        if req is ContextListBorrowedBooksRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/list_borrowed_books", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ListBorrowedBooksResponse>result;
    }

    isolated remote function list_borrowed_booksContext(ListBorrowedBooksRequest|ContextListBorrowedBooksRequest req) returns ContextListBorrowedBooksResponse|grpc:Error {
        map<string|string[]> headers = {};
        ListBorrowedBooksRequest message;
        if req is ContextListBorrowedBooksRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/list_borrowed_books", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ListBorrowedBooksResponse>result, headers: respHeaders};
    }

    isolated remote function list_available_books(ListAvailableBooksRequest|ContextListAvailableBooksRequest req) returns ListAvailableBooksResponse|grpc:Error {
        map<string|string[]> headers = {};
        ListAvailableBooksRequest message;
        if req is ContextListAvailableBooksRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/list_available_books", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ListAvailableBooksResponse>result;
    }

    isolated remote function list_available_booksContext(ListAvailableBooksRequest|ContextListAvailableBooksRequest req) returns ContextListAvailableBooksResponse|grpc:Error {
        map<string|string[]> headers = {};
        ListAvailableBooksRequest message;
        if req is ContextListAvailableBooksRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/list_available_books", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ListAvailableBooksResponse>result, headers: respHeaders};
    }

    isolated remote function locate_book(LocateBookRequest|ContextLocateBookRequest req) returns LocateBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        LocateBookRequest message;
        if req is ContextLocateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/locate_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <LocateBookResponse>result;
    }

    isolated remote function locate_bookContext(LocateBookRequest|ContextLocateBookRequest req) returns ContextLocateBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        LocateBookRequest message;
        if req is ContextLocateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/locate_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <LocateBookResponse>result, headers: respHeaders};
    }

    isolated remote function borrow_book(BorrowBookRequest|ContextBorrowBookRequest req) returns BorrowBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBookRequest message;
        if req is ContextBorrowBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/borrow_book", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BorrowBookResponse>result;
    }

    isolated remote function borrow_bookContext(BorrowBookRequest|ContextBorrowBookRequest req) returns ContextBorrowBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBookRequest message;
        if req is ContextBorrowBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("library.LibraryService/borrow_book", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BorrowBookResponse>result, headers: respHeaders};
    }

    isolated remote function create_users() returns Create_usersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("library.LibraryService/create_users");
        return new Create_usersStreamingClient(sClient);
    }
}

public client class Create_usersStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendCreateUserRequest(CreateUserRequest message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextCreateUserRequest(ContextCreateUserRequest message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveCreateUserResponse() returns CreateUserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <CreateUserResponse>payload;
        }
    }

    isolated remote function receiveContextCreateUserResponse() returns ContextCreateUserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <CreateUserResponse>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public client class LibraryServiceUpdateBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendUpdateBookResponse(UpdateBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextUpdateBookResponse(ContextUpdateBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceAddBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendAddBookResponse(AddBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextAddBookResponse(ContextAddBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceLocateBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendLocateBookResponse(LocateBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextLocateBookResponse(ContextLocateBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceCreateUserResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendCreateUserResponse(CreateUserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextCreateUserResponse(ContextCreateUserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceListBorrowedBooksResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendListBorrowedBooksResponse(ListBorrowedBooksResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextListBorrowedBooksResponse(ContextListBorrowedBooksResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceListAvailableBooksResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendListAvailableBooksResponse(ListAvailableBooksResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextListAvailableBooksResponse(ContextListAvailableBooksResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceRemoveBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendRemoveBookResponse(RemoveBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextRemoveBookResponse(ContextRemoveBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceBorrowBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBorrowBookResponse(BorrowBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBorrowBookResponse(ContextBorrowBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextCreateUserRequestStream record {|
    stream<CreateUserRequest, error?> content;
    map<string|string[]> headers;
|};

public type ContextRemoveBookRequest record {|
    RemoveBookRequest content;
    map<string|string[]> headers;
|};

public type ContextBorrowBookResponse record {|
    BorrowBookResponse content;
    map<string|string[]> headers;
|};

public type ContextListAvailableBooksRequest record {|
    ListAvailableBooksRequest content;
    map<string|string[]> headers;
|};

public type ContextAddBookRequest record {|
    AddBookRequest content;
    map<string|string[]> headers;
|};

public type ContextAddBookResponse record {|
    AddBookResponse content;
    map<string|string[]> headers;
|};

public type ContextRemoveBookResponse record {|
    RemoveBookResponse content;
    map<string|string[]> headers;
|};

public type ContextLocateBookRequest record {|
    LocateBookRequest content;
    map<string|string[]> headers;
|};

public type ContextLocateBookResponse record {|
    LocateBookResponse content;
    map<string|string[]> headers;
|};

public type ContextListAvailableBooksResponse record {|
    ListAvailableBooksResponse content;
    map<string|string[]> headers;
|};

public type ContextUpdateBookRequest record {|
    UpdateBookRequest content;
    map<string|string[]> headers;
|};

public type ContextListBorrowedBooksResponse record {|
    ListBorrowedBooksResponse content;
    map<string|string[]> headers;
|};

public type ContextBorrowBookRequest record {|
    BorrowBookRequest content;
    map<string|string[]> headers;
|};

public type ContextCreateUserResponse record {|
    CreateUserResponse content;
    map<string|string[]> headers;
|};

public type ContextUpdateBookResponse record {|
    UpdateBookResponse content;
    map<string|string[]> headers;
|};

public type ContextCreateUserRequest record {|
    CreateUserRequest content;
    map<string|string[]> headers;
|};

public type ContextListBorrowedBooksRequest record {|
    ListBorrowedBooksRequest content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type User record {|
    readonly string user_id = "";
    UserType user_type = STUDENT;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type RemoveBookRequest record {|
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowBookResponse record {|
    boolean success = false;
    string message = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type ListAvailableBooksRequest record {|
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookInfo record {|
    string title = "";
    string author_1 = "";
    string author_2 = "";
    string location = "";
    readonly string isbn = "";
    boolean available = false;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type AddBookRequest record {|
    string title = "";
    string author_1 = "";
    string author_2 = "";
    string location = "";
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type AddBookResponse record {|
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type RemoveBookResponse record {|
    BookInfo[] books = [];
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type LocateBookRequest record {|
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type LocateBookResponse record {|
    string location = "";
    boolean available = false;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type ListAvailableBooksResponse record {|
    BookInfo[] books = [];
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type UpdateBookRequest record {|
    string isbn = "";
    string title = "";
    string author_1 = "";
    string author_2 = "";
    string location = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type ListBorrowedBooksResponse record {|
    BookInfo[] books = [];
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowBookRequest record {|
    string user_id = "";
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type CreateUserResponse record {|
    boolean success = false;
    string message = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type UpdateBookResponse record {|
    string message = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type CreateUserRequest record {|
    string user_id = "";
    UserType user_type = STUDENT;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type ListBorrowedBooksRequest record {|
|};

public enum UserType {
    STUDENT, LIBRARIAN
}

