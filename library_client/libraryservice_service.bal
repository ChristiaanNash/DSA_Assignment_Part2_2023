import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: LIBRARY_DESC}
service "LibraryService" on ep {

    remote function add_book(AddBookRequest value) returns AddBookResponse|error {
    }
    remote function update_book(UpdateBookRequest value) returns UpdateBookResponse|error {
    }
    remote function remove_book(RemoveBookRequest value) returns RemoveBookResponse|error {
    }
    remote function list_borrowed_books(ListBorrowedBooksRequest value) returns ListBorrowedBooksResponse|error {
    }
    remote function list_available_books(ListAvailableBooksRequest value) returns ListAvailableBooksResponse|error {
    }
    remote function locate_book(LocateBookRequest value) returns LocateBookResponse|error {
    }
    remote function borrow_book(BorrowBookRequest value) returns BorrowBookResponse|error {
    }
    remote function create_users(stream<CreateUserRequest, grpc:Error?> clientStream) returns CreateUserResponse|error {
    }
}

